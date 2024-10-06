<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

	<div class="container d-flex justify-content-center mt-5">
		<div class="card shadow-lg"
			style="width: 400px; border-radius: 15px; background-color: #f7f7f7;">
			<div class="card-body text-center">
				<h2 class="text-success fw-light">Booking Details</h2>
				<div class="ticket mt-5">
					<h4 class="text-secondary fw-bold">
						<c:out
							value="${fn:split(teamSchedule.teamName, ' ')[0]} vs ${fn:split(teamSchedule.opponentTeamName, ' ')[0]}" />
					</h4>
					<p class="text-muted">${teamSchedule.matchDate}
						|
						<fmt:formatDate value="${teamSchedule.matchTime}"
							pattern="hh:mm a" />
					</p>
					<p class="text-muted">${teamSchedule.venue}</p>
				</div>
				<p>
					<strong>Name:</strong> ${username}
				</p>
				<p>
					<strong>Number of Tickets:</strong> ${tickets}
				</p>
				<p>
					<strong>Ticket Type:</strong> ${ticketType}
				</p>
				<p>
					<strong>Total Amount:</strong> ${totalAmount}
				</p>

				<c:choose>
					<c:when test="${empty bookingConfirmed}">
						<form action="confirm" method="post" class="mt-4">
							<input type="hidden" name="matchNo"
								value="${teamSchedule.matchNo}"> <input type="hidden"
								name="tickets" value="${tickets}"> <input type="hidden"
								name="amount" value="${totalAmount}"> <input
								type="hidden" name="name" value="${username}"> <input
								type="hidden" name="ticketType" value="${ticketType}">
							<button type="submit" id="confirmButton"
								class="btn btn-success rounded-pill px-4 mb-3">Confirm
								Booking</button>
							<input type="hidden" name="source" value="${source}"> <input
								type="hidden" name="teamId" value="${teamId}">
							<!-- Add this for debugging -->

						</form>
					</c:when>
					<c:otherwise>
						<div id="confirmationMessage" class="mt-3">
							<h4 class="mb-2 fw-bold text-success">Booking Confirmed!</h4>
							<p class="fw-lighter">Thank you for your booking! We look
								forward to seeing you at the match!</p>
							<c:choose>
								<c:when test="${source == 'schedule'}">
									<a href="${pageContext.request.contextPath}/schedule"
										class="text-primary text-decoration-none">Go Back </a>
								</c:when>
								<c:when test="${source == 'teamDetails'}">
									<a href="${pageContext.request.contextPath}/view?id=${teamId}"
										class="text-primary text-decoration-none">Go Back </a>
								</c:when>
							</c:choose>

						</div>
					</c:otherwise>
				</c:choose>
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

	<script>
		function confirmBooking() {
			document.getElementById('confirmButton').style.display = 'none';
			document.getElementById('confirmationMessage').style.display = 'block';
		}
	</script>



</body>
</html>