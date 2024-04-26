<%
	User user = (User) session.getAttribute("current-user");

	if(user == null){
		session.setAttribute("message", "You are not logged-in. Log-in first");
		response.sendRedirect("login.jsp");
		return;
	}

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apna-Bazar-Checkout-Page</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/navBar.jsp" %>
	<%@include file="components/common_modal.jsp"%>
	
	<div class="container">
		<div class="row mt-3">
			
			<!-- Cart Details -->
			<div class="col-md-6">
			
				<div class="card">
					<h3 class="text-center mt-1">Your Cart Details</h3>
        			<div class="card-body">
			        	<!-- Getting cart data -->
				        <div class="cart-body"></div>
				    </div>
		      	</div>				
			</div>
			
			<!-- User Details -->
			<div class="col-md-6">
				<div class="card">
					<h3 class="text-center mt-1">Enter Details To Place Order</h3>
        			<div class="card-body">
			        	<form action="#" method="post">
			        		<div class="form-group">
				        		<div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Email address</label>
								    <input required value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>
							</div>
							<div class="form-group">
				        		<div class="mb-3">
								    <label for="name" class="form-label">Enter Your Full Name</label>
								    <input required value="<%=user.getUserName() %>" type="text" class="form-control" id="userName">
								</div>
							</div>
							<div class="form-group">
								<div class="mb-3">
									<label for="shippingAddress">Enter Shipping Address</label>
									<textarea required class="form-control" id="shippingAddress"><%=user.getUserAddress() %></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="mb-3">
									<label for="phone" class="form-label">Enter Contact Number</label>
									<input required value="<%=user.getUserPhone() %>" type="tel" class="form-control" id="phone">
								</div>
							</div>
							
							<div class="container text-center">
								<button class="btn btn-outline-success">Order Now</button>
								<button class="btn btn-outline-primary">Continue Shopping</button>
							</div>
			        	</form>
				    </div>
		      	</div>
			</div>
		</div>
	</div>
</body>
</html>