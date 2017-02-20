package com.maiya.service;

import com.maiya.model.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by beck on 2017/2/12.
 */
@Service
public class AdminService {
    @Autowired
    private SessionFactory sessionFactory;
    public List<User> findAllUser(){
        Session session = sessionFactory.openSession();
        String sql = "select * from userInfo";
        SQLQuery query = session.createSQLQuery(sql).addEntity(User.class);
        return query.list();
    }
}
