package com.maiya.action;

import com.maiya.model.CollectPic;
import com.maiya.model.Collection;
import com.maiya.model.Picture;
import com.maiya.model.RespBean;
import com.maiya.service.CollectionService;
import com.maiya.utils.Collections;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by beck on 2017/1/27.
 */
@Namespace(value = "/collection")
public class CollectionAction extends ActionSupport {
    HttpSession session = ServletActionContext.getRequest().getSession();
    Object value = session.getAttribute("studentLogin");
    List<Collection> collectionList = new ArrayList<Collection>();
    @Autowired
    private CollectionService service;
    private String CollectionName;
    private RespBean respBean;
    private String userName;
    private List<File> file1;
    private String collectionId;
    private List<Picture> pictureList;
    private List<String> file1FileName;
    private String key;
    private String picId;
    private String collectionNewName;
    private String newCollectionId;
    private String role;

    public String init() {
        String userId = value.toString().split("\\|")[0];
        if(value!=null){
            userName=value.toString().split("\\|")[1];
            role=value.toString().split("\\|")[2];
        }else{
            userName="youke";
        }
        List<Collection> collections = service.findAllCollection(userId);
        for(Collection collection:collections){
            List<Picture> pictureList=service.findPicByCollectionId(String.valueOf(collection.getCollectId()));
            if(pictureList.size()>0){
                collection.setUrl(pictureList.get(0).getPicName());
            }
            collectionList.add(collection);
        }
        return SUCCESS;
    }
    public String add(){
        String userId = value.toString().split("\\|")[0];
        Collection collection=new Collection();
        collection.setCollectName(CollectionName);
        collection.setUserId(Integer.valueOf(userId));
        collection.setVaild("1");
        service.saveCollections(collection);
        respBean=new RespBean(Collections.asMap("code","1","message","新建成功"));
        return SUCCESS;
    }
    public String detail(){
        if(value!=null){
            userName=value.toString().split("\\|")[1];
        }
        pictureList=service.findPicByCollectionId(collectionId);
        return SUCCESS;
    }
    public String updateCollection(){
        try{
            service.updateCollectionName(collectionId,collectionNewName);
            respBean=new RespBean(Collections.asMap("code","1","message","修改成功"));
        }catch (Exception e){
            respBean=new RespBean(Collections.asMap("code","0","message","修改失败"));
            e.printStackTrace();
        }
       return SUCCESS;
    }
    public String delete(){
        try {
            service.deleteCollect(collectionId);
            respBean=new RespBean(Collections.asMap("code","1","message","删除成功"));
        }catch (Exception e){
            respBean=new RespBean(Collections.asMap("code","0","message","修改失败"));
            e.printStackTrace();
        }
        return SUCCESS;
    }
    public String deletePic(){
        try {
            service.deletePic(collectionId,picId);
            respBean=new RespBean(Collections.asMap("code","1","message","删除成功"));
        }catch (Exception e){
            respBean=new RespBean(Collections.asMap("code","0","message","修改失败"));
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String upload(){
        try{
            for(int i=0;i<file1.size();i++){
                long fileSize=file1.get(i).length();
                String format=file1FileName.get(i).split("\\.")[1];
                FileInputStream fis=new FileInputStream(file1.get(i));
                String newFileName=UUID.randomUUID().toString()+"."+format;
                File toFile=new File("C:\\pic\\"+ newFileName);
                if(!toFile.exists()){
                    toFile.createNewFile();
                }
                FileOutputStream fos=new FileOutputStream(toFile);
                IOUtils.copy(fis,fos);
                fis.close();
                fos.close();
                Picture picture=new Picture();
                picture.setVaild("1");
                picture.setCollectId(collectionId);
                picture.setKeyWord(key);
                picture.setPicFormat(format);
                picture.setPicName(newFileName);
                picture.setPicSize(String.valueOf(fileSize));
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                picture.setUploadTime(sdf.format(new Date()));
                picture.setUserId(value.toString().split("\\|")[0]);
                service.savePicture(picture);
                List<Picture> specialPictures= service.findPicByName(newFileName);
                CollectPic collectPic=new CollectPic();
                collectPic.setCollectId(Integer.valueOf(collectionId));
                collectPic.setVaild("1");
                collectPic.setPicId(specialPictures.get(0).getPicId());
                service.saveCollectPic(collectPic);
            }
            ServletActionContext.getResponse().sendRedirect("/petal/collection/detail?collectionId="+collectionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public String collect(){
       List<CollectPic> collectPics= service.findCollectById(collectionId,picId);
       if(collectPics.size()>0){
           respBean=new RespBean(Collections.asMap("code","0","message","该图片已存在当前收藏夹中"));
       }else {
           CollectPic collectPic=new CollectPic();
           collectPic.setCollectId(Integer.valueOf(collectionId));
           collectPic.setVaild("1");
           collectPic.setPicId(Integer.valueOf(picId));
           service.saveCollectPic(collectPic);
           respBean=new RespBean(Collections.asMap("code","1","message","success"));
       }
       return SUCCESS;
    }

    public String updatePicCollection(){
        try{
            service.updatePicCollection(collectionId,picId,newCollectionId);
            respBean=new RespBean(Collections.asMap("code","1","message","success"));
        }catch (Exception e){
            e.printStackTrace();
            respBean=new RespBean(Collections.asMap("code","0","message","fail"));
        }
        return SUCCESS;
    }

    public List<Collection> getCollectionList() {
        return collectionList;
    }

    public void setCollectionList(List<Collection> collectionList) {
        this.collectionList = collectionList;
    }

    public String getCollectionName() {
        return CollectionName;
    }

    public void setCollectionName(String collectionName) {
        CollectionName = collectionName;
    }

    public RespBean getRespBean() {
        return respBean;
    }

    public void setRespBean(RespBean respBean) {
        this.respBean = respBean;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<File> getFile1() {
        return file1;
    }

    public void setFile1(List<File> file1) {
        this.file1 = file1;
    }

    public List<String> getFile1FileName() {
        return file1FileName;
    }

    public void setFile1FileName(List<String> file1FileName) {
        this.file1FileName = file1FileName;
    }

    public String getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(String collectionId) {
        this.collectionId = collectionId;
    }

    public List<Picture> getPictureList() {
        return pictureList;
    }

    public void setPictureList(List<Picture> pictureList) {
        this.pictureList = pictureList;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getPicId() {
        return picId;
    }

    public void setPicId(String picId) {
        this.picId = picId;
    }

    public String getCollectionNewName() {
        return collectionNewName;
    }

    public void setCollectionNewName(String collectionNewName) {
        this.collectionNewName = collectionNewName;
    }

    public String getNewCollectionId() {
        return newCollectionId;
    }

    public void setNewCollectionId(String newCollectionId) {
        this.newCollectionId = newCollectionId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
