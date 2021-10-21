package com.lytear.lytear.realEstate;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lytear.lytear.realEstate.bo.RealEstateBO;


@RestController
@RequestMapping("/real_estate")
public class RealEstateRestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	
	@PostMapping("/listUp")
	public Map<String, String> get_list(
			@RequestParam(value = "file") MultipartFile file 
			,@RequestParam("memberType") String memberType 
			,@RequestParam("type") String type 
			,@RequestParam("address") String address 
			,@RequestParam("space") double space 
			,@RequestParam("price") int price 
			,@RequestParam("downPayment") int downPayment 
			,@RequestParam("rent") int rent 
			,@RequestParam("complexNumber") int complexNumber 
			,@RequestParam("housingUnitNumber") int housingUnitNumber 
			,@RequestParam("residence") String residence 
			,@RequestParam("moveInDate") String moveInDate 
			,@RequestParam("option") String option 
			,@RequestParam("others") String others 
			,@RequestParam("startDate") String startDate
			,@RequestParam("endDate") String endDate 
			
			
			,HttpServletRequest request
			
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userNameTest = (String)session.getAttribute("userName");
		
		
		Map<String, String> result = new HashMap<>();
		int count = realEstateBO.addList(userId, userNameTest, file, memberType, type, address, space, price, downPayment, rent, complexNumber, housingUnitNumber, residence, moveInDate, option, others, startDate, endDate);
		
		if(count == 1) {
			result.put("result","success");
			
		} else {
			result.put("result","fail");
		}
		
		return result;
	}
	
}
