<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@400;600&family=Playfair+Display:wght@700&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

.header {
	text-align: center;
	padding: 50px;
	background-color: #007bff;
	color: white;
}

.card {
	height: 500px;
	color: black;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	background-size: cover;
	background-position: center;
	transition: transform 0.6s ease-in-out, box-shadow 0.6s ease-in-out;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>

	<!-- Header Section -->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-dark p-5"
			style="background-image: url('https://www.shutterstock.com/image-vector/creative-cricket-stadium-poster-line-600nw-2374638565.jpg'); background-size: 2100px 200px; background-position: center; background-repeat: no-repeat;">
			<div
				class="container-fluid d-flex justify-content-center position-relative">
				<a href="<%=request.getContextPath()%>/home"
					class="navbar-brand text-white"
					style="font-weight: bold; font-size: 3.5rem;"> Cricket
					Tournament </a>

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

	<div class="container" style="max-width: 1500px; margin-top: 72px;">
		<div class="row g-5 mb-5">
			<!-- Team List Card -->
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/list"
					class="card shadow-lg text-decoration-none text-secondary"
					style="border: 2px solid white; border-radius: 10px; overflow: hidden;">
					<div class="card-image"
						style="background-image: url('https://png.pngtree.com/thumb_back/fw800/background/20230722/pngtree-d-render-of-cricket-tournament-equipments-with-england-vs-australia-team-image_3771083.jpg'); background-size: cover; background-position: center; height: 350px;">
					</div>
					<div class="card-body text-center">
						<h2 class="card-title" style="font-family: 'Montserrat';">Team
							List</h2>
						<p class="card-text small" style="font-family: 'Montserrat';">View
							all the participating teams and their details</p>
					</div>
				</a>
			</div>

			<!-- Schedule Section -->
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/schedule"
					class="card shadow-lg text-decoration-none text-secondary"
					style="border: 2px solid white; border-radius: 10px; overflow: hidden;">
					<div class="card-image"
						style="background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20230524/pngtree-the-cricket-trophy-on-a-stadium-standing-in-night-light-image_2612696.jpg'); background-size: cover; background-position: center; height: 350px;">
					</div>
					<div class="card-body text-center">
						<h2 class="card-title" style="font-family: 'Montserrat';">Match
							Schedule</h2>
						<p class="card-text small" style="font-family: 'Montserrat';">Check
							out the schedule of upcoming matches</p>
					</div>
				</a>
			</div>

			<!-- Bookings Section -->
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/bookings"
					class="card shadow-lg text-decoration-none text-secondary"
					style="border: 2px solid white; border-radius: 10px; overflow: hidden;">
					<div class="card-image"
						style="background-image: url('https://static.vecteezy.com/system/resources/previews/000/427/062/non_2x/cricket-stadium-vector.jpg'); background-size: cover; background-position: center; height: 350px;">
					</div>
					<div class="card-body text-center">
						<h2 class="card-title" style="font-family: 'Montserrat';">Ticket
							Bookings</h2>
						<p class="card-text small" style="font-family: 'Montserrat';">View
							your ticket bookings for the matches</p>
					</div>
				</a>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 150px; margin-bottom: 50px;">
		<div class="row text-center">
			<div class="col">
				<h2 class="display-6"
					style="font-family: 'Montserrat'; font-size: 50px;">Our
					Sponsors</h2>
				<p class="lead" style="font-family: 'Montserrat';">We are proud
					to be supported by our amazing sponsors.</p>
			</div>
		</div>

		<div class="row d-flex align-items-center justify-content-center">
			<div class="col-md-2">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/8/8d/My_11_circle_logo.png"
					class="img-fluid" alt="Sponsor 1" height="50%" width="50%">
			</div>
			<div class="col-md-2">
				<img
					src="https://seeklogo.com/images/C/CEAT_TYRES-logo-F14E11F4BA-seeklogo.com.png"
					class="img-fluid" alt="Sponsor 2" height="50%" width="50%">
			</div>
			<div class="col-md-2">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Rupay-Logo.png/1200px-Rupay-Logo.png"
					class="img-fluid" alt="Sponsor 3" height="50%" width="50%">
			</div>
			<div class="col-md-2">
				<img
					src="https://e7839fb8.rocketcdn.me/wp-content/uploads/2023/05/Angel-One-Logo.png"
					class="img-fluid" alt="Sponsor 4" height="50%" width="50%">
			</div>
		</div>
	</div>
	<hr>
	<footer class="text-dark text-center py-4 mt-auto">
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
