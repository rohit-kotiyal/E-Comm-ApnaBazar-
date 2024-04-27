<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApnaBazar-New-Registration</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>
	<%@include file="components/navBar.jsp" %>
	<div class="container login-register">
    <div class="border p-4 border-0">
      <h2 class="text-center text-light">Registration Form</h2>
      <form action="submitForm" method="post" enctype="multipart/form-data">
        <div class="row">
          <!-- First column -->
          <div class="col-md-6">
            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input required type="text" class="form-control" id="username" name="name" placeholder="Enter your username" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email address</label>
              <input required type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input required type="password" class="form-control" id="password" name="pass" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">Phone</label>
              <input required type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>
          </div>
          <!-- Second column -->
          <div class="col-md-6">
            <div class="mb-3">
              <label for="pic" class="form-label">Profile Picture</label>
              <input required type="file" class="form-control" id="pic" name="pic" accept="image/*">
            </div>
            <div class="mb-3">
              <label for="address" class="form-label">Address</label>
              <textarea required class="form-control" id="address" rows="3" name="address" placeholder="Enter your address"></textarea>
            </div>
          </div>
        </div>
        <div class="text-center">
          <button type="submit" class="btn-submit">Submit</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>