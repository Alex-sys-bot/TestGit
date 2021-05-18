package com.company.dao.impl;

import com.company.dao.Dao;
import com.company.model.ProductSale;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

public class ProductSaleDaoImpl implements Dao<ProductSale, Integer> {

    private final SessionFactory factory;

    public ProductSaleDaoImpl(SessionFactory factory) {
        this.factory = factory;
    }

    @Override
    public void save(ProductSale productSale) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.save(productSale);
            session.getTransaction().commit();
        }
    }

    @Override
    public void update(ProductSale productSale) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.update(productSale);
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(ProductSale productSale) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.delete(productSale);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<ProductSale> returnAll() {
        try (Session session = factory.openSession()){
            Query<ProductSale> query = session.createQuery("from ProductSale ");
            return query.list();
        }
    }

    @Override
    public ProductSale returnById(Integer integer) {
        try (Session session = factory.openSession()){
            return session.get(ProductSale.class, integer);
        }
    }
}
