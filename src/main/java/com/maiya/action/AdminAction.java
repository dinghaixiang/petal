package com.maiya.action;

import com.maiya.model.User;
import com.maiya.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by beck on 2017/2/10.
 */
public class AdminAction extends ActionSupport {
    HttpSession session = ServletActionContext.getRequest().getSession();
    Object value = session.getAttribute("studentLogin");
    @Autowired
    private AdminService adminService;
    List<User> userList=new ArrayList<User>();
    public String init(){
        if(value!=null&&"1".equals(value.toString().split("\\|")[2])){
            return SUCCESS;
        }
        return INPUT;
    }
    public String allUser(){
        if(value!=null&&"1".equals(value.toString().split("\\|")[2])){
            userList =adminService.findAllUser();
            return SUCCESS;
        }
        return INPUT;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
