package com.lytear.lytear.reservation.model;

import java.util.List;

public class ReservationDetail {

	private Reservation reservation;
	private List<Reservation> reservationList;
	
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public List<Reservation> getReservationList() {
		return reservationList;
	}
	public void setReservationList(List<Reservation> reservationList) {
		this.reservationList = reservationList;
	}
	
	
	
}
