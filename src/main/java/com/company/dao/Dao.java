package com.company.dao;

import java.util.List;

public interface Dao<Entity, Id> {
    void save(Entity entity);
    void update(Entity entity);
    void delete(Entity entity);
    List<Entity> returnAll();
    Entity returnById(Id id);
}
