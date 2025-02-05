+++
title = 'Spring Boot Session'
date = 2025-02-05T07:22:27-05:00
+++

## Example
### Result
`common.Result`
```java
import lombok.Data;

@Data
public class Result {
    private Integer code;
    private String message;
    private Object data;
    
    protected Result(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
    
    public static Result OK() {
        return new Result(200, null, null);
    }
    
    public static Result success(Object data) {
        return new Result(200, null, data);
    }
    
    public static Result success(String message, Object data) {
        return new Result(200, message, data);
    }
}
```

### BackgroundController
`controller.BackgroundController`
```java
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BackgroundController {
    @GetMapping("background")
    public Result background() {
        return Result.success("backend data");
    }
}
```
> run the application and visit `http://localhost:8080/background` to see the result.

### LoginIntercept
`intercept.LoginIntercept`
```java
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginIntercept implements HandlerInterceptor {
    // return true, means continue, can acess following API
    // return false, means stop, immediately return result to client
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1. get HttpSession object
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userinfo") != null) {
            // means user has logged in
            return true;
        }
        // execute to here, means user has not logged in
        response.sendRedirect("/api/user/login");
        return false;
    }
}
```

### CustomMvcConfig
`config.CustomMvcConfig`
```java
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.method.HandlerTypePredicate;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import jakarta.annotation.Resource;

@Configuration
public class CustomMvcConfig implements WebMvcConfigurer {
    @Resource
    private LoginIntercept loginIntercept;
    
    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.addPathPrefix("api", HandlerTypePredicate.forAnnotation(RestController.class));
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginIntercept)
                .addPathPatterns("/**")
                .excludePathPatterns("/api/user/login");
    }
}
```

### UserController
`controller.UserController`
```java
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("user")
public class UserController {
    @GetMapping("login")
    public Result login(HttpServletRequest request, String username, String password) {
        if (StringUtils.hasLength(username) && StringUtils.hasLength(password)) {
            if (username.equals("admin") && password.equals("admin") {
                HttpSession session = request.getSession();
                session.setAttribute("userinfo", "userinfo");
                return Result.success("login success", true);
            }
        }
        return Result.success("login failed, please login first", false);
    }
    
    @GetMapping("logout")
    public Result logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("userinfo");
        return Result.OK();
    }
}
```

> run the application and visit `http://localhost:8080/background` to see if it reminds you `login failed, please login first` .

> visit `http://localhost:8080/user/login?username=admin&password=admin` to see the result, it should be `login success`.

> visit `http://localhost:8080/background` to see the result, it should be `backend data`.



















