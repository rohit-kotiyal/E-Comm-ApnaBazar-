package com.apnaBazar.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	
	@Column(length = 100)
	private String categoryTitle;
	
	@Column(length = 2000)
	private String categoryDescripion;
	
	@OneToMany(mappedBy = "category")
	private List<Product> product = new ArrayList<Product>();

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Category(int categoryId, String categoryTitle, String categoryDescripion, List<Product> product) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDescripion = categoryDescripion;
		this.product = product;
	}

	public Category(String categoryTitle, String categoryDescripion, List<Product> product) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDescripion = categoryDescripion;
		this.product = product;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDescripion() {
		return categoryDescripion;
	}

	public void setCategoryDescripion(String categoryDescripion) {
		this.categoryDescripion = categoryDescripion;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescripion="
				+ categoryDescripion + ", product=" + product + "]";
	}
}
