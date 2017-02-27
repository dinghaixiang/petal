<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>属于大学生的素材收集网站--收藏夹</title>
  <style>
    body{
      margin: 0;
      padding: 0;
    }
    .first{
      width: 100%;
      height: 100px;
      display: flex;
      justify-content: space-between;
      background-color: currentColor;
    }
    .nav{
      margin:20px 40px;
      color: #ffffff;
    }
    .left{
      color: burlywood;
    }
    .nav a{
      cursor: pointer;
    }
    .right{
      display: inline-flex;
    }
    .right a{
      width: 50px;
      height: 30px;
      border: 1px solid #f0f0f0;
      border-radius: 5px;
      line-height: 30px;
      margin-left: 10px;
      text-align: center;
    }
    .content{
      margin-top: 10px;
    }

    .login{
      background-color:rgba(201,0,0,.4);
    }
    .login:hover{
      background-color:rgba(201,0,0,.9) ;
    }
    .register:hover{
      background-color: #fff;
      color: #000;
    }
    .left a:hover{
      color: burlywood;
    }

    .welcome {
      width: 90px;
    }

    .login-child input{
      width: 300px;
      height: 36px;
      background-color: #fcfcfc;
      border: 1px solid #CCC;
      box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    }
    .login-child:nth-child(5) a{
      color: red;
      cursor: pointer;
    }
    .login-child:nth-child(5) span{
      color: #777;
    }
    .email input{
      width: 300px;
      height: 36px;
      background-color: #fcfcfc;
      border: 1px solid #CCC;
      box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    }
    .random input{
      width: 200px;
      height: 36px;
      background-color: #fcfcfc;
      border: 1px solid #CCC;
      box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    }
    .random a{
      margin-left: 10px;
      display: inline-block;
      width: 90px;
      height: 36px;
      background-color: #E53E49;
      line-height: 36px;
      text-align: center;
      color: white;
      font-size: 12px;
    }
    .register-father div{
      margin: 10px auto;
    }

    .register-tips a{
      color: red;
      cursor: pointer;
    }
    .register-tips span{
      color:burlywood;
    }
    .info{
      display: none;
    }
    .info a{
      display:block;
      cursor: pointer;
      margin-top: 15px;
    }
    .info a:hover{
      background-color: gray;
    }
    .logined:hover .info{
      display: block;
    }

    *{
      margin: 0;
      padding: 0;
    }
    .nav a{
      cursor: pointer;
    }
    .left a:hover{
      color: burlywood;
    }
    .left a{
      margin-left: 20px;
    }
    .middle{
      width: 300px;
      height: 100px;
      margin: 0 auto;
      color: #777777;
      font-size: 30px;
      text-align: center;
      line-height: 100px;
    }
    .info a{
      display:block;
      cursor: pointer;
      margin-top: 15px;
    }
    .info a:hover{
      background-color: gray;
    }
    .logined:hover .info{
      display: block;
    }
    .collections{
      margin: 20px;
      display: flex;
      flex-wrap: wrap;
      justify-content:flex-start;
    }
    .collection{
      width: 400px;
      height: 500px;
      border:2px solid #dedede;
      align-content: center;
      line-height: 300px;
      align-content: center;
      margin: 15px;
      cursor: pointer;
    }
    img{
      width: 400px;
      height: 500px;
    }
    .login-box{
      background-color: #fff;
      position: fixed;
      left: 400px;
      top: 100px;
      width: 500px;
      height: 300px;
      border: 1px solid #f0f0f0;
      box-shadow: 15px 15px 20px #f0f0f0;
      border-radius: 3px;
      text-align: center;
      margin: 0 auto;
      display: none;
    }
    .register-box,.register-box2{
      background-color: #fff;
      position: fixed;
      left: 400px;
      top: 100px;
      width: 500px;
      height: 300px;
      border: 1px solid #f0f0f0;
      box-shadow: 15px 15px 20px #f0f0f0;
      border-radius: 3px;
      text-align: center;
      margin: 0 auto;
      display: none;
    }
    .register{
      color: burlywood;
    }
    .login-father,.register-father{
      margin-top: 80px;
    }
    .login-child{
      margin-top: 10px;
    }
    .login-child input{
      width: 300px;
      height: 36px;
      background-color: #fcfcfc;
      border: 1px solid #CCC;
      box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    }
    .login-btn,.register-btn{
      font-family: "\5FAE\8F6F\96C5\9ED1","helvetica neue",arial,sans-serif;
      box-shadow: 0px -2px 6px #E53E49;
      border: 2px solid #E53E49;
      line-height: 36px;
      text-align: center;
      display: inline-block;
      width: 300px;
      height: 36px;
      background-color: #E53E49;
      border-radius: 3px;
      font-size: 18px;
      color: #ffffff;
    }
    .close{
      width: 40px;
      height: 40px;
      background: url(/petal/statics/image/close.svg) no-repeat;
      background-size: contain;
      z-index: 1;
      position: absolute;
      right: 0px;
    }
    .login-child:nth-child(5){
      margin-left: 100px;
      font-size: 12px;
      width: 300px;
      display: flex;
      justify-content: space-between;
    }
    .login-child:nth-child(5) a{
      color: red;
      cursor: pointer;
    }
    .login-child:nth-child(5) span{
      color: #777;
    }
    .email input{
      width: 300px;
      height: 36px;
      background-color: #fcfcfc;
      border: 1px solid #CCC;
      box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    }
    .random input{
      width: 200px;
      height: 36px;
      background-color: #fcfcfc;
      border: 1px solid #CCC;
      box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    }
    .random a{
      margin-left: 10px;
      display: inline-block;
      width: 90px;
      height: 36px;
      background-color: #E53E49;
      line-height: 36px;
      text-align: center;
      color: white;
      font-size: 12px;
    }
    .register-father div{
      margin: 10px auto;
    }
    .register-tips{
      font-size: 12px;
    }
    .register-tips a{
      color: red;
      cursor: pointer;
    }
    .register-tips span{
      color: #777;
    }
    .info{
      display: none;
    }
    .info a{
      display:block;
      cursor: pointer;
      margin-top: 15px;
    }
    .info a:hover{
      background-color: gray;
    }
    .logined:hover .info{
      display: block;
    }

    .errorTip{
      color: red;
      display: none;
    }
    .logined{
        color: burlywood;
    }
    .admin:hover .info{
        display: block;
    }
    .forgetPwd{
        color:red;
    }
  </style>
  <script src="/petal/statics/js/jquery.min.js"></script>
  <script>
    $(function () {
      var userName="${userName?string}";
    <#if role??>
        var role="${role?string}";
    </#if>
        if(userName!="youke"){
            $(".right").hide();
            if(role=="1"){
                $(".admin").show();
                $(".logined").hide();
            }else{
                $(".logined").show();
                $(".admin").hide();
            }
        }else{
            $(".right").show();
            $(".logined").hide();
            $(".admin").hide();
        }
    $("#register").click(function () {
      $(".login-box").fadeOut();
      $(".register-box").fadeIn();
    })
    $("#login").click(function () {
      $(".login-box").fadeIn();
      $(".register-box").fadeOut();
    })
    $(".close").click(function () {
      $(this).parent().fadeOut();
    })
    $(".login").click(function () {
      $(".register-box").fadeOut();
      $(".login-box").fadeIn();
    })
    $(".register").click(function () {
      $(".register-box").fadeIn();
      $(".login-box").fadeOut();
    })
    var a=30;
    $("#random").click(function () {
      if(a!=30){
        return;
      }
      $.ajax({
        url: "/petal/user/getRandom",
        type: "post",
        dataType: "json",
        data:{"userName":$("#email").val().trim()},
        async: false,
        success:function (ret) {
          if(ret.code=="0"){
            if(ret.data.code=="0"){
              var interval=  setInterval(function () {
                $("#random").text(a+"秒后可再发送");
                a--;
                if(a<=0){
                  clearInterval(interval);
                  $("#random").text("发送验证码");
                  a=30;
                }
              },1000);
            }
          }
        }
      })
    })
    $(".register-box .register-btn").click(function () {
      $.ajax({
        url: "/petal/user/register-first",
        type: "post",
        dataType: "json",
        data: {"userName": $("#email").val().trim(), "randomVal": $("#randomVal").val().trim()},
        async: false,
        success: function (ret) {
          if(ret.code=="0") {
            if (ret.data.code == "1") {
              $(".register-box .errorTip").show();
            }else{
              location.href="/petal/user/register-init";
            }
          }
        }
      })
    })
    $(".login-btn").click(function () {
      $(".errorTip").hide()
      var name=$("#name").val().trim();
      var password=$("#password").val().trim();
      if(!name||!password){
        $(".login-box .errorTip").show();
        return
      }
      $.ajax({
        url: "/petal/user/login",
        type: "post",
        dataType: "json",
        data:{"userName":name,"passWord":password},
        async: false,
        success: function (ret) {
          if(ret.code=="0"){
            if(ret.data.code=="1"){
              $(".right").hide();
              $(".logined").show();
              $(".login-box").hide();
              $(".welcome").text(ret.data.message);
            }else if(ret.data.code=="2"){
                $(".admin").show();
                $(".right").hide();
                $(".login-box").hide();
            } else{
              $(".errorTip label").text(ret.data.message);
              $(".errorTip").show();
            }
          }
        }
      })
    })
    $(".loginOut").click(function () {
      $.ajax({
        url: "/petal/user/loginOut",
        type: "post",
        dataType: "json",
        data:{},
        async: false,
        success: function (ret) {
          if(ret.code=="0") {
            location.reload();
          }
        }
      })
    })
      $(".find").click(function () {
        location.href="/petal/user/init";
      })
      $(".last-new").click(function () {
        location.href="/petal/picDetail/findLastNew" ;
      })
        $("#collection").click(function () {
            location.href="/petal/collection/init";
        })
        $(".forgetPwd").click(function () {
            location.href="/petal/user/findPwdInit";
        })
        $("#alterNick").click(function () {
            $(".register-box").fadeOut();
            $(".login-box").fadeOut();
            $(".register-box2").fadeIn();
        })
        $(".register-box2 .register-btn").click(function () {
            $.ajax({
                url: "/petal/user/updateNickName",
                type: "post",
                dataType: "json",
                data: {},
                async: false,
                success: function (ret) {
                    if(ret.data.code=="0") {
                        location.reload();
                    }else{
                        alert("系统异常");
                    }
                }
            })
        })

    })

  </script>
