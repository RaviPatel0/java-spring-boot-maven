package com.example.helloworldspringbootpom;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingsController {

    @GetMapping("/")
    public String getGreeting() {
        return "Hello World! - Automation is completed";
    }
}
