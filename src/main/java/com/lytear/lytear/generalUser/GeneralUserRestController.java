package com.lytear.lytear.generalUser;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lytear.lytear.generalUser.bo.GeneralUserBO;
import com.lytear.lytear.generalUser.model.GeneralUser;

@RestController
@RequestMapping("/generalUser")
public class GeneralUserRestController {

	@Autowired
	private GeneralUserBO generalUserBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password 
			,@RequestParam("email") String email
			,@RequestParam("name") String name
			,@RequestParam("mobile") String mobile
			){
		
		Map<String, String> result = new HashMap<>();
		
		int count = generalUserBO.addUser(loginId, password, email, name, mobile);
		
		if(count == 1) {
			result.put("result","success");
		} else {
			result.put("result","failure");
		}
		
		return result;
	}
	
	@GetMapping("/is_duplicate_id")
	public Map<String, Boolean> isDuplicateId(
			@RequestParam("loginId") String loginId 
			
			) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(generalUserBO.isDuplicateId(loginId)) {
			result.put("is_duplicate", true);
		} else {
			result.put("is_duplicate", false);
		}
		
		
		return result;
	}
	
	
	
	
	
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpServletRequest request
			){
		
		
		
		Map<String, String> result = new HashMap<>();
		
		GeneralUser generalUser = generalUserBO.getUser(loginId, password);
		
		if(generalUser != null) {
			result.put("result","success");
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", generalUser.getId());
			session.setAttribute("userName", generalUser.getName());//signIn에 이렇게 저장해야 listing에서 불러올 수 있다
			
			
		} else {
			result.put("result","fail");
		}
		
		
		
		return result;
	}
	
	
	
}
