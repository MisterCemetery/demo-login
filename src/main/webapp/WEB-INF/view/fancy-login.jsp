<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Login Page</title>
<meta charset="utf-8">

</head>

<body>

	<!-- Login Form -->
	<form action="${pageContext.request.contextPath}/authenticateTheUser"
		method="POST">



		<!-- Check for login error -->

		<c:if test="${param.error != null}">

			<div class="alert alert-danger col-xs-offset-1 col-xs-10">
				Invalid username and password.</div>

		</c:if>

		<!-- Check for logout -->

		<c:if test="${param.logout != null}">

			<div>You have been logged out.</div>

		</c:if>


		<!-- User name -->

		<input type="text" name="username" placeholder="username">


		<!-- Password -->

		<input type="password" name="password" placeholder="password">


		<!-- Login/Submit Button -->

		<button type="submit" class="btn btn-success">Login</button>


		<!-- CSRF tokens manually -->

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

	</form>

	<div>
		<a
			href="${pageContext.request.contextPath}/register/showRegistrationForm">Register
			New User</a>
	</div>


</body>
</html>