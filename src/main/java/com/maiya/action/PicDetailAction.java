package com.maiya.action;

import com.maiya.model.Picture;
import com.maiya.service.PicDetailService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by beck on 2017/2/9.
 */
@Namespace("/picDetail")
public class PicDetailAction extends ActionSupport {
    private String picId;
    private Picture picture;
    private List<Picture> subPictures=new ArrayList<Picture>();
    private String time;
    private String keyWord;
    private List<Picture> pictureList =new ArrayList<Picture>();
    @Autowired
    private PicDetailService picDetailService;
    private String userName;
    public String detail(){
        List<Picture> pictureList= picDetailService.findPicById(picId);
        picture=pictureList.get(0);
        List<Picture> pictures= picDetailService.findAllPic();
        Random random=new Random();
        for(int i=0;i<6;i++){
            subPictures.add(pictures.get(random.nextInt(pictures.size()-1)));
        }
        return SUCCESS;
    }
    public String findAllPicByKey(){
        HttpSession session= ServletActionContext.getRequest().getSession();
        Object value= session.getAttribute("studentLogin");
        if(value!=null){
            userName=value.toString().split("\\|")[1];
        }else{
            userName="youke";
        }
        pictureList= picDetailService.findAllPicByKey(keyWord);
        return SUCCESS;
    }
    public String findLastNew(){
        HttpSession session= ServletActionContext.getRequest().getSession();
        Object value= session.getAttribute("studentLogin");
        if(value!=null){
            userName=value.toString().split("\\|")[1];
        }else{
            userName="youke";
        }
        pictureList= picDetailService.findAllPic();
        return SUCCESS;
    }

    public String getPicId() {
        return picId;
    }

    public void setPicId(String picId) {
        this.picId = picId;
    }

    public Picture getPicture() {
        return picture;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public List<Picture> getSubPictures() {
        return subPictures;
    }

    public void setSubPictures(List<Picture> subPictures) {
        this.subPictures = subPictures;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public List<Picture> getPictureList() {
        return pictureList;
    }

    public void setPictureList(List<Picture> pictureList) {
        this.pictureList = pictureList;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
