package org.zhengwei.mango.core.service;

public interface CrudService<T> {

    int save(T record);

    int delete(T record);

    T findById(int id);

    PageResult findPage()
}
