package com.controller;

import com.dao.TeamDao;
import com.dao.TeamDaoImpl;
import com.dao.User;
import com.model.Booking;
import com.model.Player;
import com.model.Team;
import com.model.TeamSchedule;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
@MultipartConfig
public class TeamController extends HttpServlet {
	private TeamDao teamDAO;

	public void init() {
		teamDAO = new TeamDaoImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/register":
			registerUser(request, response);
			break;
		case "/login":
			loginUser(request, response);
			break;
		case "/add":
			addTeam(request, response);
			break;
		case "/update":
			updateTeam(request, response);
			break;
		case "/booking":
			bookTicket(request, response);
			break;
		case "/confirm":
			confirmTicket(request, response);
			break;
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/home":
			showHomePage(request, response);
			break;
		case "/register":
			showRegisterForm(request, response);
			break;
		case "/login":
			showLoginForm(request, response);
			break;
		case "/new":
			showNewForm(request, response);
			break;
		case "/edit":
			showEditform(request, response);
			break;
		case "/delete":
			deleteTeam(request, response);
			break;
		case "/schedule":
			scheduleList(request, response);
			break;
		case "/view":
			showTeamDetails(request, response);
			break;
		case "/list":
			listTeam(request, response);
			break;
		case "/logout":
			logoutUser(request, response);
			break;
		case "/bookings":
			userBookings(request, response);
			break;
		case "/bookingPage":
			showBookingPage(request, response);
			break;
		case "/deleteTicket":
			cancelTicket(request, response);
			break;

		default:
			showLoginForm(request, response);
		}
	}

	private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

	private void showBookingPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String teamId = request.getParameter("teamId");

		TeamSchedule teamSchedule = null;
		int matchNo = Integer.parseInt(request.getParameter("matchNo"));
		try {
			teamSchedule = teamDAO.getScheduleByMatchNo(matchNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("teamSchedule", teamSchedule);
		request.setAttribute("teamId", teamId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ticket-booking.jsp");
		dispatcher.forward(request, response);
	}

	private void userBookings(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		String userId = ((User) request.getSession().getAttribute("user")).getEmail();
		List<Booking> bookingList = null;
		try {
			bookingList = teamDAO.getBookingsByUserId(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("bookingList", bookingList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-bookings.jsp");
		dispatcher.forward(request, response);
	}

	private void bookTicket(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

//		String userId = ((User) request.getSession().getAttribute("user")).getEmail();
		int matchNo = Integer.parseInt(request.getParameter("matchNo"));
		int numberOftickets = Integer.parseInt(request.getParameter("tickets"));
		double totalAmount = Double.parseDouble(request.getParameter("amount"));
		String username = request.getParameter("name");
		String ticketType = request.getParameter("ticketType");
		String source = request.getParameter("source");
		String teamId = request.getParameter("teamId");

		try {
			request.setAttribute("matchNo", matchNo);
			request.setAttribute("tickets", numberOftickets);
			request.setAttribute("totalAmount", totalAmount);
			request.setAttribute("username", username);
			request.setAttribute("ticketType", ticketType);
			request.setAttribute("source", source);
			request.setAttribute("teamId", teamId);

			TeamSchedule teamSchedule = teamDAO.getScheduleByMatchNo(matchNo);
			request.setAttribute("teamSchedule", teamSchedule);

			RequestDispatcher dispatcher = request.getRequestDispatcher("booking-confirmation.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void confirmTicket(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = ((User) request.getSession().getAttribute("user")).getEmail();
		int matchNo = Integer.parseInt(request.getParameter("matchNo"));
		int numberOftickets = Integer.parseInt(request.getParameter("tickets"));
		double totalAmount = Double.parseDouble(request.getParameter("amount"));
		String username = request.getParameter("name");
		String ticketType = request.getParameter("ticketType");
		String source = request.getParameter("source");
		String teamId = request.getParameter("teamId");

		Booking booking = new Booking(matchNo, userId, username, numberOftickets, ticketType, totalAmount);
		try {
			teamDAO.bookTickets(booking);
			request.setAttribute("bookingConfirmed", true);
			TeamSchedule teamSchedule = teamDAO.getScheduleByMatchNo(matchNo);
			request.setAttribute("teamSchedule", teamSchedule);
			request.setAttribute("matchNo", matchNo);
			request.setAttribute("tickets", numberOftickets);
			request.setAttribute("totalAmount", totalAmount);
			request.setAttribute("username", username);
			request.setAttribute("ticketType", ticketType);
			request.setAttribute("source", source);
			request.setAttribute("teamId", teamId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("booking-confirmation.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void cancelTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int bookingId = Integer.parseInt(request.getParameter("bookingId"));
		try {
			teamDAO.cancelBooking(bookingId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("bookings");
	}

	private void logoutUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("login");
	}

	private void showLoginForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("user-login.jsp");
		requestDispatcher.forward(request, response);
	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(username + " " + password);

		try {
			User user = teamDAO.loginUser(username, password);
			if (user != null) {
				request.getSession().setAttribute("user", user);
				response.sendRedirect("home.jsp");
			} else {
				request.setAttribute("message", "Invalid credentials");
				RequestDispatcher dispatcher = request.getRequestDispatcher("user-login.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void showRegisterForm(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("user-register.jsp");
		requestDispatcher.forward(request, response);
	}

	private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		User user = new User(username, email, password, "USER");
		try {
			teamDAO.saveUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("user-login.jsp");

	}

	private void showTeamDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		int id = Integer.parseInt(request.getParameter("id"));
		Team team = null;
		List<TeamSchedule> schedules = null;
		List<Player> players = null;
		try {
			team = teamDAO.getTeam(id);
			schedules = teamDAO.getAllSchedules();
			players = teamDAO.getAllPlayers();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("team", team);
		request.setAttribute("schedules", schedules);
		request.setAttribute("players", players);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("team-details.jsp");
		requestDispatcher.forward(request, response);
	}

	private void scheduleList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		String teamName = request.getParameter("teamName");
		List<TeamSchedule> scheduleList = null;
		try {
			if (teamName != null && !teamName.isEmpty()) {
				scheduleList = teamDAO.searchSchedulesByTeamName(teamName);
			} else {
				scheduleList = teamDAO.getAllSchedules();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("scheduleList", scheduleList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("schedule-list.jsp");
		requestDispatcher.forward(request, response);
	}

	private void listTeam(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		List<Team> teamList = null;
		try {
			teamList = teamDAO.getAllTeams();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("teamList", teamList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("team-list.jsp");
		requestDispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("team-form.jsp");
		requestDispatcher.forward(request, response);
	}

	private void addTeam(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String coach = request.getParameter("coach");
		Team team = new Team();
		try {
			teamDAO.addTeam(team);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}

	private void showEditform(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Team team = null;
		try {
			team = teamDAO.getTeam(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("team-form.jsp");
		request.setAttribute("team", team);
		requestDispatcher.forward(request, response);

	}

	private void updateTeam(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String coach = request.getParameter("coach");
		String captain = request.getParameter("captain");
		String city = request.getParameter("city");

		Team team = new Team(id, name, coach, captain, city);
		try {
			teamDAO.updateTeam(team);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("view?id=" + id);

	}

	private void deleteTeam(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			teamDAO.deleteTeam(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}

}
