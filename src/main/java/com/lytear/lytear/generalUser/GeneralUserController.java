package com.lytear.lytear.generalUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/generalUser/signin_view" ;
	}
	
	
	
	
}
