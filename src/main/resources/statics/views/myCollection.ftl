<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>属于大学生的素材收集网站--收藏夹</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-color: #f0f0f0;
        }
        .first{
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: space-between;
            background-color: #ffffff;
        }
        .nav{
            margin:20px 40px;
            color: #000;
            font-family: "\5FAE\8F6F\96C5\9ED1","helvetica neue",arial,sans-serif;
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

        .info{
            float: right;
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
        .icon{
            height: 50px;
            width: 50px;
            background: url("/petal/statics/image/add.svg") no-repeat;
            background-size: contain;
            margin: 120px auto;
        }
        .collections{
            margin: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content:flex-start;
        }
        .collection{
            width: 200px;
            height: 300px;
            border:2px solid #dedede;
            align-content: center;
            align-content: center;
            margin: 20px;
            position: relative;
        }
        .deleteIcon{
            width: 20px;
            height: 20px;
            background-size: contain;
            background-image: url("/petal/statics/image/delete.svg");
            background-repeat: no-repeat;
            position: absolute;
            top: -12px;
            right: -10px;
            cursor: pointer;
        }
        .name{
            width: 200px;
            position: absolute;
            height: 260px;
            color: #ffffff;
            font-family: "\5FAE\8F6F\96C5\9ED1","helvetica neue",arial,sans-serif;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            top: 0px;;
        }
        .dialog-box,.dialog-box2{
            background: #fff;
            width: 580px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin: -220px 0 0 -290px;
            box-shadow: 0 2px 5px rgba(0,0,0,.3);
            border-radius: 1px;
            display: none;
        }
        .box-title{
            height: 50px;
            line-height: 50px;
            font-size: 18px;
            border-bottom: 1px solid #EDEDED;
            position: relative;
            padding-left: 30px;
        }
        .box-content{
            width: 80%;
            margin: 10px auto;
        }
        .box-content input{
            width: 100%;
            display: inline-block;
            padding: 0 10px;
            height: 36px;
            font-size: 16px;
            line-height: 1;
            color: #777;
            background: #FCFCFC;
            border: 1px solid #CCC;
            border-radius: 3px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
            margin: 0 auto;
        }
        .box-bottom{
            display: flex;
            justify-content: flex-end;
            background-color: #fafafa;
        }
        .buttons{
            margin-right: 35px;
            margin-bottom: 10px;
        }
        .button{
            display: inline-block;
            width: 68px;
            height: 38px;
            line-height: 38px;
            border: 1px solid #D9D9D9;
            border-radius: 2px;
            text-decoration: none;
            color: #444;
            text-align: center;
        }
        .cancel{
            background: linear-gradient( #FAFAFA, #F2F2F2);
        }
        .submit{
            background-color: #E53E49;
        }
        .edit{
            width: 200px;
            position: absolute;
            height: 20px;
            background-color: #fff;
            text-align: center;
            color: #CCCCCC;
            cursor: pointer;
            bottom: 0px;
        }
        .add img{
            width: 200px;
            height: 300px;
        }
        .add{
            position: relative;
        }
        .admin:hover .info{
            display: block;
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
            $(".register-btn").click(function () {
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
                        if(ret.data.code=="0") {
                            location.href="/petal/user/init";
                        }
                    }
                })
            })

            $("#collection").click(function () {
                location.href="/petal/collection/init";
            })
            $(".find").click(function () {
                location.href="/petal/user/init";
            })
            $("#search").click(function () {
                $("#searchForm").submit();
            })
            $(".last-new").click(function () {
                location.href="/petal/picDetail/findLastNew" ;
            })
            $("#addCollection").click(function () {
                $(".dialog-box").show();
            })
            $(".cancel").click(function () {
                $(".dialog-box").hide();
                $(".dialog-box2").hide();
            })
            $(".dialog-box .submit").click(function () {
                $.ajax({
                    url: "/petal/collection/add",
                    type: "post",
                    dataType: "json",
                    data:{"collectionName":$("#collectionName").val().trim()},
                    async: false,
                    success: function (ret) {
                        if(ret.data.code=="1"){
                            location.reload();
                        }else{
                            alert("新建失败");
                        }
                    }
                })
            })

            $(".name").click(function () {
                var collectionId= $(this).attr('data-id');
                window.location.href="/petal/collection/detail?collectionId="+collectionId;
            })
            $(".edit").click(function () {
                $(".dialog-box2").show();
                editCollectionId=$(this).attr("data-id");
            })
            $(".dialog-box2 .submit").click(function () {
                $.ajax({
                    url: "/petal/collection/updateCollection",
                    type: "post",
                    dataType: "json",
                    data: {"collectionNewName": $("#collectionNewName").val().trim(),"collectionId":editCollectionId},
                    async: false,
                    success: function (ret) {
                        if(ret.data.code=="1"){
                            location.reload();
                        }else{
                            alert("修改失败");
                        }
                    }
                })
            })
            $(".deleteIcon").click(function () {
                $.ajax({
                    url: "/petal/collection/delete",
                    type: "post",
                    dataType: "json",
                    data: {"collectionId": $(this).attr("data-id")},
                    async: false,
                    success: function (ret) {
                        if(ret.data.code=="1"){
                            location.reload();
                        }else{
                            alert("删除失败");
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
            $("#alterNick").click(function () {
                $(".register-box").fadeOut();
                $(".login-box").fadeOut();
                $(".register-box2").fadeIn();
            })
        })
    </script>
</head>
<body>
<div class="header">
    <div class="first">
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
</div>
<div class="content">
    <div class="collections">
        <div class="collection" id="addCollection">
            <div class="icon" ></div>
        </div>
    <#list collectionList as collection>
        <div class="collection add">
            <#if collection.url??>
                <img src="/pic/${collection.url}">
            </#if>
            <div class="name" data-id="${collection.collectId}">${collection.collectName}</div>
            <div class="edit" data-id="${collection.collectId}"><a>编辑</a></div>
            <label class="deleteIcon" data-id="${collection.collectId}"></label>
        </div>
    </#list>
    </div>
</div>
</div>
<div class="dialog-box ">
    <div class="box-title">
        <label>新建收藏夹</label>
    </div>
    <div class="box-content">
        <input type="text"  id="collectionName" placeholder="收藏夹名称">
    </div>
    <div class="box-bottom">
        <div class="buttons">
            <a href="#" onclick="return false;" class="cancel button">
                <span class="text"> 取消</span>
            </a>
            <a href="#" onclick="return false;" class="submit button">
                <span class="text"> 新建</span>
            </a>
        </div>
    </div>
</div>
<div class="dialog-box2 ">
    <div class="box-title">
        <label>编辑收藏夹</label>
    </div>
    <div class="box-content">
        <input type="text"  id="collectionNewName" placeholder="新收藏夹名称">
    </div>
    <div class="box-bottom">
        <div class="buttons">
            <a href="#" onclick="return false;" class="cancel button">
                <span class="text"> 取消</span>
            </a>
            <a href="#" onclick="return false;" class="submit button">
                <span class="text"> 修改</span>
            </a>
        </div>
    </div>
</div>
</body>
</html>