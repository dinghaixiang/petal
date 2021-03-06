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
        .dialog-box2{
            background: #fff;
            width: 530px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin: -220px 0 0 -290px;
            box-shadow: 0 2px 5px rgba(0,0,0,.3);
            border-radius: 1px;
            display: none;
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
            cursor: pointer;
        }
        .add:hover .edit{
            display: block;
        }
        .edit{
            width: 200px;
            position: absolute;
            height: 20px;
            background-color: #fff;
            text-align: center;
            color: rosybrown;
            cursor: pointer;
            bottom: 0px;
            display: none;
        }
        .update-content{
            margin-bottom: 16px;
        }
        .selector{
            width: 360px;
            height: 30px;
        }
        .delete-btn{
            width: 80px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            border: 1px solid #f0f0f0;
            display: inline-block;
            border-radius: 3px;
            color: #777777;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .name{
            width: 62px;
            display: inline-block;
            height: 30px;
        }
        .dialog-box2 .buttons{
            margin-left: 150px;
        }
        .delete-sure{
            width: 184px;
            height: 82px;
            border: 1px solid #CCCCCC;
            padding: 30px;
            background-color: #ffffff;
            position: fixed;
            left: 60%;
            top: 50%;
            margin: -220px 0 0 -290px;
            box-shadow: 0 2px 5px rgba(0,0,0,.3);
            border-radius: 1px;
            display: none;
        }
        .delete-content{
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: 700;
        }
    </style>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        var collectionId="${collectionId?string}";
        var picId='';
        $(function () {
            $("#collectionId").val(collectionId);
            $("#addCollection").click(function () {
                $(".dialog-box").show();
            })
            $(".dialog-box .cancel").click(function () {
                $(".dialog-box").hide();
            })
            $(".dialog-box2 .cancel").click(function () {
                $(".dialog-box2").hide();
            })
            $(".dialog-box .submit").click(function () {
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
            $(".edit").click(function () {
                $.ajax({
                    url: "/petal/user/checkLogin",
                    type: "post",
                    dataType: "json",
                    data: {},
                    async: false,
                    success: function (ret) {
                        if(ret.code=="0"){
                            if(ret.data.code=="1"){
                                alert("未登录或登录失效，请先登录");
                                location.href="/petal/user/init";
                            }else{
                                var collects=ret.data.message;
                                for(i=0;i<collects.length;i++){
                                    $(".selector").append(' <option value="'+collects[i].collectId+'">'+collects[i].collectName+'</option>')
                                }
                            }
                        }
                    }
                })
                $(".dialog-box2").show();
                picId=$(this).attr("data-id");
            })
            $(".delete-sure .submit").click(function () {
                $.ajax({
                    url: "/petal/collection/deletePic",
                    type: "post",
                    dataType: "json",
                    data: {"collectionId":collectionId,"picId":picId},
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
            $(".delete-sure .cancel").click(function () {
                $(".delete-sure").hide();
            })
            $(".delete-btn").click(function () {
                $(".dialog-box2").hide();
                $(".delete-sure").show();
            })
            $(".dialog-box2 .submit").click(function () {
                if($(".selector").val()=='0') {
                    alert("请选择收藏夹");
                    return;
                }
                $.ajax({
                    url: "/petal/collection/updatePicCollection",
                    type: "post",
                    dataType: "json",
                    data: {"collectionId": collectionId, "picId": picId, "newCollectionId": $(".selector").val()},
                    async: false,
                    success: function (ret) {
                        if(ret.data.code=="1"){
                            location.reload();
                        }else{
                            alert("更改失败");
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
        <div class="nav logined admin">
            <div class="welcome">${userName}</div>
            <div class="info">
                <a id="columnManger">专栏配置</a>
                <a id="findUser">查看用户</a>
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
            <div class="edit" data-id="${picture.picId}"><a>编辑</a></div>
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
<div class="dialog-box2">
    <div class="box-title">
        <label>更改收藏夹</label>
    </div>
    <div class="box-content">
        <div class="update-content">
            <label class="name">收藏夹:</label><select class="selector"><option value="0">未选择</option></select>
        </div>
        <div class="delete-box">
            <label class="name">删&nbsp;除:</label><div class="delete-btn">删除图片</div>
        </div>
        <div class="box-bottom">
            <div class="buttons">
                <a href="#" onclick="return false;" class="cancel button">
                    <span class="text"> 取消</span>
                </a>
                <a href="#" onclick="return false;" class="submit button">
                    <span class="text"> 确定</span>
                </a>
            </div>
        </div>
        </form>
    </div>
</div>
<div class="delete-sure">
    <div class="delete-content"><label>是否确认删除?</label></div>
    <div class="box-bottom">
        <div class="buttons">
            <a href="#" onclick="return false;" class="cancel button">
                <span class="text"> 取消</span>
            </a>
            <a href="#" onclick="return false;" class="submit button">
                <span class="text"> 删除</span>
            </a>
        </div>
    </div>
</div>
</body>
</html>