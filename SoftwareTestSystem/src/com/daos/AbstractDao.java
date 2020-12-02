package com.daos;

import java.util.ArrayList;

public abstract class AbstractDao {
    public abstract int add(Object obj);
    public abstract int update(Object obj);
    public abstract int delete(String no);
    public abstract ArrayList<Object> queryAll();
    public abstract Object query(String no);
}
