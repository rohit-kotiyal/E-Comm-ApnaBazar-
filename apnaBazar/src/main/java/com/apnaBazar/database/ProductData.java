package com.apnaBazar.database;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.apnaBazar.entities.Product;

import jakarta.persistence.Query;

public class ProductData {
	private SessionFactory factory;
	
	public ProductData(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		boolean flag = false;
		try{
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			
			session.persist(product);
			
			transaction.commit();
			session.close();
			
			flag = true;
		}catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		
		return flag;
	}
	
	// Get all product
	public List<Product> getAllProducts(){
		Session session = factory.openSession();
		
		Query query = session.createQuery("from Product", Product.class);
		
		List<Product> list = query.getResultList();
		
		return list;
	}
	
	// Get all product of given ID
		public List<Product> getAllProductsById(int catId){
			Session session = factory.openSession();
			
			Query query = session.createQuery("from Product where category.categoryId =: id", Product.class);
			query.setParameter("id", catId);
			
			List<Product> list = query.getResultList();
			
			return list;
		}
		
		public int getNumOfPro() {
			int num = 0;
			try {
				Session session = factory.openSession();
				
				String hql = "from Product";
				Query query = session.createQuery(hql, Product.class);
				
				num = query.getResultList().size();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return num;
		}
}
