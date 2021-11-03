package com.lytear.lytear.reservation.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lytear.lytear.reservation.dao.ReservationDAO;
import com.lytear.lytear.reservation.model.Reservation;

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
	
	//public List<Reservation> getReservationList(int userId) {
	public List<ReservationDetail> getReservationList(int userId) {
		
		
		//return reservationDAO.selectReservationList(userId);
		List<Reservation> reservationList = reservationDAO.selectReservationList(userId);
		List<ReservationDetail> reservationDetailList = new ArrayList<>();
		
		for(Reservation reservation : reservationList) {
			
			List<Reservation> reservationList = 
			
		}
		
		// 방문예약이 기준 (매물을 기준으로 방문예약 불러오는 게 아니라 방문예약(post 각각) 기준으로 매물(댓글)을 불러온다)
		// 방문예약 리스트를 먼저 가져오고, 반복문으로 리스트 하나씩 꺼내고
		// 거기에 들어있는 매물 id로 해당하는 매물정보를 select 해 오고
		// 그 정보를 새로 만든 detail 클래스에 set을 해 준다.
		// 방문 + 매물 객체 합쳐서 하나의 셋으로
		
	}
	
	
	
	
}
