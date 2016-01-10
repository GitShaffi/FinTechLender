package com.indiahacks.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    String id;
    String name;
    String email;
    String accessToken;

    public boolean isLoggedIn(){
        return this.id != null;
    }
}
