<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Team Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-dark p-5">
			<div class="container-fluid">
				<a href="#" class="navbar-brand text-white fs-3"
					style="font-weight: bold;">Cricket Tournament</a>
				<div>
					<ul class="navbar-nav">
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/list"
							class="nav-link text-light">Teams</a></li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/schedule"
							class="nav-link text-light">Schedule</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav ms-auto d-flex align-items-center gap-2">
						<c:if test="${not empty sessionScope.user}">
							<li class="nav-item "><a class="nav-link text-light"
								href="#"> ${sessionScope.user.username} </a></li>
							<li><a class=" text-light text-decoration-none"
								href="logout">Logout</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container col-md-5 mt-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${team != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${team == null}">
					<form action="add" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${team != null}">
                        Edit Team
                    </c:if>
						<c:if test="${team == null}">
                        Add New Team
                    </c:if>
					</h2>
				</caption>

				<c:if test="${team != null}">
					<input type="hidden" name="id" value="<c:out value='${team.id}' />" />
				</c:if>

				<div class="form-group m-3">
					<label>Team Name</label> <input type="text"
						value="<c:out value='${team.name}' />" class="form-control"
						name="name" required="required">
				</div>

				<div class="form-group m-3">
					<label>Team Coach</label> <input type="text"
						value="<c:out value='${team.coach}' />" class="form-control"
						name="coach">
				</div>

				<div class="form-group m-3">
					<label>Team Captain</label> <input type="text"
						value="<c:out value='${team.captain}' />" class="form-control"
						name="captain">
				</div>

				<div class="form-group m-3">
					<label>Team City</label> <input type="text"
						value="<c:out value='${team.city}' />" class="form-control"
						name="city">
				</div>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
