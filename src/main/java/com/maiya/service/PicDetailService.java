package com.maiya.service;

import com.maiya.model.Picture;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by beck on 2017/2/9.
 */
@Service
public class PicDetailService {
    @Autowired
    private SessionFactory sessionFactory;
    public List<Picture> findPicById(String picId){
        Session session = sessionFactory.openSession();
        String sql = "select p.picId,p.collectId,p.vaild,p.keyword,p.picName,p.picSize,p.picFormat,p.uploadTime,u.nickName 'userId' from picture p left JOIN userinfo u on p.userId=u.userId  where p.vaild='1' and p.picId=?";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        query.setString(0, picId);
        return query.list();
    }
    public List<Picture> findAllPic(){
        Session session = sessionFactory.openSession();
        String sql = "select * from picture where vaild='1'ORDER by uploadTime desc";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        return query.list();
    }
    public List<Picture> findAllPicByKey(String keyword){
        Session session = sessionFactory.openSession();
        String sql = "select * from picture where vaild='1' and keyword like concat('%',?,'%')ORDER by uploadTime desc";
        SQLQuery query = session.createSQLQuery(sql).addEntity(Picture.class);
        query.setString(0,keyword);
        return query.list();
    }
}
