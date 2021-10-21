package com.lytear.lytear.realEstate;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lytear.lytear.realEstate.bo.RealEstateBO;

@Controller
@RequestMapping("/real_estate")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@GetMapping("/listing")
	public String realEstateListing() {
		
		return "realEstate/listing";
	}
	
	
	
	
}
