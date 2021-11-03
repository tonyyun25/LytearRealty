package com.lytear.lytear.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lytear.lytear.reservation.model.Reservation;

@Repository
public interface ReservationDAO {

	public int insertReserveDate(
			@Param("userId") int userId
			,@Param("userNameTest") String userNameTest
			,@Param("reserveDate") String reserveDate
			,@Param("reserveTime") String reserveTime
			,@Param("realEstateId") int realEstateId
			);
	
	
	public List<Reservation> selectReservationList(
			@Param("userId") int userId
			);
	
	
	
}
