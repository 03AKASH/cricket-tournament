<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cricket Tournament</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-dark p-5"
			style="background-image: url('https://www.shutterstock.com/image-vector/creative-cricket-stadium-poster-line-600nw-2374638565.jpg'); background-size: 2100px 200px; background-position: center; background-repeat: no-repeat;">
			<div>
				<ul class="navbar-nav">
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/home"
						class="nav-link text-light" style="font-size: 1.25rem;"><i
							class="fas fa-home"></i></a></li>
				</ul>
			</div>
			<div
				class="container-fluid d-flex justify-content-center position-relative">

				<a href="home" class="navbar-brand text-white"
					style="font-weight: bold; font-size: 3.5rem; margin-right: 260px;">
					Cricket Tournament </a>

				<div class="position-absolute end-0">
					<ul class="navbar-nav ms-auto d-flex align-items-center gap-3">
						<c:if test="${not empty sessionScope.user}">
							<li class="nav-item"><a class="nav-link text-light" href="#"
								style="font-size: 1.25rem;"> ${sessionScope.user.username} </a>
							</li>
							<li><a class="nav-link text-light text-decoration-none"
								href="logout" style="font-size: 1.25rem;"> Logout </a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="row">
		<div class="container">
			<div class="container text-left">
				<h3 class="text-center mt-5">Schedule</h3>
				<hr>
			</div>
			<div class="container text-left mt-5">
				<form action="schedule" method="get"
					class="d-flex justify-content-center mb-3">
					<input type="text" name="teamName" class="form-control w-25"
						placeholder="Search by Team Name"
						value="<c:out value='${param.teamName}'/>">
					<button type="submit" class="btn btn-secondary ms-2">Search</button>
				</form>
			</div>

			<table
				class="table table-striped table-bordered table-hover shadow-lg table-responsive w-75 mx-auto mt-5">
				<thead>
					<tr>
						<th>Match No</th>
						<th>Matches</th>
						<th>Date</th>
						<th>Time</th>
						<th>Venue</th>
						<th>Ticket Booking</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="schedule" items="${scheduleList}">
						<tr>
							<td><c:out value="${schedule.matchNo}" /></td>
							<td><c:out
									value="${fn:split(schedule.teamName, ' ')[0]} vs ${fn:split(schedule.opponentTeamName, ' ')[0]}" /></td>
							<td><fmt:formatDate value="${schedule.matchDate}"
									pattern="dd-MM-yyyy (EEE)" /></td>
							<td><fmt:formatDate value="${schedule.matchTime}"
									pattern="hh:mm a" /></td>
							<td><c:out value="${schedule.venue}" /></td>
							<td><a
								href="${pageContext.request.contextPath}/bookingPage?matchNo=${schedule.matchNo}&source=schedule"
								class="text-success text-decoration-none"> Book ticket </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<footer class="text-dark text-center py-4 mt-auto">
		<hr>
		<div class="container">
			<p class="mb-1">&copy; 2024 Cricket Tournament. All rights
				reserved.</p>
			<p class="mb-1">
				Contact us: <a href="mailto:info@crickettournament.com"
					class="text-dark">info@crickettournament.com</a>
			</p>
			<p>
				<a href="#" class="text-dark mx-2">Facebook</a> <a href="#"
					class="text-dark mx-2">Twitter</a> <a href="#"
					class="text-dark mx-2">Instagram</a>
			</p>
		</div>
	</footer>
</body>
</html>