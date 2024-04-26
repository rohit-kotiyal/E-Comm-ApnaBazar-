package com.apnaBazar.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	
	private int productPrice;
	
	private int productDiscount;
	
	private int productQuantity;
	
	private String productName;
	
	@ManyToOne
	private Category category;
	
	@Column(length = 3000)
	private String productDescription;
	
	@Column(columnDefinition = "LONGBLOB")
	private byte[] productPhoto;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productId, int productPrice, int productDiscount, int productQuantity, String productName,
			Category category, String productDescription, byte[] productPhoto) {
		super();
		this.productId = productId;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.productName = productName;
		this.category = category;
		this.productDescription = productDescription;
		this.productPhoto = productPhoto;
	}

	public Product(int productPrice, int productDiscount, int productQuantity, String productName, Category category,
			String productDescription, byte[] productPhoto) {
		super();
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.productName = productName;
		this.category = category;
		this.productDescription = productDescription;
		this.productPhoto = productPhoto;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public byte[] getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(byte[] productPhoto) {
		this.productPhoto = productPhoto;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productPrice=" + productPrice + ", productDiscount="
				+ productDiscount + ", productQuantity=" + productQuantity + ", productName=" + productName
				+ ", category=" + category + ", productDescription=" + productDescription + ", productPhoto="
				+ productPhoto + "]";
	}
	
	public int getPriceAfterDiscount() {
		int discount = (int)(this.getProductDiscount() / 100.0 * this.getProductPrice());
		
		return this.getProductPrice() - discount;
	}
}
