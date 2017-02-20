package com.maiya.action;

import com.maiya.model.*;
import com.maiya.service.CollectionService;
import com.maiya.service.ColumnService;
import com.maiya.service.UserService;
import com.maiya.utils.Collections;
import com.maiya.utils.CookiesUtil;
import com.maiya.utils.MD5Utils;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.mail.HtmlEmail;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by beck on 2016/12/28.
 */
@Namespace(value = "/user")
public class UserAction extends ActionSupport {
    HttpSession session = ServletActionContext.getRequest().getSession();
    Object value = session.getAttribute("studentLogin");
    @Autowired
    private UserService userService;
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private ColumnService columnService;
    private RespBean respBean;
    private String userName;
    private String passWord;
    private Logger logger = LoggerFactory.getLogger(UserAction.class);
    private String randomVal;
    private String nickName;
    List<Picture> subPictures=new  ArrayList();
    List<Column> columns=new ArrayList<Column>();
    public String init(){
        HttpSession session= ServletActionContext.getRequest().getSession();
        Object value= session.getAttribute("studentLogin");
        if(value!=null){
            userName=value.toString().split("\\|")[1];
        }else{
            userName="youke";
        }
        List<Picture> pictureList= collectionService.findAllPic();
        java.util.Random random=new java.util.Random();
        for(int i=0;i<16;i++){
            subPictures.add(pictureList.get(random.nextInt(pictureList.size()-1)));
        }
        columns= columnService.findAllColumn();
        return SUCCESS;
    }
    public String adminInit(){
        if(value!=null&&"1".equals(value.toString().split("\\|")[2])){
            return SUCCESS;
        }
        return INPUT;
    }
    public String checkLogin(){
        if(value ==null){
            respBean=new RespBean(Collections.asMap("code","1","message","未登录"));
        }else{
            String userId=value.toString().split("\\|")[0];
            List<Collection> collections= collectionService.findAllCollection(userId);
            respBean=new RespBean(Collections.asMap("code","0","message",collections));
        }
        return  SUCCESS;
    }

    public String register() {
        String userName=CookiesUtil.getCookie(ServletActionContext.getRequest(),"userName").getValue()   ;
        List<User> list = userService.findByName(userName);
        if (list.size() > 0) {
            respBean = new RespBean(Collections.asMap("code", "1","message","用户名已存在"));
            return SUCCESS;
        }
        User user = new User();
        user.setUserName(userName);
        user.setRole("0");
        String md5Password= MD5Utils.md5Password(passWord);
        user.setUserPwd(md5Password);
        try {
            userService.saveUser(user);
            respBean=new RespBean(Collections.asMap("code","0"));
        } catch (Exception e) {
            logger.error("e{}", e);
            respBean=new RespBean(Collections.asMap("code","1","message","注册失败"));
        }
        return SUCCESS;
    }

    public String login() {
        String md5Password=MD5Utils.md5Password(passWord);
        List<User> list = userService.findByNamePwd(userName, md5Password);
        if (list.size() > 0) {
            User user=list.get(0);
            String value=user.getUserId()+"|"+user.getNickName()+"|"+user.getRole();
             HttpSession session= ServletActionContext.getRequest().getSession();
             session.setAttribute("studentLogin",value);
            if("0".equals(user.getRole())){
                respBean=new RespBean(Collections.asMap("code","1","message",user.getNickName()));
            }else if("1".equals(user.getRole())){
                respBean=new RespBean(Collections.asMap("code","2","message",user.getNickName()));
            }
        }else{
            respBean=new RespBean(Collections.asMap("code","0","message","用户名或密码错误"));
        }
        return SUCCESS;
    }

    public String loginOut(){
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.invalidate();
        respBean=new RespBean(Collections.asMap("code","0","message","success"));
        return SUCCESS;
    }
    public String getRandom(){
        HtmlEmail email = new HtmlEmail();
        email.setHostName("smtp.163.com");
        email.setAuthentication("maiyainternet@163.com", "maiya123456");
        email.setSubject("大学生收集网站");
        email.setCharset("UTF-8");
        try {
            email.setFrom("maiyainternet@163.com", "麦芽网络");
            email.addTo(userName);
            SecureRandom secureRandom=new SecureRandom();
            String random=String.valueOf(secureRandom.nextLong()).substring(1,5);
            email.setMsg("验证码是"+random);
            email.send();
            List<Random> randoms=  userService.findRandomByName(userName);
            if(randoms.size()<1){
                userService.saveRandom(new Random(userName,random));
            }else{
                userService.updateRandom(userName,random);
            }
            respBean=new RespBean(Collections.asMap("code","0","message","success"));
        } catch (Exception e) {
            respBean=new RespBean(Collections.asMap("code","1","message","fail"));
            e.printStackTrace();
        }
        return SUCCESS;
    }
    public String registerFirst(){
      List<Random> randoms=  userService.findRandomByName(userName);
      if(randoms.size()==1){
         Random random= randoms.get(0);
         if(randomVal.equals(random.getRandom())){
             respBean=new RespBean(Collections.asMap("code","0","message","success"));
             CookiesUtil.addCookie(ServletActionContext.getResponse(),"userName",userName,10);
         }else{
             respBean=new RespBean(Collections.asMap("code","1","message","fail"));
         }
      }else{
          respBean=new RespBean(Collections.asMap("code","1","message","fail"));
      }
      return SUCCESS;
    }
    public String registerInit(){
      return SUCCESS;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public RespBean getRespBean() {
        return respBean;
    }

    public void setRespBean(RespBean respBean) {
        this.respBean = respBean;
    }

    public String getRandomVal() {
        return randomVal;
    }

    public void setRandomVal(String randomVal) {
        this.randomVal = randomVal;
    }

    public List<Picture> getSubPictures() {
        return subPictures;
    }

    public void setSubPictures(List<Picture> subPictures) {
        this.subPictures = subPictures;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}
