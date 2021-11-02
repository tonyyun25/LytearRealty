package com.lytear.lytear.reservation.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lytear.lytear.reservation.dao.ReservationDAO;

@Service
public class ReservationBO {

	@Autowired
	private ReservationDAO reservationDAO; 
	
	public int getReserveDate(
			
			int userId
			,String userNameTest
			,String reserveDate
			,String reserveTime
			,int realEstateId
			
			) {
		
		return reservationDAO.insertReserveDate(userId, userNameTest, reserveDate, reserveTime, realEstateId);
		
		
		
	}
	
	
}
