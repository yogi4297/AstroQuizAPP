package com.yoga.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class test {

	public static void main(String[] args) {
		
		Configuration cfg = new Configuration();
		
		cfg.configure("hibernate.cfg.xml");
		
		SessionFactory sf = cfg.buildSessionFactory();
		Session session = sf.openSession();
		Transaction transaction= session.beginTransaction();
		Employee emp = new Employee();
		emp.setName("Yoga");
		emp.setSalary(100000);
		session.save(emp);
		transaction.commit();
		session.close();
		System.out.println("inserted");
	}
}
