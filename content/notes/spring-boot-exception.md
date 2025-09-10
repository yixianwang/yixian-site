+++
title = 'Spring Boot Exception'
date = 2025-09-09T07:48:03-04:00
+++

## USER
in java 21, springboot 3, what's the best practice to handle exception in projects

## Thoughts
In Spring Boot 3, I’ll suggest using the ProblemDetail class (RFC7807) for structured error reports. Utilize @ControllerAdvice, @ExceptionHandler, and @RestControllerAdvice with logging (slf4j). Map exceptions to details like type, title, and status. While @ResponseStatus is still valid, consider customizing with WebMvcConfigurer for MVC and WebFlux.

## ASSISTANT
Great question. In Java 21 + Spring Boot 3 (Spring Framework 6), the “modern” best practice is to use **RFC 7807 Problem Details** everywhere, with a small, intentional exception hierarchy and a single global handler. Here’s a compact blueprint you can drop into any project.

# 1) Define a small, meaningful exception set
- Prefer **unchecked** domain exceptions (extend `RuntimeException`), e.g. `ResourceNotFoundException`, `BusinessRuleViolationException`, `ConflictException`.
- Keep messages developer-friendly; expose safe, client-facing text in the response body (not stack traces).
- Use Spring’s built-ins where appropriate (e.g. `MethodArgumentNotValidException`, `ConstraintViolationException`, `HttpMessageNotReadableException`, `DataIntegrityViolationException`).

```java
public class ResourceNotFoundException extends RuntimeException {
  public ResourceNotFoundException(String msg) { super(msg); }
}
```

# 2) Return RFC 7807 responses via ProblemDetail
Spring 6 introduces `ProblemDetail` and `ErrorResponse`/`ErrorResponseException`. Prefer these for consistent JSON errors.

```java
@RestControllerAdvice
public class GlobalExceptionHandler {

  @ExceptionHandler(ResourceNotFoundException.class)
  ProblemDetail handleNotFound(ResourceNotFoundException ex, HttpServletRequest req) {
    ProblemDetail pd = ProblemDetail.forStatus(HttpStatus.NOT_FOUND);
    pd.setTitle("Resource Not Found");
    pd.setDetail(ex.getMessage());
    pd.setInstance(URI.create(req.getRequestURI()));
    pd.setType(URI.create("https://example.com/problems/resource-not-found"));
    pd.setProperty("errorCode", "RES_404_001");
    return pd;
  }

  @ExceptionHandler(MethodArgumentNotValidException.class)
  ProblemDetail handleValidation(MethodArgumentNotValidException ex, HttpServletRequest req) {
    ProblemDetail pd = ProblemDetail.forStatus(HttpStatus.BAD_REQUEST);
    pd.setTitle("Validation Failed");
    pd.setDetail("One or more fields are invalid.");
    pd.setInstance(URI.create(req.getRequestURI()));
    var fieldErrors = ex.getBindingResult().getFieldErrors().stream()
        .map(fe -> Map.of("field", fe.getField(), "message", fe.getDefaultMessage()))
        .toList();
    pd.setProperty("violations", fieldErrors);
    return pd;
  }

  @ExceptionHandler(ConstraintViolationException.class)
  ProblemDetail handleConstraint(ConstraintViolationException ex, HttpServletRequest req) {
    ProblemDetail pd = ProblemDetail.forStatus(HttpStatus.BAD_REQUEST);
    pd.setTitle("Constraint Violation");
    pd.setDetail("One or more constraints were violated.");
    pd.setInstance(URI.create(req.getRequestURI()));
    var violations = ex.getConstraintViolations().stream()
        .map(v -> Map.of("path", v.getPropertyPath().toString(), "message", v.getMessage()))
        .toList();
    pd.setProperty("violations", violations);
    return pd;
  }

  // Fallback
  @ExceptionHandler(Exception.class)
  ProblemDetail handleUnknown(Exception ex, HttpServletRequest req) {
    // log full details server-side only
    ProblemDetail pd = ProblemDetail.forStatus(HttpStatus.INTERNAL_SERVER_ERROR);
    pd.setTitle("Internal Server Error");
    pd.setDetail("An unexpected error occurred. If the problem persists, contact support.");
    pd.setInstance(URI.create(req.getRequestURI()));
    pd.setType(URI.create("https://example.com/problems/internal"));
    return pd;
  }
}
```

