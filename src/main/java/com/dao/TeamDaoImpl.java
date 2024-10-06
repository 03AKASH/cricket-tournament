package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.model.Booking;
import com.model.Player;
import com.model.Team;
import com.model.TeamSchedule;
import com.util.DBUtil;

public class TeamDaoImpl implements TeamDao {

	@Override
	public void saveUser(User user) throws SQLException {
		String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getEmail());
		stmt.setString(3, user.getPassword());
		stmt.setString(4, user.getRole());
		stmt.executeUpdate();
	}

	@Override
	public User loginUser(String username, String password) throws SQLException {
		User user = null;
		String sql = "SELECT * FROM users where email = ? AND password = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, username);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();

		if (rs.next()) {
			user = new User();
			user.setId(rs.getInt("user_id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setEmail(rs.getString("email"));
			user.setRole(rs.getString("role"));
		}

		return user;
	}

	@Override
	public void addTeam(Team team) throws SQLException {
		String sql = "INSERT INTO teams (name, coach) VALUES (?, ?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, team.getName());
		stmt.setString(2, team.getCoach());
		stmt.executeUpdate();
	}

	@Override
	public void updateTeam(Team team) throws SQLException {
		String sql = "UPDATE teams SET name = ?, coach = ?, captain = ?, city = ? WHERE id = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, team.getName());
		stmt.setString(2, team.getCoach());
		stmt.setString(3, team.getCaptain());
		stmt.setString(4, team.getCity());
		stmt.setInt(5, team.getId());
		stmt.executeUpdate();
	}

	@Override
	public void deleteTeam(int id) throws SQLException {
		String sql = "DELETE FROM teams WHERE id = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, id);
		stmt.executeUpdate();
	}

	@Override
	public Team getTeam(int id) throws SQLException {
		String sql = "SELECT * FROM teams WHERE id = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		Team team = null;
		if (rs.next()) {
			team = new Team();
			team.setId(rs.getInt("id"));
			team.setName(rs.getString("name"));
			team.setCoach(rs.getString("coach"));
			team.setCaptain(rs.getString("captain"));
			team.setCity(rs.getString("city"));
			team.setLogoUrl(rs.getString("logo"));
			team.setCoachImageUrl(rs.getString("coachImg"));
			team.setCaptainImageUrl(rs.getString("captainImg"));
			team.setCityImageUrl(rs.getString("cityImg"));
		}

		return team;
	}

	@Override
	public List<Team> getAllTeams() throws SQLException {
		List<Team> teams = new ArrayList<>();
		String sql = "SELECT * FROM teams";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String coach = rs.getString("coach");
			String captain = rs.getString("captain");
			String city = rs.getString("city");
			String logo = rs.getString("logo");

			Team team = new Team(id, name, coach, captain, city, logo);
			teams.add(team);
		}
		return teams;
	}

	@Override
	public List<TeamSchedule> getAllSchedules() throws SQLException {

		List<TeamSchedule> schedules = new ArrayList<>();

		String sql = "SELECT ts.match_no, ts.team_id, ts.opponent_team_id, ts.match_date, ts.match_time, ts.venue, "
				+ "t1.name AS team_name, t2.name AS opponent_team_name " + "FROM team_schedule ts "
				+ "INNER JOIN teams t1 ON ts.team_id = t1.id " + "INNER JOIN teams t2 ON ts.opponent_team_id = t2.id "
				+ "ORDER BY ts.match_no ASC;";

		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			int matchNo = rs.getInt("match_no");
			int teamId = rs.getInt("team_id");
			int opponentTeamId = rs.getInt("opponent_team_id");
			String teamName = rs.getString("team_name");
			String opponentTeamName = rs.getString("opponent_team_name");
			Date matchDate = rs.getDate("match_date");
			Time matchTime = rs.getTime("match_time");
			String venue = rs.getString("venue");
			TeamSchedule teamSchedule = new TeamSchedule(matchNo, teamId, opponentTeamId, teamName, opponentTeamName,
					matchDate, matchTime, venue);
			schedules.add(teamSchedule);
		}
		return schedules;
	}

	@Override
	public List<Player> getAllPlayers() throws SQLException {
		List<Player> players = new ArrayList<>();

		String sql = "SELECT p.id, p.name AS player_name, p.team AS team_id, t.name AS team_name, p.role, p.image FROM players AS p INNER JOIN teams AS t ON p.team = t.id";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			int playerId = rs.getInt("id");
			String playerName = rs.getString("player_name");
			int teamId = rs.getInt("team_id");
			String teamName = rs.getString("team_name");
			String role = rs.getString("role");
			String image = rs.getString("image");

			Player player = new Player(playerId, playerName, teamId, teamName, role, image);
			players.add(player);
		}

		return players;
	}

	@Override
	public List<TeamSchedule> searchSchedulesByTeamName(String teamName) throws SQLException {
		List<TeamSchedule> schedules = new ArrayList<>();
		String sql = "SELECT t1.name AS team_name, t2.name AS opponent_team_name, ts.match_no, ts.match_date, ts.match_time, ts.venue \r\n"
				+ "FROM team_schedule ts \r\n" + "INNER JOIN teams t1 ON ts.team_id = t1.id \r\n"
				+ "INNER JOIN teams t2 ON ts.opponent_team_id = t2.id \r\n" + "WHERE t1.name LIKE ? OR t2.name LIKE ?;";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + teamName + "%");
		stmt.setString(2, "%" + teamName + "%");
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			TeamSchedule schedule = new TeamSchedule();
			schedule.setMatchNo(rs.getInt("match_no"));
			schedule.setTeamName(rs.getString("team_name"));
			schedule.setOpponentTeamName(rs.getString("opponent_team_name"));
			schedule.setMatchDate(rs.getDate("match_date"));
			schedule.setMatchTime(rs.getTime("match_time"));
			schedule.setVenue(rs.getString("venue"));
			schedules.add(schedule);
		}
		return schedules;
	}

	@Override
	public void bookTickets(Booking booking) throws SQLException {
		String sql = "INSERT INTO bookings (match_no, user_id, username, tickets, ticket_type, total_amount) VALUES (?, ?, ?, ?, ?, ?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, booking.getMatchNo());
		stmt.setString(2, booking.getUserId());
		stmt.setString(3, booking.getUsername());
		stmt.setInt(4, booking.getNumberOfTickets());
		stmt.setString(5, booking.getTicketType());
		stmt.setDouble(6, booking.getTotalAmount());
		stmt.executeUpdate();
	}

	@Override
	public List<Booking> getBookingsByUserId(String userId) throws SQLException {
		String sql = "SELECT b.id AS booking_id, ts.match_date, ts.match_time, ts.venue, ts.match_no, ts.team_id, ts.opponent_team_id, ts.match_date, ts.match_time, ts.venue, \r\n"
				+ "				t1.name AS team_name, t2.name AS opponent_team_name, b.tickets, b.user_id, b.ticket_type \r\n"
				+ "				FROM team_schedule ts INNER JOIN teams t1 ON ts.team_id = t1.id \r\n"
				+ "				INNER JOIN teams t2 ON ts.opponent_team_id = t2.id \r\n"
				+ "				INNER JOIN bookings b ON b.match_no = ts.match_no WHERE b.user_id = ? \r\n"
				+ "				ORDER BY ts.match_no ASC;\r\n" + "";

		List<Booking> bookings = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, userId);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("booking_id");
			int matchNo = rs.getInt("match_no");
			String userId1 = rs.getString("user_id");
			int tickets = rs.getInt("tickets");
			String ticketType = rs.getString("ticket_type");
			String teamName = rs.getString("team_name");
			String opponetTeamName = rs.getString("opponent_team_name");
			Date matchDate = rs.getDate("match_date");
			Time matchTime = rs.getTime("match_time");
			String venue = rs.getString("venue");

			bookings.add(new Booking(id, matchNo, userId1, userId, tickets, ticketType, tickets, matchDate, matchTime,
					venue, teamName, opponetTeamName));
		}

		return bookings;
	}

	@Override
	public boolean bookingExists(int matchId, String userId) throws SQLException {
		String sql = "SELECT COUNT(*) FROM bookings WHERE match_id = ? AND user_id = ?";
		try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, matchId);
			stmt.setString(2, userId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		}
		return false;
	}

	@Override
	public TeamSchedule getScheduleByMatchNo(int matchNo) throws SQLException {
		String sql = "SELECT t1.name AS team_name, t1.id AS team_id, t2.name AS opponent_team_name, ts.match_no, ts.match_date, ts.match_time, ts.venue \r\n"
				+ "FROM team_schedule ts \r\n" + "INNER JOIN teams t1 ON ts.team_id = t1.id \r\n"
				+ "INNER JOIN teams t2 ON ts.opponent_team_id = t2.id \r\n" + "WHERE match_no = ?;";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, matchNo);
		ResultSet rs = stmt.executeQuery();
		TeamSchedule schedule = null;
		while (rs.next()) {
			schedule = new TeamSchedule();
			schedule.setMatchNo(rs.getInt("match_no"));
			schedule.setTeamName(rs.getString("team_name"));
			schedule.setTeamId(rs.getInt("team_id"));
			schedule.setOpponentTeamName(rs.getString("opponent_team_name"));
			schedule.setMatchDate(rs.getDate("match_date"));
			schedule.setMatchTime(rs.getTime("match_time"));
			schedule.setVenue(rs.getString("venue"));
		}
		
		return schedule;
	}

	@Override
	public void cancelBooking(int bookingId) throws SQLException {
		String sql = "DELETE FROM bookings WHERE id = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, bookingId);
		stmt.executeUpdate();
	}

}
