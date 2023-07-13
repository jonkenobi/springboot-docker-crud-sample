package com.jonkenobi.crudsample.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/docker")
    public String dockerDemo(){
        return "Dockerizing Spring Boot Application";
    }
}