Typical JSON (client-facing):
```json
{
  "type": "https://example.com/problems/validation-failed",
  "title": "Validation Failed",
  "status": 400,
  "detail": "One or more fields are invalid.",
  "instance": "/api/orders",
  "violations": [
    { "field": "email", "message": "must be a well-formed email address" }
  ],
  "errorCode": "VAL_400_002"
}
```

# 3) Use `ErrorResponseException` inside controllers/services when needed
If you must throw with an HTTP status from deep layers:

```java
throw new ErrorResponseException(HttpStatus.FORBIDDEN,
  ProblemDetail.forStatusAndDetail(HttpStatus.FORBIDDEN, "Not allowed for this account"), null);
```

# 4) Validation: prefer annotations + groups
- DTOs: `jakarta.validation` annotations + `@Valid`.
- For query/path validations: `@Validated` on controller + `ConstraintViolationException` handling (shown above).

```java
public record CreateUserRequest(
  @NotBlank String username,
  @Email String email
) {}
```

```java
@PostMapping("/users")
public UserDto create(@Valid @RequestBody CreateUserRequest req) { ... }
```

# 5) Logging & observability
- **Never** log stack traces at INFO/WARN. Use:
  - `ERROR` for server bugs (5xx),
  - `WARN` for client issues worth attention (e.g., repeated 4xx),
  - `INFO` for expected flows (optional),
  - `DEBUG/TRACE` during development.
- Add a **correlation/request ID** (e.g., from `X-Request-Id`) via a filter and put it in MDC so logs tie to a request. Return it back in responses.

```java
@Component
public class CorrelationIdFilter implements Filter {
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    String cid = Optional.ofNullable(((HttpServletRequest) request).getHeader("X-Request-Id"))
        .orElse(UUID.randomUUID().toString());
    try (MDC.MDCCloseable ignored = MDC.putCloseable("cid", cid)) {
      ((HttpServletResponse) response).setHeader("X-Request-Id", cid);
      chain.doFilter(request, response);
    }
  }
}
```

# 6) Transactions & rollback rules
- By default, **runtime exceptions** cause rollback; **checked exceptions** do not.
- If you throw checked exceptions and still want rollback: `@Transactional(rollbackFor = Exception.class)`.
- Keep business exceptions unchecked to align with default rollback semantics.

# 7) Don’t leak internals
- Avoid exposing DB keys, stack traces, or class names in `detail`.
- Map low-level exceptions to stable, documented **error codes**. Keep a central `ErrorCatalog` (enum or constants) and document them in your API spec.

# 8) Integrate with API docs
- If you use springdoc-openapi, define common error schemas (ProblemDetail with `violations`, `errorCode`) and reference them in endpoint responses for 4xx/5xx.

# 9) Configuration and defaults
- Keep Boot’s default `/error` path; but turn on helpful bits in non-prod only:
  - `server.error.include-message=never` (prod), `always` (local)
  - `server.error.include-binding-errors=never` (prod), `always` (local)
  - `server.error.include-exception=never`
- Centralize handler in one package and test it with `@WebMvcTest` or `@SpringBootTest`.

# 10) For reactive (WebFlux)
Same approach: `@RestControllerAdvice` + `ProblemDetail`. Use reactive equivalents (`ServerWebExchange` if you need the path for `instance`).

---

## TL;DR template (copy/paste)
1. Create a few custom `RuntimeException`s for domain errors.  
2. One `@RestControllerAdvice` that returns **ProblemDetail** for:
   - domain errors (404/409/422, etc.),
   - validation (`MethodArgumentNotValidException`, `ConstraintViolationException`),
   - parsing/binding (`HttpMessageNotReadableException`),
   - persistence (`DataIntegrityViolationException`),
   - a final catch-all `Exception` → 500.
3. Add correlation-ID filter + structured logging (MDC).  
4. Keep messages safe, publish stable `errorCode`s, document them in OpenAPI.  
5. Lean on default transaction rollback (unchecked exceptions).  

