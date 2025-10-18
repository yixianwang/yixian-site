+++
title = 'Springboot Exceptions'
date = 2025-10-18T01:58:22-04:00
+++

Great question. Here’s a pragmatic, Spring-friendly playbook for handling **runtime exceptions** cleanly and predictably.

# 1) Let them bubble to the right boundary

* **Don’t catch `RuntimeException` deep in your code** unless you’re adding context or translating it.
* Let it bubble to a **well-defined boundary** (controller, scheduled job, async worker) where you can convert it to:

  * a meaningful **HTTP error** (for web APIs), or
  * a **log + metric + retry** decision (for background work).
* This keeps code simple, avoids double-logging, and preserves stack traces.

# 2) Use a single global handler for web APIs

Prefer a **global** handler over per-controller handlers so behavior is uniform.

```java
@RestControllerAdvice
public class GlobalExceptionHandler {

    // Map *expected* domain errors (still unchecked) to 4xx
    @ExceptionHandler(DomainException.class)
    public ProblemDetail handleDomain(DomainException ex) {
        ProblemDetail p = ProblemDetail.forStatus(HttpStatus.UNPROCESSABLE_ENTITY);
        p.setTitle("Domain rule violated");
        p.setDetail(ex.getMessage());
        p.setProperty("code", ex.getCode()); // stable machine code
        return p;
    }

    // Fallback for unexpected runtime failures → 500
    @ExceptionHandler(RuntimeException.class)
    public ProblemDetail handleRuntime(RuntimeException ex) {
        ProblemDetail p = ProblemDetail.forStatus(HttpStatus.INTERNAL_SERVER_ERROR);
        p.setTitle("Internal error");
        p.setDetail("An unexpected error occurred.");
        return p; // log the exception separately (see §5)
    }
}
```

**Why `ProblemDetail`?** (Spring 6+) It implements RFC 9457 “Problem Details” — a clean, extensible error schema.

# 3) Classify exceptions up front

* **Domain/Business exceptions** (e.g., “insufficient funds”, “invalid state transition”) → custom unchecked types, mapped to **4xx**.
* **Infrastructure/Transient** (timeouts, DB deadlocks) → consider **retry/circuit breaker**.
* **Programming bugs** (NPE, `IllegalStateException`) → **500**; fix at source.

# 4) Prefer translation, not blanket catching

* At integration boundaries (DB, HTTP clients), **translate** low-level exceptions into your **domain/integration exceptions** with context.
* Avoid `catch (Exception e) { /* swallow */ }`.
* If you must catch, **rethrow** with added context (message fields like ids, state) and keep the original cause.

# 5) Log once, at the edge, with context

* **One log per failure** (usually in the global handler or job runner).
  Multiple logs for the same exception = noisy.
* Use **structured logging** (+ MDC) to attach requestId, userId, entityId, etc.
* Levels:

  * **WARN** for expected client mistakes (4xx you anticipate).
  * **ERROR** for real server faults (5xx).
* Never `printStackTrace`; use SLF4J and log the **exception object**.

```java
@ExceptionHandler(RuntimeException.class)
public ProblemDetail handleRuntime(RuntimeException ex, HttpServletRequest req) {
    log.error("Unhandled runtime exception path={} reqId={}", req.getRequestURI(),
              MDC.get("requestId"), ex);
    return ProblemDetail.forStatus(HttpStatus.INTERNAL_SERVER_ERROR);
}
```

# 6) Don’t expose internals to clients

* Return **stable error codes** and human-safe messages; keep stack traces out of responses.
* Put technical details in logs/metrics, not the API payload.

# 7) Validation first, not exceptions later

* Use method parameter validation (`@Validated`, `@NotNull`, etc.).
  Handle `MethodArgumentNotValidException` in your advice to return a clean 400 with field errors.

```java
@Override
protected ResponseEntity<Object> handleMethodArgumentNotValid(
    MethodArgumentNotValidException ex, HttpHeaders headers,
    HttpStatusCode status, WebRequest request) {

    var p = ProblemDetail.forStatus(HttpStatus.BAD_REQUEST);
    p.setTitle("Validation failed");
    p.setProperty("errors", ex.getBindingResult().getFieldErrors().stream()
        .map(err -> Map.of("field", err.getField(), "msg", err.getDefaultMessage()))
        .toList());
    return ResponseEntity.badRequest().body(p);
}
```

(# You can get this by extending `ResponseEntityExceptionHandler` or write your own.)

# 8) Transactions & retries

* **Transactions**: by default, Spring rolls back on `RuntimeException`. Keep it that way; avoid catching and “continuing”.
* **Retries**: wrap transient failures with **Resilience4j** (`@Retry`, circuit breakers, timeouts), and make write operations **idempotent**.

# 9) Async & scheduled jobs

* For `@Async`, register an `AsyncUncaughtExceptionHandler`.
* For scheduled tasks, wrap the job body with a top-level try/catch that logs once and decides on retry/alert.

```java
@Configuration
@EnableAsync
class AsyncCfg implements AsyncConfigurer {
    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return (ex, method, params) ->
            log.error("Uncaught async exception in {} with params={}", method, Arrays.toString(params), ex);
    }
}
```

# 10) Testing & contracts

* **Unit test** handlers and **slice tests** (`@WebMvcTest`) for representative failures.
* Publish an **error contract** (Problem Details schema + codes) so clients can rely on stable behavior.

---

## TL;DR checklist

* [ ] Let runtime exceptions **bubble**; handle at boundaries.
* [ ] Use **`@RestControllerAdvice` + `ProblemDetail`** for uniform API errors.
* [ ] **Classify**: domain (4xx), transient (retry), programming bug (5xx).
* [ ] **Log once** with MDC; sanitize responses.
* [ ] Validate early; handle validation errors as **400**.
* [ ] Respect transactional rollback; add **resilience** for transient faults.
* [ ] Cover async/scheduled pathways.
* [ ] Test handlers and document error codes.

If you share a snippet of your current handler or a specific failure mode you’re seeing (e.g., DB timeout vs. NPE), I can tailor the mappings and logging fields precisely to your stack.
