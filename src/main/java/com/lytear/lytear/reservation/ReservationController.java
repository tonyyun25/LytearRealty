package com.lytear.lytear.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	
	
	@GetMapping("/request")
	public String reservation_request() {
		
		return "reservation/reservationRequest";
	}
	
	@GetMapping("/list")
	public String reservation_list() {
		
		return "reservation/reservationList";
	}
	
	
	
}
