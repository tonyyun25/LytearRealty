package com.lytear.lytear.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lytear.lytear.reservation.bo.ReservationBO;
import com.lytear.lytear.reservation.model.ReservationDetail;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationBO reservationBO;
	
	@GetMapping("/request")
	public String reservation_request() {
		
		return "reservation/reservationRequest";
	}
	
	@GetMapping("/list_view")
	public String reservation_list(
			Model model
			, HttpServletRequest request
			
			) {
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
		
//			List<Reservation> reservationList = reservationBO.getReservationList(userId);
			List<ReservationDetail> reservationList = reservationBO.getReservationList(userId);
			model.addAttribute("reservationList",reservationList);
			
		
		return "reservation/reservationList";
	}
	
	
	
	
	
}
