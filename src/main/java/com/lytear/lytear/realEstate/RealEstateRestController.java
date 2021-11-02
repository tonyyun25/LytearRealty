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
		
		/* RealEsate의 객체를 새로 만들어야 realEstateId를 session에 저장할 수 있는지?
		 * session.setAttribute("realEstateId", realEstate.getId());
		 * 
		 * 매물리스트 중에서 내가 선택한 매물. => 방문 예약 정보. 
		 * 매물ID 단발성 위해 세션 사용하는 것은 좋지 않아 (서버/클 유지되어 계속 사용할 것이 세션 이용해 적합)
		 * 매물 화면에서 클릭했을 때 매물 ID를 이 페이지로 전달 => 파라미터
		 * 
		 * 
		 * */
		
		
		
		
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
