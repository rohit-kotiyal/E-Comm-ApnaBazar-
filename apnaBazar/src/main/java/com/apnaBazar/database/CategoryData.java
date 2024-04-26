package com.apnaBazar.database;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.apnaBazar.db_conn.FactoryProvider;
import com.apnaBazar.entities.Category;

import jakarta.persistence.Query;

public class CategoryData {
	private SessionFactory factory;
	
	public CategoryData(SessionFactory factory) {
		this.factory = factory;
	}
	
	public void saveCategory(Category cat) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		session.persist(cat);
		
		transaction.commit();
		session.close();
	}
	
	public List<Category> getCategories() {
		Session session = factory.openSession();
		Query query = session.createQuery("from Category", Category.class);
		List<Category> list = query.getResultList();
		return list;
	}
	
	public Category getCategorybyId(int cid) {
		Session session = factory.openSession();
		Category category = session.get(Category.class, cid);
		session.close();
		return category;
	}
	
	public int getNumOfCat() {
		int num = 0;
		try {
			Session session = factory.openSession();
			
			String hql = "from Category";
			Query query = session.createQuery(hql, Category.class);
			num = query.getResultList().size();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}
}
