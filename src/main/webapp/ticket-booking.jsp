<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Booking Page</title>
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

	<div class="container d-flex justify-content-center"
		style="margin-top: 100px">
		<div class="card shadow-lg p-4" style="max-width: 800px;">
			<h2 class="text-center mb-5 mt-4">Book Your Ticket(s)!</h2>

			<div class="row g-4 mb-5">
				<div class="col-12">
					<label class="form-label fw-bold">Match</label>
					<div class="form-control rounded-pill bg-light">
						<c:out
							value=" ${fn:split(teamSchedule.teamName, ' ')[0]} vs ${fn:split(teamSchedule.opponentTeamName, ' ')[0]}" />
					</div>
				</div>
				<div class="col-md-4">
					<label class="form-label fw-bold">Date</label>
					<div class="form-control rounded-pill bg-light">
						<c:out value="${teamSchedule.matchDate}" />
					</div>
				</div>
				<div class="col-md-4">
					<label class="form-label fw-bold">Time</label>
					<div class="form-control rounded-pill bg-light">
						<fmt:formatDate value="${teamSchedule.matchTime}"
							pattern="hh:mm a" />
					</div>
				</div>
				<div class="col-md-4">
					<label class="form-label fw-bold">Venue</label>
					<div class="form-control rounded-pill bg-light">
						<c:out value="${teamSchedule.venue}" />
					</div>
				</div>
			</div>

			<!-- Booking Form -->
			<form action="${pageContext.request.contextPath}/booking"
				method="post" class="row g-4">
				<div class="col-12">
					<label for="name" class="form-label fw-bold">Enter Your
						Name</label> <input type="text" class="form-control rounded-pill"
						id="name" name="name" required>
				</div>

				<div class="col-md-6">
					<label for="tickets" class="form-label fw-bold">Number of
						Tickets</label> <input type="number" class="form-control rounded-pill"
						id="tickets" name="tickets" min="1" max="10" required>
				</div>

				<div class="col-md-6">
					<label for="ticketType" class="form-label fw-bold">Ticket
						Type</label> <select class="form-select rounded-pill" id="ticketType"
						name="ticketType" required>
						<option value="normal">Normal</option>
						<option value="premium">Premium</option>
					</select>
				</div>

				<div class="col-12">
					<label for="price" class="form-label fw-bold">Total Amount</label>
					<input type="text" class="form-control rounded-pill" id="amount"
						name="amount" readonly>
				</div>

				<input type="hidden" name="matchNo" value="${teamSchedule.matchNo}">
				<input type="hidden" name="source" value="${param.source}">
				<input type="hidden" name="teamId" value="${teamId}">

				<div class="col-12 text-center">
					<button type="submit" class="btn btn-secondary rounded-pill px-4">Book
						Ticket(s)</button>
				</div>
			</form>
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


	<script>
		document.getElementById('ticketType').addEventListener('change',
				updatePrice);
		document.getElementById('tickets').addEventListener('input',
				updatePrice);

		function updatePrice() {
			let ticketPrice = document.getElementById('ticketType').value === 'premium' ? 500
					: 300;
			let numberOfTickets = document.getElementById('tickets').value || 1;
			document.getElementById('amount').value = ticketPrice
					* numberOfTickets;
		}
	</script>

</body>
</html>