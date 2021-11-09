package com.lytear.lytear.reservation.model;

import java.util.List;

import com.lytear.lytear.realEstate.model.RealEstate;

public class ReservationDetail {

	private Reservation reservation;
//	private List<RealEstate> realEstateList;
	private RealEstate realEstate;
	// 구조 바뀌니 Data 꺼내는 방법도 바꿔야 한다
	// ReservationDetail -> Reservation 순서로 데이터 꺼낸다. 데이터를 꺼내는 El tag 구조를 새로 만든 구조로 맞춘다
	
	
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	
	public RealEstate getRealEstate() {
		return realEstate;
	}
	public void setRealEstate(RealEstate realEstate) {
		this.realEstate = realEstate;
	}
	
	
	
//	public List<RealEstate> getRealEstateList() {
//		return realEstateList;
//	}
//	public void setRealEstateList(List<RealEstate> realEstateList) {
//		this.realEstateList = realEstateList;
//	}
	
	
	
	
}