If you want, I can turn this into a small starter module (with tests) you can drop into your multi-module repo.

---

Awesome — here’s a pragmatic, **hybrid strategy** that uses `ProblemDetail`, `ErrorResponse`, and `ErrorResponseException` together without overengineering.

## 0) Goals

* One consistent JSON shape (RFC 7807).
* Minimal boilerplate for common cases.
* Clear separation: **domain errors** vs **framework/validation/infra**.
* Good logging + traceability.

## 1) Project layout (suggested)

```
com.example.shared.error
  ├─ ErrorCode.java           // stable catalog of error codes
  ├─ BaseAppException.java    // implements ErrorResponse
  ├─ NotFoundException.java   // extends BaseAppException
  ├─ ConflictException.java   // extends BaseAppException
  ├─ ValidationAdvice.java    // @RestControllerAdvice: validation & parsing
  └─ FallbackAdvice.java      // @RestControllerAdvice: 3rd-party, unknown
```

## 2) Prefer custom exceptions for domain errors (implement `ErrorResponse`)

Make **reusable domain exceptions** self-describing by implementing `ErrorResponse`, so you don’t need a handler for each.

```java
// ErrorCode is your stable, documented catalog
public enum ErrorCode {
  USER_NOT_FOUND("USR_404_001", "The user does not exist."),
  EMAIL_TAKEN("USR_409_002", "Email already in use.");
  // ...
  public final String code;
  public final String defaultMessage;
  ErrorCode(String code, String defaultMessage) { this.code = code; this.defaultMessage = defaultMessage; }
}
```

```java
public abstract class BaseAppException extends RuntimeException implements ErrorResponse {
  private final ProblemDetail body;
  private final HttpStatus status;

  protected BaseAppException(HttpStatus status, ErrorCode error, String detail, URI type, URI instance) {
    super(detail);
    this.status = status;
    this.body = ProblemDetail.forStatus(status);
    body.setTitle(error.defaultMessage);          // safe, client-facing summary
    body.setDetail(detail);                       // domain-specific detail (safe)
    body.setType(type != null ? type : URI.create("https://example.com/problems/" + error.code));
    if (instance != null) body.setInstance(instance);
    body.setProperty("errorCode", error.code);    // stable code for clients
  }

  @Override public ProblemDetail getBody()      { return body; }
  @Override public HttpStatusCode getStatusCode(){ return status; }
}
```

```java
public class NotFoundException extends BaseAppException {
  public NotFoundException(ErrorCode error, String detail, URI instance) {
    super(HttpStatus.NOT_FOUND, error, detail, null, instance);
  }
}

public class ConflictException extends BaseAppException {
  public ConflictException(ErrorCode error, String detail, URI instance) {
    super(HttpStatus.CONFLICT, error, detail, null, instance);
  }
}
```

**Usage (service or controller):**

```java
// Service layer
userRepo.findById(id).orElseThrow(() ->
    new NotFoundException(ErrorCode.USER_NOT_FOUND, "User %s not found".formatted(id), URI.create("/users/" + id)));
```

➡️ **Why**: The exception **already knows** how to serialize to a `ProblemDetail`. No per-type handler needed.

## 3) Use `ProblemDetail` in advice for framework/validation/infra

Keep two small advices to normalize validation, parsing, DB, security, etc.

```java
@RestControllerAdvice
class ValidationAdvice {

  @ExceptionHandler(MethodArgumentNotValidException.class)
  ProblemDetail handleInvalid(MethodArgumentNotValidException ex, HttpServletRequest req) {
    var pd = ProblemDetail.forStatus(HttpStatus.BAD_REQUEST);
    pd.setTitle("Validation Failed");
    pd.setDetail("One or more fields are invalid.");
    pd.setInstance(URI.create(req.getRequestURI()));
    pd.setType(URI.create("https://example.com/problems/validation"));
    pd.setProperty("violations", ex.getBindingResult().getFieldErrors().stream()
        .map(fe -> Map.of("field", fe.getField(), "message", fe.getDefaultMessage()))
        .toList());
    return pd;
  }

  @ExceptionHandler(ConstraintViolationException.class)
  ProblemDetail handleConstraint(ConstraintViolationException ex, HttpServletRequest req) {
    var pd = ProblemDetail.forStatus(HttpStatus.BAD_REQUEST);
    pd.setTitle("Constraint Violation");
    pd.setDetail("One or more constraints were violated.");
    pd.setInstance(URI.create(req.getRequestURI()));
    pd.setType(URI.create("https://example.com/problems/validation"));
    pd.setProperty("violations", ex.getConstraintViolations().stream()
        .map(v -> Map.of("path", v.getPropertyPath().toString(), "message", v.getMessage()))
        .toList());
    return pd;
  }
}
```

