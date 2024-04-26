<%
	String msg = (String) session.getAttribute("message");

	if(msg != null){
%>
<div class="alert alert-secondary" role="alert">
  <h4 class="alert-heading" style="text-align: center; font-size: 1rem;"><%=msg%></h4>
<!--   <p>At "ApnaBazar", we are committed to providing you with a seamless shopping experience.</p>
  <p class="mb-0">Explore our wide range of products, curated just for you. From top brands to exclusive deals, there's something for everyone.
  <br>Happy shopping!</p> -->
</div>
<%
		/* out.print(msg); */
		session.removeAttribute("message");
	}
%>