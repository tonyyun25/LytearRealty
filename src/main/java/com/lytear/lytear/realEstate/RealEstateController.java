package com.lytear.lytear.realEstate;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lytear.lytear.realEstate.bo.RealEstateBO;
import com.lytear.lytear.realEstate.model.RealEstate;

@Controller
@RequestMapping("/real_estate")
public class RealEstateController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@GetMapping("/listing") // 매물 등록
	public String realEstateListing() {
		
		return "realEstate/listing";
	}
	
	@RequestMapping("/view_list") // 등록된 매물 보여주는 화면
	public String viewlist(
			Model model
			, HttpServletRequest request
			
			) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<RealEstate> realEstateList = realEstateBO.getRealEstateList(userId);
		
		model.addAttribute("realEstateList",realEstateList);
		
		return "realEstate/viewList";
	}
	
	
	
}
