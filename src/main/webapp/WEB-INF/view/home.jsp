<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<title>Home Page</title>
</head>

<body>
	<h2>Home Page</h2>
	<hr>
	
	<p>
	Welcome to the home page!
	</p>
	
	<hr>
	
	<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
		<br><br>
		First name: ${user.firstName}, Last name: ${user.lastName}, Email: ${user.email}
	</p>
	
	<security:authorize access="hasRole('MANAGER')">
	
		<!-- Add a link for the managers -->
		
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Managers)
		</p>

	</security:authorize>	
	
	
	<security:authorize access="hasRole('ADMIN')">  

		<!-- Add a link for the admins -->
		
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admins)
		</p>
	
	</security:authorize>
	
	<hr>
	
	<!-- Reset password button -->
	<form:form action="${pageContext.request.contextPath}/resetPassword" 
			   method="POST" modelAttribute="user">
	
		<input type="submit" value="Reset password" />
	
	</form:form>
	
	<!-- Logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" />
	
	</form:form>
	
</body>

</html>