</head>
<body>
<div class="header">
  <div class="first">
    <div class="nav left">
      <a class="find">发现</a>
      <a class="last-new">最新</a>
    </div>

      <div class="nav right">
          <a class="login">登录</a>
          <a class="register">注册</a>
      </div>

      <div class="nav logined">
          <div class="welcome">${userName}</div>
          <div class="info">
              <a id="collection">我的收藏夹</a>
              <a id="alterNick">更改昵称</a>
              <a class="loginOut">退出登录</a>
          </div>
      </div>
      <div class="nav admin">
          <div class="welcome">管理员</div>
          <div class="info">
              <a id="columnManger">专栏配置</a>
              <a id="findUser">查看用户</a>
              <a class="loginOut">退出登录</a>
          </div>
      </div>
  </div>
</div>
<div class="middle">
  <span>-----</span>专栏<span>-----</span>
</div>
<div class="content">
  <div class="collections">
    <#list pictureList as picture>
      <div class="collection add">
        <a href="/petal/picDetail/detail?picId=${picture.picId}">
          <img src="/pic/${picture.picName}">
        </a>
      </div>
    </#list>
  </div>
</div>
<div class="login-box">
  <div class="close"></div>
  <div class="login-father">
    <div class="login-child errorTip">
      <label class="tips">请输入用户名或密码</label>
    </div>
    <div class="login-child">
      <input type="text" id="name" placeholder="输入用户名">
    </div>
    <div class="login-child">
      <input type="password" id="password" placeholder="密码">
    </div>
    <div class="login-child">
      <a class="login-btn">登录</a>
    </div>
    <div class="login-child">
        <div class="forgetPwd"><a>忘记密码</a></div>
      <div><span>还没有帐号？</span><a id="register">点此注册>></a></div>
    </div>
  </div>
</div>
<div class="register-box">
  <div class="close"></div>
  <div class="register-father">
    <div class="email">
      <input type="text" id="email" placeholder="请输入邮箱">
    </div>
    <div class="random">
      <input type="text" placeholder="邮箱验证码" id="randomVal"><a id="random">发送验证码</a>
    </div>
    <div class="errorTip">
      <label class="tips">验证码或邮箱错误</label>
    </div>
    <div class="register-btn">
      <a>下一步</a>
    </div>
    <div class="register-tips">
      <span>已有帐号？</span><a id="login">点此登录>></a>
    </div>
  </div>
</div>
<div class="register-box2">
    <div class="close"></div>
    <div class="register-father">
        <div class="email">
            <input type="text" id="nickName" placeholder="请输入新的昵称">
        </div>
        <div class="register-btn">
            <a>修改</a>
        </div>
    </div>
</div>
</body>
</html>