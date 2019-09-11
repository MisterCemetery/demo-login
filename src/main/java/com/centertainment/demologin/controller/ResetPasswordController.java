package com.centertainment.demologin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.centertainment.demologin.email.EmailSender;
import com.centertainment.demologin.service.UserService;

@Controller
public class ResetPasswordController {

	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	@Autowired
	private UserService service;

	@PostMapping("/resetPassword")
	public String showResetPassword() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		
		com.centertainment.demologin.entity.User currentUser = service.findByUserName(user.getUsername());
		currentUser.setPassword(generatePassword(7));
		
		System.out.println(currentUser.getPassword());
		String newPassword = currentUser.getPassword();
		
		try {
			EmailSender.sendEmail("richard.makky@gmail.com", newPassword);
		} catch (Exception e) {
			return "home";
		}
		
		service.saveResettedUser(currentUser);
		
		return "reset-password";
	}

	private String generatePassword(int count) {

		StringBuilder builder = new StringBuilder();
		
		while (count-- != 0) {
			int character = (int) (Math.random() * ALPHA_NUMERIC_STRING.length());
			builder.append(ALPHA_NUMERIC_STRING.charAt(character));
		}
		
		return builder.toString();

	}

}
