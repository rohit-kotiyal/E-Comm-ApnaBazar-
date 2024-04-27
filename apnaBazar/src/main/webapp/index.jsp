<%@page import="com.apnaBazar.db_conn.Helper"%>
<%@page import="com.apnaBazar.entities.Product"%>
<%@page import="com.apnaBazar.database.ProductData"%>
<%@page import="com.apnaBazar.db_conn.FactoryProvider"%>
<%@page import="java.util.Base64"%>

<html>
	<head>
		<title>ApnaBazar.com</title>		
		<style>
			.product-card:hover{
				background: #e2e2e2;
				cursor: pointer;
			}

    	.hero-section{
			    height: 380px;
			    margin: 4rem 1.5rem 0 1.5rem;
			    background-image: url("img/hero_image.jpg");
			    background-size: cover;
			    display: flex;
			    justify-content: center;
			    align-items: flex-end;
			}
			.hero-msg{
			    background-color: white;
			    color: black;
			    height: 40px;
			    width: 80%;
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    font-size: 0.85rem; 
			    justify-content: center;
			    margin-bottom: 25px;
			}
			
			.hero-msg a{
			    color: #007185;
			}
		</style>
		<%@include file="components/common_css_js.jsp"%>
		<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
	</head>
<body>
	<%@include file="components/navBar.jsp" %>
	<%@include file="components/common_modal.jsp"%>
<%-- 	<h2>Welcome To ApnaBazar</h2>
	<h2>Creating session factory object</h2>
	
	<%
		out.println(FactoryProvider.getFactory());
	%> --%>
	
	<!-- Getting Products from ProductData -->
	<%
		// Getting category id
		
		String categoryId = request.getParameter("category");
	 /*  out.println("<div style='color: white;'>Category ID: " + categoryId + "</div>"); */
		ProductData pdata = new ProductData(FactoryProvider.getFactory());
		List<Product> plist = null;
		
		if(categoryId==null || categoryId.trim().equals("all")){
			plist = pdata.getAllProducts();
		}else{
			int catId = Integer.parseInt(categoryId.trim());
			plist = pdata.getAllProductsById(catId);
		}
		
	%>
	
	<!-- Hero Section -->
	<div class="hero-section" data-aos="zoom-in-up">
        <div class="hero-msg">
             <p>You are on apnaBazar.com. You can also shop on ApnaBazar India for millions of products with fast local delivery.</p>
        </div>
    </div>
	
	
	<%-- <h1>Number of products: <%= plist.size() %></h1> --%>
<main>
	<div class="row m-2" style="font-size: 0.8rem;">
    <% 
    // Define a counter variable to keep track of the number of products displayed
    int counter = 0;
    
    // Iterate through the product list
    for(Product product: plist) {
        // Check if the counter is divisible by 3 (to display 3 products in a row)
        if (counter % 3 == 0) {
            // Close the previous row if it's not the first iteration
            if (counter > 0) {
    %>
                </div><!-- Close previous row -->
            <% } %>
            
            <!-- Open a new row -->
            <div class="row m-2" style="font-size: 0.8rem;">
        <% } %>
        
        <!-- Product Card -->
        <div class="col-md-4 ml-1" style="display: flex; height: 100%;">
            <div class="card product-card p-2" data-aos="zoom-in-up">
            	<div class="container text-center">
            		<img class="card-img-top" style="max-height: 250px; max-width: 60%; padding-top: 1rem;" alt="Product-Img" src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(product.getProductPhoto()) %>">
        </div>
        <div class="card-body" style="height: 200px;">
            <h6 class="card-title" style="height: 40px; overflow: hidden; text-align: center;"><%= product.getProductName() %></h6>
            <p class="card-text" style="height: 60px; padding-top: 1rem;"><%=Helper.get10words(product.getProductDescription()) %></p>
        </div>
                
                <div class="card-footer" style="flex: 1;">
                	<button class="btn btn-outline-success" onclick="addToCart(<%=product.getProductId()%>, '<%=product.getProductName()%>', <%=product.getPriceAfterDiscount()%>)">Add to Cart</button>
                	<button class="btn btn-outline-primary">
						  &#8377; <%= product.getPriceAfterDiscount()%> /-
						  <span style="font-size: 0.7rem; color:gray; text-decoration: line-through;">
						    &#8377;<%= product.getProductPrice() %>
						  </span>
						  <span style="font-size: 0.7rem; color:gray;">
						    <%= product.getProductDiscount() %>% off
						  </span>
					</button>               
 </div>
            </div>
        </div>
        
        <% 
        // Increment the counter after each product
        counter++;
        
        // Close the row if it's the last iteration
        if (counter == plist.size()) {
        %>
            </div><!-- Close last row -->
        <% } %>
    <% } %>
 </main>
 
 
<!--  Number of Pages -->
<nav>
  <ul class="pagination justify-content-center mt-5">
    <li class="page-item disabled">
      <a class="page-link">Previous</a>
    </li>
        <li class="page-item active" aria-current="page">
      <a class="page-link" href="index.jsp">1</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
 
 
<!--  Footer Section -->
 
 <footer class="footer">
    <div class="footerContainer">
        <div class="socialIcons">
            <a href="#"><i class='bx bxl-facebook-circle' ></i></a>
            <a href="#"><i class='bx bxl-twitter' ></i></a>
            <a href="#"><i class='bx bxl-whatsapp' ></i></a>
            <a href="#"><i class='bx bxl-pinterest' ></i></a>
        </div>
        <div class="footerNav">
            <ul><li><a href="">Home</a></li>
                <li><a href="">News</a></li>
                <li><a href="">About</a></li>
                <li><a href="">Contact Us</a></li>
            </ul>
        </div>
        
    </div>
    <div class="footerBottom">
        <p>ApnaBazar &#169; 2024 - All right reserved. Designed by <span class="designer">Rohit</span></p>
    </div>
</footer>
     
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
        AOS.init({
            offset: 300,
            duration: 1200
        });
</script>


</body>
</html>
