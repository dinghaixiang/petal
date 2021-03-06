<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>属于大学生的素材收集网站</title>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        .header{
            background-image:url("/petal/statics/image/index.jpg");
            height: 500px;
            width:100%;

        }
        .first{
            width: 100%;
            height: 100px;
            display: flex;
            justify-content: space-between;
        }
        .nav{
            margin:20px 40px;
            color: #ffffff;
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
        .title{
            font-family: "\5FAE\8F6F\96C5\9ED1","helvetica neue",arial,sans-serif;
            color: #fff;
            font-weight: 600;
            font-size: 24px;
            width: 300px;
            margin: 80px auto 0;
            text-align: center;
        }
        .content{
            margin-top: 10px;
        }
        .focus{
            margin: 20px;
            display: flex;
            justify-content: space-between;
        }
        .focus a{
            display: inline-block;
            width: 164px;
            height: 70px;
            line-height: 70px;
            text-align: center;
            font-family: "\5FAE\8F6F\96C5\9ED1","helvetica neue",arial,sans-serif;
            color: #fff;
            background-image: url("/petal/statics/image/focus-bg.jpg");
            font-weight: 900;
            text-decoration: none;
        }
        .search{
            width: 600px;
            height: 50px;
            margin: 0 auto;
            text-align: center;
        }
        .search input{
            width: 550px;
            height: 40px;
            background: rgba(0,0,0,.15);
            border: 1px solid rgba(255,255,255,.5);
        }
        .icon{
            display: inline-block;
            width: 40px;
            height: 40px;
            background: url(/petal/statics/image/search.svg) no-repeat;
            background-size: contain;
            position: relative;
            top: 15px;
            left: -50px;
            border: 0px;
            border-left: 1px solid rgba(255,255,255,.5);
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
        .picures{
            display: flex;
            justify-content:space-between;
            flex-wrap: wrap;
            margin: 20px;
        }
        .pic{
            border: 1px solid rgba(255,255,255,.5);
            position: relative;
            margin-top: 20px
        }
        .pic img{
            height:300px;
            width:300px;
        }
        .recommend{
            width: 100px;
            margin: 10px auto;
            text-align: center;
        }
        .collect{
            background: url(/petal/statics/image/collect2.svg) no-repeat;
            display: inline-block;
            width: 40px;
            height: 40px;
            background-size: contain;
            z-index: 1;
            position: absolute;
            right: 0px;
            display: none;
        }
        .collect-end{
            background: url(/petal/statics/image/collect.svg) no-repeat;
            display: inline-block;
            width: 40px;
            height: 40px;
            background-size: contain;
            z-index: 1;
            position: absolute;
            right: 0px;
            display: none;
        }
        .pic:hover{
            transform: scale(1.1,1.1);
        }
        .pic:hover .collect{
            display: block;
        }
        .pic:hover .collect-end{
            display: block;
        }
        .welcome {
            width: 90px;
        }
        .footer{
            line-height: 60px;
            text-align: center;
            height:60px;
            background-color: darkgray;
            color: #ffffff;
            font-size: 14px;
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
            cursor: pointer;
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
        .admin:hover .info{
            display: block;
        }
        #searchForm{
            display: inline;
        }
        .errorTip{
            color: red;
            display: none;
        }
        .forgetPwd{
            color: red;
        }


    </style>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        var userName="${userName?string}";
        <#if role??>
        var role="${role?string}";
        </#if>
        $(function () {
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
            $("#alterNick").click(function () {
                $(".register-box").fadeOut();
                $(".login-box").fadeOut();
                $(".register-box2").fadeIn();
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
                            }else if(ret.data.code == "2"){
                                $(".register-box .errorTip").text("邮箱已被注册").show();
                            } else{
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
                        if(ret.data.code=="0") {
                            location.reload();
                        }
                    }
                })
            })
            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for(var i=0; i<ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0)==' ') c = c.substring(1);
                    if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
                }
                return "";
            }
            $("#collection").click(function () {
                location.href="/petal/collection/init";
            })
            $(".find").click(function () {
                location.href="/petal/user/init";
            })
            $("#search").click(function () {
                var keyword=getCookie("keyword");
                document.cookie="keyword="+encodeURI($("#searchVal").val())+"|"+keyword;
                $("#searchForm").submit();
            })
            $(".last-new").click(function () {
                location.href="/petal/picDetail/findLastNew" ;
            })
            $(".forgetPwd").click(function () {
                location.href="/petal/user/findPwdInit";
            })
            $(".register-box2 .register-btn").click(function () {
                $.ajax({
                    url: "/petal/user/updateNickName",
                    type: "post",
                    dataType: "json",
                    data: {"nickName":$("#nickName").val().trim()},
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
            $("#findUser").click(function () {
                location.href="/petal/admin/allUser"
            })
            $("#columnManger").click(function () {
                location.href="/petal/columnDetail/adminColumnIndex"
            })
        })
    </script>
</head>
<body>
<div>
    <div class="header">
        <div class="first">
            <div class="nav left">
                <a class="find">发现</a>
                <a class="last-new">最新</a>
                <a class="last-new">测试</a>
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
            <div class="nav right">
                <a class="login">登录</a>
                <a class="register">注册</a>
            </div>
        </div>
        <div class="title">
            <label>收集生活的点点滴滴</label>
        </div>
        <div class="search">
            <form id="searchForm"method ="post" action = "/petal/picDetail/findAllPicByKey"  >
                <input type="text" placeholder="搜索从这里开始......" name="keyWord" id="searchVal">
            </form>
            <button class="icon" id="search"></button>
        </div>
    </div>
    <div class="content">
        <div class="focus">
        <#list columns as column >
            <a href="/petal/columnDetail/detail?columnId=${column.columnId}">${column.columnName}</a>
        </#list>
        </div>
        <div class="recommend"><label>为您推荐</label></div>
        <div class="picures">
        <#list subPictures as subPicture>
            <div class="pic">
                <a href="/petal/picDetail/detail?picId=${subPicture.picId}">
                    <img src="/pic/${subPicture.picName}">
                </a>
            </div>
        </#list>
        </div>
    </div>
    <div class="footer">
        © 闽江学院|851072316
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
</div>
</body>
</html>