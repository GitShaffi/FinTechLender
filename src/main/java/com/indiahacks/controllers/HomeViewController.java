package com.indiahacks.controllers;

import com.indiahacks.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class HomeViewController {

    @RequestMapping("/home")
    public ModelAndView home(ModelAndView modelAndView, HttpSession session) {
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        return (user != null && user.isLoggedIn())? new ModelAndView("home","user_name",user.getName()): new ModelAndView("login");
    }

}