```java
@RestControllerAdvice
class FallbackAdvice {

  @ExceptionHandler(DataIntegrityViolationException.class)
  ProblemDetail handleDataIntegrity(DataIntegrityViolationException ex, HttpServletRequest req) {
    var pd = ProblemDetail.forStatus(HttpStatus.CONFLICT);
    pd.setTitle("Data Integrity Violation");
    pd.setDetail("A database constraint was violated.");
    pd.setInstance(URI.create(req.getRequestURI()));
    pd.setType(URI.create("https://example.com/problems/data-integrity"));
    return pd;
  }

  @ExceptionHandler(Exception.class)
  ProblemDetail handleUnknown(Exception ex, HttpServletRequest req) {
    // log with correlation id in MDC (see §6)
    var pd = ProblemDetail.forStatus(HttpStatus.INTERNAL_SERVER_ERROR);
    pd.setTitle("Internal Server Error");
    pd.setDetail("An unexpected error occurred. If the problem persists, contact support.");
    pd.setInstance(URI.create(req.getRequestURI()));
    pd.setType(URI.create("https://example.com/problems/internal");
    return pd;
  }
}
```

➡️ **Why**: Centralize all “generic” exceptions via `ProblemDetail` without custom types.

## 4) Use `ErrorResponseException` for quick one-offs

If you don’t need a custom class and want to bubble up an HTTP error from deep code:

```java
throw new ErrorResponseException(
  HttpStatus.FORBIDDEN,
  ProblemDetail.forStatusAndDetail(HttpStatus.FORBIDDEN, "Not allowed for this account"),
  null
);
```

Good for **rare** cases or **adapter layers** where you don’t want new exception types.

## 5) Simple decision checklist

* **Is it a recurring domain error?**
  ➜ Create/throw a custom exception that **extends `BaseAppException`** (implements `ErrorResponse`).
* **Is it a framework/validation/infra exception?**
  ➜ Let a **`@RestControllerAdvice` return `ProblemDetail`**.
* **Is it a one-off HTTP error from deep code?**
  ➜ **Throw `ErrorResponseException`** with a `ProblemDetail`.

## 6) Cross-cutting: logging, request ID, and safety

* Put a **correlation/request ID** (e.g., `X-Request-Id`) in MDC via a servlet filter and echo it in responses.
* Log **domain exceptions** at `WARN` (client-caused) or `INFO` (expected), and unknown/5xx at `ERROR`.
* Keep `detail` safe for clients; never expose stack traces, SQL, class names.

```java
server.error.include-message=never
server.error.include-binding-errors=never
server.error.include-exception=never
```

## 7) OpenAPI & clients

With springdoc-openapi, define a **Problem schema** once (ProblemDetail + `errorCode` + `violations`) and reference it for 4xx/5xx. This guarantees a predictable contract for frontend/other services.

## 8) Testing pattern

* `@WebMvcTest` for each advice class to snapshot JSON structure for typical exceptions.
* Service-layer tests that **assert thrown exception type** (`NotFoundException`, `ConflictException`, etc.).
* One integration test ensuring MDC/request-id is present on error responses.

---

## TL;DR

* **Domain errors**: custom exceptions that implement `ErrorResponse` (via an abstract `BaseAppException`).
* **Framework/validation/infra**: handle in global `@RestControllerAdvice` and **return `ProblemDetail`**.
* **Edge cases/one-offs**: **throw `ErrorResponseException`** with a prepared `ProblemDetail`.

If you want, tell me your package names and I’ll drop in ready-to-compile classes (with JUnit tests and a minimal sample controller) tailored to your repo.
