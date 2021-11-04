package com.lytear.lytear.reservation.model;

import java.util.List;

import com.lytear.lytear.realEstate.model.RealEstate;

public class ReservationDetail {

	private Reservation reservation;
	private List<RealEstate> realEstateList;
	
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public List<RealEstate> getRealEstateList() {
		return realEstateList;
	}
	public void setRealEstateList(List<RealEstate> realEstateList) {
		this.realEstateList = realEstateList;
	}
	
	
	
	
}
