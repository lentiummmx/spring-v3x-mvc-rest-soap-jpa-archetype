#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<!DOCTYPE html>
<%@include file="../partials/taglib.jsp" %>
<html>
<head>
<title>Login</title>
<script type="text/javascript">
${symbol_dollar}(document).ready(function() {
	//console.log("ready!");
	${symbol_dollar}("${symbol_pound}loginForm").submit(function( event ) {
		  
		  var userName = ${symbol_dollar}.trim(${symbol_dollar}("${symbol_pound}username").val());
		  var password = ${symbol_dollar}.trim(${symbol_dollar}("${symbol_pound}password").val());
		  
		  if(userName == '' || password == '')
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
	<c:if test="${symbol_dollar}{param.error != null}">
		<div class="alert alert-danger">
		    Invalid UserName and Password.
		</div>
	</c:if>
	<c:if test="${symbol_dollar}{param.logout != null}">
		<div class="alert alert-success">
		    You have been logged out.
		</div>
	</c:if>	
</div>  
            
<div class="row">
	<div class="col-md-6 col-md-offset-2">	
		<h2>User Login Form</h2>
		<form:form id="loginForm" method="post" action="login" modelAttribute="user" 
		class="form-horizontal" role="form" cssStyle="width: 800px; margin: 0 auto;">
		  <div class="form-group">
		    <label for="username" class="col-sm-2 control-label">UserName*</label>
		    <div class="col-sm-4">
		      <input type="text" id="username" name="username" class="form-control" placeholder="UserName" />
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-2 control-label">Password*</label>
		    <div class="col-sm-4">
		      <input type="password" id="password" name="password" class="form-control" placeholder="Password" />
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-4">
		      <input type="submit" class="btn btn-primary" value="Login">
		    </div>
		  </div>
		   <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-4">
		      New User? <a href="register">Register</a>
		    </div>
		  </div>
		  
		</form:form>
	</div>
</div>
	
</body>
</html>