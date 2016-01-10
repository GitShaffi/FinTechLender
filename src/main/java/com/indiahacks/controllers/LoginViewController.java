package com.indiahacks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginViewController {

    @RequestMapping(path = {"/", "/login"}, method = RequestMethod.GET)
    public String login(ModelAndView modelAndView) {

        return "login";
    }
}
