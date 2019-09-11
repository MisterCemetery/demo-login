package com.centertainment.demologin.dao;

import com.centertainment.demologin.entity.User;

public interface UserDao {

    User findByUserName(String userName);
    
    void save(User user);
    
}
