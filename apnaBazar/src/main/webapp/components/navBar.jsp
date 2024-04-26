<!-- Getting User Data -->

<%@page import="com.apnaBazar.database.CategoryData"%>
<%@page import="com.apnaBazar.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.apnaBazar.db_conn.FactoryProvider"%>
<%@page import="com.apnaBazar.database.CategoryData"%>
<%@page import="com.apnaBazar.entities.User" %>
<%
	User curr_user = (User) session.getAttribute("current-user");
%>


<header class="sticky">
	<nav class="navbar navbar-expand-lg navbar-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp">ApnaBazar</a>
<!-- 		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button> -->
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <!-- style="color: white;" -->
		            Category
		          </a> 
			
			          <!-- Getting Total Number of Categories Dynamically -->
			        	<%
			        		CategoryData categoryData = new CategoryData(FactoryProvider.getFactory());
			        		List<Category> list = categoryData.getCategories();
			        	%>
			        	
		          <ul class="dropdown-menu">
		          	<li><a class="dropdown-item" href="index.jsp?category=all">All</a></li>
		          	<% for(Category category:list){ %>
		            	<li><a class="dropdown-item" href="index.jsp?category=<%=category.getCategoryId()%>"><%=category.getCategoryTitle() %></a></li>
		            <%} %>
		          </ul>
		        </li>
		      </ul>
		      <ul class="navbar-nav ml-auto">
		      
		      <li class="nav-item active">
		            <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cart"><i class='bx bx-cart-add' style="font-size: 1.8rem;"></i><sub class="cart-items"></sub></a>
		        </li>
		      
		      <!-- Conditional Rendering -->
		      <% 
		      	if(curr_user == null){
		      %>
		      	<li class="nav-item active">
		            <a class="nav-link" href="login.jsp">Login</a>
		        </li>
		        <li class="nav-item active">
		            <a class="nav-link" href="register.jsp">Register</a>
		        </li>
		       
		      <% 
		      	}else{
		      %>
		      	<li class="nav-item active">
		            <a class="nav-link" href="<%=curr_user.getUserType().equals("user")? "index.jsp":"AdminLogin.jsp" %>" style="color: white;"><%=curr_user.getUserName()%></a>
		        </li>
		        <li class="nav-item active">
		            <a class="nav-link" href="logout" style="color: white;">Logout</a>
		        </li>
		      <% } %>
		      </ul>
		    </div>
		  </div>
		</nav>
</header>