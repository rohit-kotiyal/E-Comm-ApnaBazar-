
/* Product -> id, name, price */
function addToCart(id, name, price) {
  // 1. Retrieve existing cart or create a new one
  let cart = JSON.parse(localStorage.getItem("cart")) || []; // Use an empty array for new cart

  // 2. Check if product already exists in cart (using strict equality)
  const existingProduct = cart.find((item) => item.productId === id); // Use === for strict comparison

  // 3. Update quantity or add new product based on existence
  if (existingProduct) {
    existingProduct.productQuantity++;
    showToast(existingProduct.productName+" quantity is increased");
  } else {
    cart.push({ productId: id, productName: name, productQuantity: 1, productPrice: price });
    showToast("Product is added to cart");
  }

  // 4. Persist updated cart in localStorage (using JSON.stringify)
  localStorage.setItem("cart", JSON.stringify(cart));
  updateCart();
}

function updateCart(){
	
	/*here cart is in string format*/
	let cart = localStorage.getItem("cart");
	cart = JSON.parse(cart);
	
	if(cart === null || cart.length === 0){
		$(".cart-body").html("<h3>Cart is empty</h3>");
		/*$(".cart-items").html(`${cart.length}`)*/
		$(".checkout-btn").addClass("disabled");
	}else{
		$(".checkout-btn").removeClass("disabled");
		$(".cart-items").html(`${cart.length}`);
		
		let table = `
			<table class='table'>
				<thead class='thread-light'>
					<tr>
						<th>Product Name: </th>
						<th>Price: </th>
						<th>Quantity: </th>
						<th>Total Price: </th>
						<th>Action: </th>
					</tr>
				</thead>
		`;
		
		let totalCost = 0;
		cart.map((item)=>{
			
			totalCost += (item.productPrice * item.productQuantity);
			table += `
				<tr>
					<td>${item.productName}</td>
					<td>₹ ${item.productPrice}</td>
					<td>${item.productQuantity}</td>
					<td>₹ ${item.productQuantity * item.productPrice}</td>
					<td><button onclick='removeItem(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
				</tr>
			`;
		});
		
		table +=`
			<tfoot> 
				<tr>
      				<td colspan="5" style="text-align: right; font-weight: bold;">Total Price: ₹ ${totalCost}</td>
    			</tr>
  			</tfoot>
  		</table>`  			
		$(".cart-body").html(table);
	}
}

/*remove item*/
function removeItem(productId){
	let cart = JSON.parse(localStorage.getItem("cart"));
	
	let newCart = cart.filter((item) => item.productId != productId);
	
	localStorage.setItem("cart", JSON.stringify(newCart));
	updateCart();
	showToast("Product is removed from cart");
}


/*show toast(message)*/
function showToast(content){
    $("#toast").addClass("display").css("visibility", "visible").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display").css("visibility", "hidden");
    },5000);
}

function checkoutPage(){
	window.location = "checkout.jsp"
}

$(document).ready(function(){
	updateCart();
});