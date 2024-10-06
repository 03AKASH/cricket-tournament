package com.dao;

import java.sql.SQLException;
import java.util.List;

import com.model.Booking;
import com.model.Player;
import com.model.Team;
import com.model.TeamSchedule;

public interface TeamDao {
	void saveUser(User user) throws SQLException;

	User loginUser(String username, String password) throws SQLException;

	void addTeam(Team team) throws SQLException;

	void updateTeam(Team team) throws SQLException;

	void deleteTeam(int id) throws SQLException;

	Team getTeam(int id) throws SQLException;

	List<Team> getAllTeams() throws SQLException;

	List<TeamSchedule> getAllSchedules() throws SQLException;

	TeamSchedule getScheduleByMatchNo(int matchNo) throws SQLException;

	List<Player> getAllPlayers() throws SQLException;

	public List<TeamSchedule> searchSchedulesByTeamName(String teamName) throws SQLException;

	void bookTickets(Booking booking) throws SQLException;

	List<Booking> getBookingsByUserId(String userId) throws SQLException;

	boolean bookingExists(int matchId, String userId) throws SQLException;

	void cancelBooking(int bookingId) throws SQLException;

}
