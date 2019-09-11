<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Register New User Form</title>

<meta charset="utf-8">

<style>
.error {
	color: red
}
</style>

</head>

<body>

	<div>

		<h2>Register New User</h2>

		<!-- Registration Form -->
		<form:form
			action="${pageContext.request.contextPath}/register/processRegistrationForm"
			modelAttribute="crmUser">

			<!-- Place for messages: error, alert etc ... -->

			<!-- Check for registration error -->
			<c:if test="${registrationError != null}">
								
				<p>${registrationError}</p>
		
			</c:if>


			<!-- User name -->
			<form:errors path="userName" cssClass="error" />
			<form:input path="userName" placeholder="username (*)"
				class="form-control" />

			<!-- Password -->
			<form:errors path="password" cssClass="error" />
			<form:password path="password" placeholder="password (*)"
				class="form-control" />

			<!-- Confirm Password -->
			<form:errors path="matchingPassword" cssClass="error" />
			<form:password path="matchingPassword"
				placeholder="confirm password (*)" class="form-control" />

			<!-- First name -->
			<form:errors path="firstName" cssClass="error" />
			<form:input path="firstName" placeholder="first name (*)"
				class="form-control" />

			<!-- Last name -->
			<form:errors path="lastName" cssClass="error" />
			<form:input path="lastName" placeholder="last name (*)"
				class="form-control" />

			<!-- Email -->
			<form:errors path="email" cssClass="error" />
			<form:input path="email" placeholder="email (*)" class="form-control" />

			<!-- Register Button -->
			<button type="submit" class="btn btn-primary">Register</button>

		</form:form>

	</div>

</body>
</html>