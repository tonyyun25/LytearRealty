package com.lytear.lytear.reservation.model;

import java.util.List;

import com.lytear.lytear.realEstate.model.RealEstate;

public class ReservationDetail {

	private Reservation reservation;
//	private List<RealEstate> realEstateList;
	private RealEstate realEstate;
	
	
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
