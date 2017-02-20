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
            line-height: 300px;
            align-content: center;
            margin: 20px;
            cursor: pointer;
        }
        .name{
            margin: 0px auto;
            width: 80px;
            height: 30px;
            color: #000;
            font-family: "\5FAE\8F6F\96C5\9ED1","helvetica neue",arial,sans-serif;
            font-size: 18px;
        }
        .dialog-box{
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
            margin: 10px;
        }
        .uploadFile{
            height: 30px;
            width: 80%;
            display: inline-block;
            padding: 0 10px;
            font-size: 16px;
            line-height: 1;
            color: #777;
            background: #FCFCFC;
            border: 1px solid #CCC;
            border-radius: 3px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
            margin: 0 auto;
            margin-bottom: 5px;
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

        .collection img{
            width: 200px;
            height: 300px;
        }

    </style>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        var collectionId="${collectionId?string}";
        $(function () {
            $("#collectionId").val(collectionId);
            $("#addCollection").click(function () {
                $(".dialog-box").show();
            })
            $(".cancel").click(function () {
                $(".dialog-box").hide();
            })
            $(".submit").click(function () {
                $("#itemForm").submit();
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
        <div class="nav logined">
            <div class="welcome">${userName}欢迎您</div>
            <div class="info">
                <a id="collection">我的收藏夹</a>
                <a class="loginOut">退出登录</a>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div class="collections">
        <div class="collection" id="addCollection">
            <div class="icon" ></div>
        </div>
    <#list pictureList as picture>
        <div class="collection add">
            <a href="/petal/picDetail/detail?picId=${picture.picId}">
                <img src="/pic/${picture.picName}">
            </a>
        </div>
    </#list>
    </div>
</div>
<div class="dialog-box ">
    <div class="box-title">
        <label>上传图片</label>
    </div>
    <div class="box-content">
        <form id="itemForm" method="post" action="upload" enctype="multipart/form-data">
            <input type="hidden" name="collectionId" id="collectionId">
            <input name="file1" type="file" class="uploadFile">
            <input name="key" type="text"  class="uploadFile" placeholder="输入关键词方便检索以“|”隔开">
            <div class="box-bottom">
                <div class="buttons">
                    <a href="#" onclick="return false;" class="cancel button">
                        <span class="text"> 取消</span>
                    </a>
                    <a href="#" onclick="return false;" class="submit button">
                        <span class="text"> 上传</span>
                    </a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>