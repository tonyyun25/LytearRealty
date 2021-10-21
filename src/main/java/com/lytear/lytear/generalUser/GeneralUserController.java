package com.lytear.lytear.generalUser;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/generalUser")

public class GeneralUserController {

	@GetMapping("/signin_view")
	public String signinView () {
		return "generalUser/signIn";
	}
	
	@GetMapping("/signup_view")
	public String signupView() {
		return "generalUser/signUp";
	}
	
	
	
}
