package com.lytear.lytear.reservation.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservationDAO {

	public int insertReserveDate(
			@Param("userId") int userId
			,@Param("userNameTest") String userNameTest
			,@Param("reserveDate") String reserveDate
			,@Param("reserveTime") String reserveTime
			,@Param("realEstateId") int realEstateId
			);
	
	
}
