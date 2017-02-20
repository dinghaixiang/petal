package com.maiya.service;

import com.maiya.model.CollectPic;
import com.maiya.model.Collection;
import com.maiya.model.Picture;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by beck on 2017/1/27.
 */
@Service
public class CollectionService {
    @Autowired
    private SessionFactory sessionFactory;
    public List<Collection> findAllCollection(String userId){
        Session session = sessionFactory.openSession();
        String sql = "select * from collection where vaild='1' and userId=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Collection.class);
        query.setString(0, userId);
        return query.list();
    }
    public void saveCollections(Collection collection){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(collection);
        session.getTransaction().commit();
    }
    public List<Picture> findPicByCollectionId(String collectionId){
        Session session = sessionFactory.openSession();
        String sql = "select * from collectpic left join picture on collectpic.picId=picture.picId where collectpic.collectId=? and collectpic.vaild='1'";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        query.setString(0, collectionId);
        return query.list();
    }
    public List<Picture> findAllPic(){
        Session session = sessionFactory.openSession();
        String sql = "select * from picture where vaild='1'";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        return query.list();
    }
    public void savePicture(Picture picture){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(picture);
        session.getTransaction().commit();
    }
    public void saveCollectPic(CollectPic collectPic){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(collectPic);
        session.getTransaction().commit();
    }
    public List<Picture> findPicByName(String picName){
        Session session = sessionFactory.openSession();
        String sql = "select * from picture where picName=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        query.setString(0, picName);
        return query.list();
    }
    public List<CollectPic> findCollectById(String collectId,String picId){
        Session session = sessionFactory.openSession();
        String sql = "select * from collectPic where collectId=? and picId=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(CollectPic.class);
        query.setString(0, collectId);
        query.setString(1, picId);
        return query.list();
    }
    public void updateCollectionName(String collectionId,String collectionNewName){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "update collection set collectName=? where collectId=?";
        SQLQuery query = session.createSQLQuery(sql);
        query.setString(0, collectionNewName);
        query.setString(1, collectionId);
        query.executeUpdate();
        session.getTransaction().commit();
    }
    public void deleteCollect(String collectionId){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "update collection set vaild='0' where collectId=?";
        SQLQuery query = session.createSQLQuery(sql);
        query.setString(0, collectionId);
        query.executeUpdate();
        session.getTransaction().commit();
    }

}
