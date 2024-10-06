package com.model;

import java.sql.Date;
import java.sql.Time;

public class Booking {
	private int id;
	private int matchNo;
	private String userId;
	private String username;
	private int numberOfTickets;
	private String ticketType;
	private double totalAmount;
	private Date matchDate;
	private Time matchTime;
	private String venue;
	private String teamName;
	private String opponentTeamName;

	public Booking() {
		super();
	}

	public Booking(int id, int matchNo, String userId, String username, int numberOfTickets, String ticketType,
			double totalAmount, Date matchDate, Time matchTime, String venue, String teamName,
			String opponentTeamName) {
		super();
		this.id = id;
		this.matchNo = matchNo;
		this.userId = userId;
		this.username = username;
		this.numberOfTickets = numberOfTickets;
		this.ticketType = ticketType;
		this.totalAmount = totalAmount;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.venue = venue;
		this.teamName = teamName;
		this.opponentTeamName = opponentTeamName;
	}

	public Booking(int matchNo, String userId, String username, int numberOfTickets, String ticketType,
			double totalAmount) {
		super();
		this.matchNo = matchNo;
		this.userId = userId;
		this.username = username;
		this.numberOfTickets = numberOfTickets;
		this.ticketType = ticketType;
		this.totalAmount = totalAmount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMatchNo() {
		return matchNo;
	}

	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getNumberOfTickets() {
		return numberOfTickets;
	}

	public void setNumberOfTickets(int numberOfTickets) {
		this.numberOfTickets = numberOfTickets;
	}

	public String getTicketType() {
		return ticketType;
	}

	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public Time getMatchTime() {
		return matchTime;
	}

	public void setMatchTime(Time matchTime) {
		this.matchTime = matchTime;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getOpponentTeamName() {
		return opponentTeamName;
	}

	public void setOpponentTeamName(String opponentTeamName) {
		this.opponentTeamName = opponentTeamName;
	}

}
