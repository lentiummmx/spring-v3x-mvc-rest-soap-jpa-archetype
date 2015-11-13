#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<!DOCTYPE html>
<%@include file="../partials/taglib.jsp" %>
<html>
<head>
<title>Create User</title>
<script type="text/javascript">
${symbol_dollar}(document).ready(function() {
	
	${symbol_dollar}("${symbol_pound}registrationForm").submit(function( event ) {
		
		  var userName = ${symbol_dollar}.trim(${symbol_dollar}("${symbol_pound}username").val());
		  var password = ${symbol_dollar}.trim(${symbol_dollar}("${symbol_pound}password").val());
		  var firstName = ${symbol_dollar}.trim(${symbol_dollar}("${symbol_pound}firstName").val());
		  var email = ${symbol_dollar}.trim(${symbol_dollar}("${symbol_pound}email").val());
		  if(userName == '' || password == '' || firstName == '' || email == '')
		  {
				alert("Please enter all mandatory fields");
				event.preventDefault();
				return false;
          }
	});
});
</script>
</head>
<body>

<div class="col-md-6 col-md-offset-2">	
	<c:if test="${symbol_dollar}{ERROR != null }">
		<div class="alert alert-danger">
			<p>${symbol_dollar}{ERROR}
		</div>
	</c:if>
</div>
		
<div class="row">
	<div class="col-md-6 col-md-offset-2">	
		<h2>User Registration Form</h2>
		<form:form id="registrationForm" method="post" action="register" modelAttribute="user" cssStyle="width: 800px; margin: 0 auto;" class="form-horizontal" role="form">
		  <div class="form-group">
		    <label for="username" class="col-sm-2 control-label">UserName*</label>
		    <div class="col-sm-4">
		      <input type="text" id="username" name="username" class="form-control" placeholder="UserName" />
		      <form:errors path="username"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-2 control-label">Password*</label>
		    <div class="col-sm-4">
		      <input type="password" id="password" name="password" class="form-control" placeholder="Password" />
		      <form:errors path="password"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">Email*</label>
		    <div class="col-sm-4">
		      <input type="text" id="email" name="email" class="form-control" placeholder="Email" />
		      <form:errors path="email"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="firstName" class="col-sm-2 control-label">FirstName*</label>
		    <div class="col-sm-4">
		      <input type="text" id="firstName" name="firstName" class="form-control" placeholder="FirstName" />
		      <form:errors path="firstName"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="lastName" class="col-sm-2 control-label">LastName</label>
		    <div class="col-sm-4">
		      <input type="text" id="lastName" name="lastName" class="form-control" placeholder="LastName" />
		      <form:errors path="lastName"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="birthDate" class="col-sm-2 control-label">Date Of Birth</label>
		    <div class="col-sm-4">
		      <input type="text" id="birthDate" name="birthDate" class="form-control" placeholder="dd-MM-yyyy" />
		      <form:errors path="birthDate" cssClass="text-danger" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phoneNumber" class="col-sm-2 control-label">Phone</label>
		    <div class="col-sm-4">
		      <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="+${symbol_pound}${symbol_pound} ${symbol_pound} (${symbol_pound}${symbol_pound}) ${symbol_pound}${symbol_pound}${symbol_pound}${symbol_pound} ${symbol_pound}${symbol_pound}${symbol_pound}${symbol_pound}" />
		      <form:errors path="phoneNumber" cssClass="text-danger"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-4">
		      <input type="submit" class="btn btn-primary" value="Register">
		    </div>
		  </div>
		   
		   <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-4">
		      Already Registered? <a href="login">Login</a>
		    </div>
		  </div>
		  <!-- input type="hidden"  name="${symbol_dollar}{_csrf.parameterName}"   value="${symbol_dollar}{_csrf.token}"/ -->
		  <sec:csrfInput/>
		</form:form>
	</div>
</div>

	
</body>
</html>