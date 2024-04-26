package com.apnaBazar.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.apnaBazar.entities.User;

import jakarta.persistence.Query;

public class UserData {
	private SessionFactory factory;

	public UserData(SessionFactory factory) {
		this.factory = factory;
	}
	public User getData(String email, String pass) {
		User user = null;
		
		try {
			String hql = "from User where userEmail=:e and userPassword=:p";
			Session session = factory.openSession();
			
			Query query = session.createQuery(hql, User.class);
			query.setParameter("e", email);
			query.setParameter("p", pass);
			
			user = (User) query.getSingleResult();
			
			session.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int getNumOfUser() {
		int num = 0;
		try {
			String hql = "from User where userType=:u";
			Session session = factory.openSession();
			
			Query query = session.createQuery(hql, User.class);
			query.setParameter("u", "user");
			num = query.getResultList().size();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return num;
	}
}
