package com.indiahacks.services;

import com.indiahacks.models.User;
import org.springframework.stereotype.Component;

@Component
public class LoginService {
    public boolean persistUserDataIfNew(User user){
        return true; // TODO: yet to wireup dbService
    }
}
