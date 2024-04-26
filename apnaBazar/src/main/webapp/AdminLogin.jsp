<!-- Protecting Admin Page  -->

<%@page import="com.apnaBazar.database.ProductData"%>
<%@page import="com.apnaBazar.database.UserData"%>
<%@page import="com.apnaBazar.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.apnaBazar.db_conn.FactoryProvider"%>
<%@page import="com.apnaBazar.database.CategoryData"%>
<%@page import="com.apnaBazar.entities.User" %>
<% 
	User user = (User) session.getAttribute("current-user");
	
	if(user == null){
		
		session.setAttribute("message", "You are not logged-in. Log-in first");
		response.sendRedirect("login.jsp");
		return;
	}else if(user.getUserType().equals("user")){
		response.sendRedirect("index.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin-Panel</title>
<%@include file="components/common_css_js.jsp" %>
<style>
	img{
		height: 100px;
    	width: 100px;
    	object-fit: cover;
    	border-radius: 50%;
	}
	h4{
		margin-top: 0.5rem;
	}
	p{
		font-size: 0.8rem;
		margin-top: 0.3rem;
	}
	.admin .card{
	border: 2px solid black;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
	}
	.admin .card:hover{
		background: #e2e2e2;
		cursor: pointer;
	}
	.form-group{
		margin-top: 0.5rem;
	}
}
</style>
</head>
<body>
	<%@include file="components/navBar.jsp" %>
	<%@include file="components/message.jsp" %>
	<%@include file="components/common_modal.jsp"%>
	
	<div class="container admin mt-5" style="text-align: center;">
		
		<!-- First Row -->
		<div class="row justify-content-center">
			<!-- First Column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<div class="container">
							<img alt="user_icon" src="img/users.png">
						</div>
						<h4><%
							UserData ud = new UserData(FactoryProvider.getFactory());
							int num_ud = ud.getNumOfUser();
						%><%=num_ud %></h4>
						<h5 class="text-uppercase text-muted">User</h5>
					</div>
				</div>
			</div>
			<!-- Second Column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<div class="container">
							<img alt="category_icon" src="img/list.png">
						</div>
						<h4><%
							CategoryData cd = new CategoryData(FactoryProvider.getFactory());
							int num_cd = cd.getNumOfCat();
						%><%=num_cd %></h4>
						<h5 class="text-uppercase text-muted">Categories</h5>
					</div>
				</div>
			</div>
			<!-- Third Column -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<div class="container">
							<img alt="product_icon" src="img/product.png">
						</div>
						<h4><%
							ProductData pd= new ProductData(FactoryProvider.getFactory());
							int num_pd = pd.getNumOfPro();
						%><%=num_pd %></h4>
						<h5 class="text-uppercase text-muted">Products</h5>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Second Row -->
		<div class="row justify-content-center mt-3">
			<!-- First Column -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
					<div class="card-body">
						<div class="container">
							<img alt="add_category_icon" src="img/keys.png">
							<p>Click Here To Add New Category</p>
							<h5 class="text-uppercase text-muted">Add Category</h5>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Second Column -->
				<div class="col-md-6">
					<div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
						<div class="card-body">
							<div class="container">
								<img alt="add_product_icon" src="img/plus.png">
								<p>Click Here To Add New Product</p>
								<h5 class="text-uppercase text-muted">Add Product</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	
	<!-- Add Category Modal -->
	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category-modal">
	  Launch demo modal
	</button> -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header" style="background: #222831; color: #fff;">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Category</h1>
	        <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="Add_Category_Product" method="post">
	        	<input type="hidden" name="operation" value="category" />
	        		<div class="form-group">
	        			<input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />
	        		</div>
	        		<div class="form-group">
	        			<textarea style="height: 150px; margin-top: 1rem;" class="form-control" placeholder="Enter Category Description" name="catDesc" required></textarea>
	        		</div>
	        		<div class="modal-footer">
	        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        			<button type="submit" class="btn btn-success">Save changes</button>
	      			</div>
	      	</form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- End Category Modal -->
	
	<!-- *************************************************************** -->
		
	<!-- Add Product Modal -->
	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category-modal">
	  Launch demo modal
	</button> -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header" style="background: #222831; color: #fff; text-align: center">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Product</h1>
	        <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="Add_Category_Product" method="post" enctype="multipart/form-data">
	        <input type="hidden" name="operation" value="product" />
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="name" placeholder="Enter Product Title" />
	        	</div>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="price" placeholder="Enter Product Price" />
	        	</div>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="discount" placeholder="Enter Product Discount" />
	        	</div>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="quantity" placeholder="Enter Product Quantity" />
	        	</div>
	        	<div class="form-group">
	        		<textarea style="height: 150px;" class="form-control" placeholder="Enter Product Description" name="proDesc" required></textarea>
	        	</div>
	        	<div class="form-group">
	        		<input type="file" class="form-control" name="pic" accept="image/*" />
	        	</div>
	        	
	        	
	        	<!-- Getting Total Number of Categories Dynamically -->
	        	
	        	<%-- <%
	        		CategoryData categoryData = new CategoryData(FactoryProvider.getFactory());
	        		List<Category> list = categoryData.getCategories();
	        	%> --%>
	        	
	        	<div class="form-group">
	        		<select class="form-control" name="catId">
	        			<% for(Category category:list) { %>
	        				<option value=<%=category.getCategoryId() %>><%=category.getCategoryTitle() %></option>
	        			<%} %>
	        		</select>
	        	</div>
	        	<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        		<button type="submit" class="btn btn-success">Save changes</button>
	      		</div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- End Product Modal -->
</body>
</html>