package com.centertainment.demologin.service;

import com.centertainment.demologin.entity.User;
import com.centertainment.demologin.user.CrmUser;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(CrmUser crmUser);

	void saveResettedUser(User currentUser);
}
