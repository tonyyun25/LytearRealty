package com.lytear.lytear.reservation;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lytear.lytear.reservation.bo.ReservationBO;

@RestController
@RequestMapping("/reservation")
public class ReservationRestController {

	@Autowired
	private ReservationBO reservationBO;
	
	@GetMapping("/sendRequest")
	public Map<String, String> send_request(
			@RequestParam("reserveDate") String reserveDate
			,@RequestParam("reserveTime") String reserveTime
			,@RequestParam("realEstateId") int realEstateId
			,HttpServletRequest request	
			
			
			){
		
		HttpSession session = request.getSession();
		
		
		int userId = (Integer)session.getAttribute("userId");
		String userNameTest = (String)session.getAttribute("userName");
		
		
		Map<String, String> result = new HashMap<>();
		int count = reservationBO.getReserveDate(userId, userNameTest, reserveDate, reserveTime, realEstateId);
		
		if(count == 1) {
			result.put("result", "success");
			
		} else {
			result.put("result", "fail");
		}
		
				
		return result; 
	}
	
	
	
}
