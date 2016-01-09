package com.indiahacks.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class HelloController {
    @RequestMapping("/hello")
    private String index() {
        return "Greetings!";
    }

    @RequestMapping("/jsontest")
    public @ResponseBody
    Map<String, String> callSomething () {

        Map<String, String> map = new HashMap<String, String>();
        map.put("url", "http://www.google.com");

        return map;
    }
}
