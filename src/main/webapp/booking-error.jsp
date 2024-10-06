<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Error Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="bg-light">
	<div class="container text-center" style="margin-top: 100px;">
		<h1 class="display-4 text-danger">Booking Error</h1>
		<p class="lead text-warning">
			<strong>Oops!</strong> You have already booked tickets for this
			match.
		</p>
		<p>Please check your booking history or choose a different match.</p>
		<a href="schedule" class="text-primary text-decoration-none">Back
			to Schedules</a><br>
		<a href="bookings" class="text-primary text-decoration-none">View
			My Bookings</a>
	</div>
</body>
</html>
