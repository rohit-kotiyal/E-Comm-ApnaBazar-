<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apna-Bazar-Login-Page</title>
<%@include file="components/common_css_js.jsp" %>
<style>

</style>
</head>
<body>
	<%@include file="components/navBar.jsp" %>
	<div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6 login-register">
        <div class="card bg-transparent" style="border: none;">
          <div class="card-body">
          <%@include file = "components/message.jsp" %>
            <h5 class="card-title text-center text-light mb-4" style="font-size: 2rem;">Login</h5>
            <form action="login" method="post">
              <div class="input-group mb-3 mt-5">
                <span class="input-group-text"><i class='bx bxs-user'></i></span>
                <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Enter your email" required>
              </div>
              <div class="input-group mb-3 mt-4">
                <span class="input-group-text"><i class='bx bxs-lock-alt'></i></span>
                <input type="password" class="form-control" id="inputPassword" name="pass" placeholder="Enter your password" required>
              </div>
              <div class="text-center mt-4">
                <button type="submit" class="btn-submit">Login</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
	
</body>
</html>