package com.maiya.action;

import com.maiya.model.*;
import com.maiya.service.CollectionService;
import com.maiya.service.ColumnService;
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
 * Created by beck on 2017/2/8.
 */
@Namespace(value = "/columnDetail")
public class ColumnDetailAction extends ActionSupport {
    HttpSession session = ServletActionContext.getRequest().getSession();
    Object value = session.getAttribute("studentLogin");
    private String userName="";
    private String columnId;
    private String picId;
    private String columnName;
    List<Picture> pictureList=new ArrayList<Picture>();
    private List<String> file1FileName;
    private List<File> file1;
    private String key;
    @Autowired
    private ColumnService columnService;
    @Autowired
    private CollectionService collectionService;
    private RespBean respBean;
    List<Column> columns;
    private String role;
    public String save(){
        Column column=new Column();
        column.setColumnName(columnName);
        column.setState("1");
        try {
            columnService.saveColumn(column);
            respBean=new RespBean(Collections.asMap("code","0","message","success"));
        }catch (Exception e){
            respBean=new RespBean(Collections.asMap("code","1","message","fail"));
        }
        return SUCCESS;
    }
    public String delete(){
        try {
            columnService.deleteColumn(columnId);
            respBean=new RespBean(Collections.asMap("code","0","message","success"));
        }catch (Exception e){
            respBean=new RespBean(Collections.asMap("code","1","message","fail"));
        }
        return SUCCESS;
    }
    public String detail(){
        if(value!=null){
            userName=value.toString().split("\\|")[1];
            role=value.toString().split("\\|")[2];
        }else{
            userName="youke";
        }
        pictureList= columnService.findColumnPic(columnId);
        return SUCCESS;
    }
    public String adminColumnIndex(){
        if(value!=null&&"1".equals(value.toString().split("\\|")[2])){
            columns= columnService.findAllColumn();
            return SUCCESS;
        }
        return INPUT;
    }
    public String adminColumnDeatil(){
        pictureList= columnService.findColumnPic(columnId);
        return SUCCESS;
    }
    public String deleteColumnPic(){
        try{
            columnService.deleteColumnPic(columnId,picId);
            respBean=new RespBean(Collections.asMap("code","0","message","success"));
        }catch (Exception e){
            respBean=new RespBean(Collections.asMap("code","1","message","fail"));
        }
        return SUCCESS;
    }
    public String upload(){
        try{
            for(int i=0;i<file1.size();i++){
                long fileSize=file1.get(i).length();
                String format=file1FileName.get(i).split("\\.")[1];
                FileInputStream fis=new FileInputStream(file1.get(i));
                String newFileName= UUID.randomUUID().toString()+"."+format;
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
                picture.setKeyWord(key);
                picture.setPicFormat(format);
                picture.setPicName(newFileName);
                picture.setPicSize(String.valueOf(fileSize));
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                picture.setUploadTime(sdf.format(new Date()));
                collectionService.savePicture(picture);
                List<Picture> specialPictures= collectionService.findPicByName(newFileName);
                ColumnPic columnPic=new ColumnPic();
                columnPic.setColumnId(Integer.valueOf(columnId));
                columnPic.setPicId(specialPictures.get(0).getPicId());
                columnPic.setState("1");
                columnService.saveColumnPic(columnPic);
            }
            ServletActionContext.getResponse().sendRedirect("http://localhost:7001/petal/columnDetail/adminColumnDeatil?columnId="+columnId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getColumnId() {
        return columnId;
    }

    public void setColumnId(String columnId) {
        this.columnId = columnId;
    }

    public List<Picture> getPictureList() {
        return pictureList;
    }

    public void setPictureList(List<Picture> pictureList) {
        this.pictureList = pictureList;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }

    public String getPicId() {
        return picId;
    }

    public void setPicId(String picId) {
        this.picId = picId;
    }

    public RespBean getRespBean() {
        return respBean;
    }

    public void setRespBean(RespBean respBean) {
        this.respBean = respBean;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public List<String> getFile1FileName() {
        return file1FileName;
    }

    public void setFile1FileName(List<String> file1FileName) {
        this.file1FileName = file1FileName;
    }

    public List<File> getFile1() {
        return file1;
    }

    public void setFile1(List<File> file1) {
        this.file1 = file1;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
