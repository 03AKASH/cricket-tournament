<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cricket Tournament</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
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

	<div class="container-fluid p-0">

		<!-- <div class="jumbotron jumbotron-fluid text-dark">
			<div class="container text-center py-5">
				<h1 class="display-4" style="font-weight: 700;">${team.name}</h1>
			</div>
		</div> -->
		<div class="m-5 d-flex align-items-center justify-content-end">
			<div>
				<c:if test="${sessionScope.user.role == 'ADMIN'}">
					<a class="btn btn-dark mx-2"
						href="edit?id=<c:out value='${team.id}'/>">Edit Team Details</a>
				</c:if>

				<!-- <a
					class="btn btn-dark mx-2"
					href="delete?id=<c:out value='${team.id}'/>">Delete Team</a>  -->
			</div>
		</div>

		<div class="m-5 d-flex align-items-center justify-content-end">
			<div class="col-md-4 text-center mx-auto">
				<div class=" mb-4">
					<div class="card-body">
						<img src="${team.logoUrl}" class="img-fluid rounded-circle mb-3"
							alt="Team Logo" style="width: 350px; height: 200px;">
					</div>
				</div>
			</div>
		</div>

		<div class="container my-5 ">
			<div class="row d-flex justify-content-center">
				<div class="col-sm-4 mb-4">
					<div class="card h-100 border-0 shadow" style="width: 300px;">
						<div class="card-body text-center p-0">
							<i class="fas fa-city fa-3x text-primary mb-3"></i>
							<div class="card-img-top position-relative">
								<div class="mb-3 p-0 m-0">
									<img src="${team.cityImageUrl}"
										class="img-fluid mx-auto d-block p-0 m-0" alt="Player Image"
										style="width: 100%; height: 250px; object-fit: cover;">
								</div>
							</div>
							<h5 class="card-title">City</h5>
							<p class="card-text mb-3">${team.city}</p>
						</div>
					</div>

				</div>

				<div class="col-sm-4 mb-4">
					<div class="card h-100 border-0 shadow" style="width: 300px;">
						<!-- Reduced width here -->
						<div class="card-body text-center p-0">
							<i class="fas fa-user-tie fa-3x text-success mb-3"></i>
							<div class="card-img-top position-relative">
								<div class="mb-3 p-0 m-0">
									<img src="${team.coachImageUrl}"
										class="img-fluid mx-auto d-block p-0 m-0" alt="Coach Image"
										style="width: 100%; height: 250px; object-fit: cover;">
									<!-- Ensure 100% width of the parent -->
								</div>
							</div>
							<h5 class="card-title">Coach</h5>
							<p class="card-text">${team.coach}</p>
						</div>
					</div>

				</div>

				<div class="col-sm-4 mb-4">
					<div class="card h-100 border-0 shadow" style="width: 300px;">
						<div class="card-body text-center p-0">
							<i class="fas fa-user-captain fa-3x text-warning mb-3"></i>
							<div class="card-img-top position-relative">
								<div class="mb-3 p-0 m-0">
									<img src="${team.captainImageUrl}"
										class="img-fluid mx-auto d-block p-0 m-0" alt="Player Image"
										style="width: 100%; height: 250px; object-fit: cover;">
								</div>
							</div>
							<h5 class="card-title">Captain</h5>
							<p class="card-text">${team.captain}</p>
						</div>
					</div>
				</div>

			</div>

			<div class="row mt-5">
				<div class="col text-center">
					<h2 class="h3 mb-4">Playing XI</h2>
				</div>
			</div>

			<div class="container mt-5">
				<div class="row">
					<c:forEach var="player" items="${players}">
						<c:if test="${player.teamId == team.id}">
							<div class="col-md-3 mt-5">
								<div class="card border-0 shadow h-100 text-center"
									style="width: 18rem;">
									<div class="card-img-top position-relative">
										<img src="${player.image}"
											class="img-fluid rounded-circle mx-auto d-block"
											alt="Player Image"
											style="width: 150px; height: 150px; object-fit: cover;">
									</div>
									<div class="card-body">
										<h5 class="card-title text-secondary">
											<c:out value="${player.playerName}"></c:out>
										</h5>
										<p class="card-text text-secondary mb-1">
											<strong><c:out value="${player.role}"></c:out></strong>
										</p>
										<p class="card-text text-muted">
											<small><c:out value="${player.teamName}"></c:out></small>
										</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="row mt-5">
				<div class="col text-center">
					<h2 class="h3 mb-4">Upcoming Matches</h2>
				</div>
			</div>

			<div class="row">

				<div class="col-12">
					<table class="table table-striped table-hover shadow-lg">
						<thead class="thead-dark">
							<tr>
								<th>Opponent</th>
								<th>Date</th>
								<th>Time</th>
								<th>Venue</th>
								<th>Ticket Booking</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="schedule" items="${schedules}">
								<c:if
									test="${team.id == schedule.teamId || team.id == schedule.opponentTeamId}">
									<tr>
										<c:if test="${schedule.opponentTeamId == team.id}">
											<td><c:out value="${schedule.teamName}" /></td>
										</c:if>
										<c:if test="${schedule.opponentTeamId != team.id}">
											<td><c:out value="${schedule.opponentTeamName}" /></td>
										</c:if>
										<td><c:out value="${schedule.matchDate}" /></td>
										<td><c:out value="${schedule.matchTime}" /></td>
										<td><c:out value="${schedule.venue}" /></td>
										<td><a
											href="${pageContext.request.contextPath}/bookingPage?matchNo=${schedule.matchNo}&source=teamDetails&teamId=${param.id}"
											class="text-success text-decoration-none"> Book ticket </a></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
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