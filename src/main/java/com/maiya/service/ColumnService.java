package com.maiya.service;

import com.maiya.model.Column;
import com.maiya.model.ColumnPic;
import com.maiya.model.Picture;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by beck on 2017/2/8.
 */
@Service
public class ColumnService {
    @Autowired
    private SessionFactory sessionFactory;
    public void saveColumn(Column column){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(column);
        session.getTransaction().commit();
    }
    public void saveColumnPic(ColumnPic columnPic){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(columnPic);
        session.getTransaction().commit();
    }
    public List<Column> findAllColumn(){
        Session session = sessionFactory.openSession();
        String sql = "select * from myColumn where state='1'";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Column.class);
        return query.list();
    }
    public List<Picture> findColumnPic(String columnId){
        Session session = sessionFactory.openSession();
        String sql = "select * from columnpic left JOIN picture on columnpic.picId=picture.picId where columnpic.state='1' and picture.vaild='1' and columnpic.columnId=?;";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        query.setString(0, columnId);
        return query.list();
    }
    public void deleteColumnPic(String columnId,String picId){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "UPDATE columnpic set state='0' WHERE columnId=? and picId=?";
        SQLQuery query = session.createSQLQuery(sql);
        query.setString(0, columnId);
        query.setString(1, picId);
        query.executeUpdate();
        session.getTransaction().commit();
    }
    public int deleteColumn(String columnId){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "UPDATE mycolumn set state='0' WHERE columnId=?";
        SQLQuery query = session.createSQLQuery(sql);
        query.setString(0, columnId);
        int i= query.executeUpdate();
        session.getTransaction().commit();
        return i;
    }
}
