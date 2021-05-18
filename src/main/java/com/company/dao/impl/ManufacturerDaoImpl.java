package com.company.dao.impl;

import com.company.dao.Dao;
import com.company.model.Manufacturer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

public class ManufacturerDaoImpl implements Dao<Manufacturer, Integer> {

    private final SessionFactory factory;

    public ManufacturerDaoImpl(SessionFactory factory) {
        this.factory = factory;
    }

    @Override
    public void save(Manufacturer manufacturer) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.save(manufacturer);
            session.getTransaction().commit();
        }
    }

    @Override
    public void update(Manufacturer manufacturer) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.update(manufacturer);
            session.getTransaction().commit();
        }
    }

    @Override
    public void delete(Manufacturer manufacturer) {
        try (Session session = factory.openSession()){
            session.beginTransaction();
            session.delete(manufacturer);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<Manufacturer> returnAll() {
        try (Session session = factory.openSession()){
            Query<Manufacturer> query = session.createQuery("from Manufacturer");
            return query.list();
        }
    }

    @Override
    public Manufacturer returnById(Integer integer) {
        try (Session session = factory.openSession()){
            return session.get(Manufacturer.class, integer);
        }
    }
}
