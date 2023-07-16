package com.jonkenobi.crudsample.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HelloController {
    @GetMapping("/hello")
    public String dockerDemo() {
        return "Hello Dockerized Spring Boot Application";
    }
}