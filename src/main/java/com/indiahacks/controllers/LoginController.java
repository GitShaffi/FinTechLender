package com.indiahacks.controllers;

import com.indiahacks.models.User;
import com.indiahacks.services.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    @RequestMapping(path="/hello", method = RequestMethod.GET)
    private String index() {
        return "Greetings!";
    }

    @RequestMapping(path = "/acceptLoggedinUser", method = RequestMethod.POST, consumes = "application/json")
    public String acceptLoggedinUser(@RequestBody User user, HttpSession session) {
        if (user != null && user.isLoggedIn() && loginService.persistUserDataIfNew(user)) {
            session.setAttribute("user", user);
            return "{\"redirect\" : \"/home\"}";
        }

        return "{\"redirect\" : \"/login\"}";
    }

    @RequestMapping(path = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "{\"redirect\" : \"/login\"}";
    }
}
