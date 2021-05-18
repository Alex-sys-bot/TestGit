package com.company.dao.impl;

import com.company.dao.Dao;
import com.company.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

public class ProductDaoImpl implements Dao<Product, Integer> {

    private final SessionFactory factory;

    public ProductDaoImpl(SessionFactory factory) {
        this.factory = factory;
    }

    @Override
    public void save(Product product) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.save(product);
            session.getTransaction().commit();
        }
    }

    @Override
    public void update(Product product) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.update(product);
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(Product product) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.delete(product);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<Product> returnAll() {
        try (Session session = factory.openSession()){
            Query<Product> query = session.createQuery("from Product");
            return query.list();
        }
    }

    @Override
    public Product returnById(Integer integer) {
        try (Session session = factory.openSession()){
            return session.get(Product.class, integer);
        }
    }
}
