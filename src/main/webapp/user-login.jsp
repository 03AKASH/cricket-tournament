<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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
			<div
				class="container-fluid d-flex justify-content-center position-relative">
				<a href="#" class="navbar-brand text-white"
					style="font-weight: bold; font-size: 3.5rem;"> Cricket
					Tournament </a>
			</div>
		</nav>
	</header>

	<div class="container" style="margin-top: 100px;">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center mb-4">Login</h2>
						<c:if test="${message == 'Invalid credentials'}">
							<p class="text-danger text-center">Invalid user</p>
						</c:if>

						<form action="login" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email Address</label> <input
									type="text" class="form-control" id="email" name="email"
									placeholder="Enter your email address" required>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="Enter your password" required>
							</div>
							<button type="submit" class="btn btn-secondary w-100">Login</button>
						</form>
						<div class="mt-3 text-center">
							<p>
								<a href="<%=request.getContextPath()%>/register"
									class="text-decoration-none text-primary">Don't have an
									account? Register here.</a>
							</p>

						</div>
					</div>
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