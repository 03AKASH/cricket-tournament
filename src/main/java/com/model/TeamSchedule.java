package com.model;

import java.sql.Date;
import java.sql.Time;

public class TeamSchedule {
	private int matchNo;
	private int teamId;
	private int opponentTeamId;
	private String teamName;
	private String opponentTeamName;
	private Date matchDate;
	private Time matchTime;
	private String venue;
	

	public TeamSchedule() {
		super();
	}

	public TeamSchedule(int matchNo, int teamId, int opponentTeamId, String teamName, String opponentTeamName,
			Date matchDate, Time matchTime, String venue) { 
		super();
		this.matchNo = matchNo;
		this.teamName = teamName;
		this.opponentTeamName = opponentTeamName; 
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.venue = venue;
		this.teamId = teamId;
		this.opponentTeamId = opponentTeamId;
	}

	public int getMatchNo() {
		return matchNo;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getOpponentTeamId() {
		return opponentTeamId;
	}

	public void setOpponentTeamId(int oppenentTeamId) {
		this.opponentTeamId = oppenentTeamId;
	}

	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
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

}
