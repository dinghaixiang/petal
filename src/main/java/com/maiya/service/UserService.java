package com.maiya.service;

import com.maiya.model.Random;
import com.maiya.model.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by beck on 2016/12/30.
 */
@Service
public class UserService {
    @Autowired
    private SessionFactory sessionFactory;

    public void saveUser(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
    }

    public List<User> findByNamePwd(String userName, String passWord) {
        Session session = sessionFactory.openSession();
        String sql = "select * from userInfo where username=? and userpwd=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(User.class);
        query.setString(0, userName);
        query.setString(1, passWord);
        return query.list();
    }

    public List<User> findByName(String userName) {
        Session session = sessionFactory.openSession();
        String sql = "select * from userInfo where username=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(User.class);
        query.setString(0, userName);
        return query.list();
    }
    public List<Random> findRandomByName(String userName){
        Session session = sessionFactory.openSession();
        String sql = "select * from random where username=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Random.class);
        query.setString(0,userName);
        return  query.list();
    }
    public void saveRandom(Random random){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(random);
        session.getTransaction().commit();
    }
    public int updateRandom(String userName,String random){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "update random set random = :random where username=:userName";
        int i=session.createSQLQuery(sql).setString("random",random).setString("userName",userName).executeUpdate();
        session.getTransaction().commit();
        return i;
    }
    public int updatePwd(String userName,String newPwd){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "update userInfo set userPwd = :newPwd where userName=:userName";
        int i=session.createSQLQuery(sql).setString("newPwd",newPwd).setString("userName",userName).executeUpdate();
        session.getTransaction().commit();
        return i;
    }
    public int updateNickName(String userid,String nickName){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "update userInfo set nickName = :nickName where userid=:userid";
        int i=session.createSQLQuery(sql).setString("userid",userid).setString("nickName",nickName).executeUpdate();
        session.getTransaction().commit();
        return i;
    }
}
