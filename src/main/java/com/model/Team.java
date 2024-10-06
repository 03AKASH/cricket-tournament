package com.model;

public class Team {
	private int id;
	private String name;
	private String coach;
	private String captain;
	private String city;
	private String logoUrl;
	private String coachImageUrl;
	private String captainImageUrl;
	private String cityImageUrl;
//	List<Player> players; 

	public Team() {
	}

	public Team(int id, String name, String coach, String captain, String city) {
		super();
		this.id = id;
		this.name = name;
		this.coach = coach;
		this.captain = captain;
		this.city = city;
	}

	public Team(int id, String name, String coach, String captain, String city, String logoUrl) {
		super();
		this.id = id;
		this.name = name;
		this.coach = coach;
		this.captain = captain;
		this.city = city;
		this.logoUrl = logoUrl;
	}

	public Team(int id, String name, String coach, String captain, String city, String logoUrl, String coachImageUrl,
			String captainImageUrl, String cityImageUrl) {
		super();
		this.id = id;
		this.name = name;
		this.coach = coach;
		this.captain = captain;
		this.city = city;
		this.logoUrl = logoUrl;
		this.coachImageUrl = coachImageUrl;
		this.captainImageUrl = captainImageUrl;
		this.cityImageUrl = cityImageUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCoach() {
		return coach;
	}

	public void setCoach(String coach) {
		this.coach = coach;
	}

	public String getCaptain() {
		return captain;
	}

	public void setCaptain(String captain) {
		this.captain = captain;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getCoachImageUrl() {
		return coachImageUrl;
	}

	public void setCoachImageUrl(String coachImageUrl) {
		this.coachImageUrl = coachImageUrl;
	}

	public String getCaptainImageUrl() {
		return captainImageUrl;
	}

	public void setCaptainImageUrl(String captainImageUrl) {
		this.captainImageUrl = captainImageUrl;
	}

	public String getCityImageUrl() {
		return cityImageUrl;
	}

	public void setCityImageUrl(String cityImageUrl) {
		this.cityImageUrl = cityImageUrl;
	}

}
