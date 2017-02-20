<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大学生的收集网站-管理员首页</title>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>

    </script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        body{
            background-color: #dedede;
        }
        .content{
            width: 100%;
            margin: 0 auto;
            margin-top: 30px;
            display: flex;
            justify-content: space-around;
        }
        .left-pic{
            background-color: #ffffff;
            width: 10%;
            padding: 30px;
            height: 800px;
        }
        .right-detail{
            padding: 30px;
            background-color: #ffffff;
            width: 70%;
            height: 800px;
        }
        .pic-src img{
            width: 100%;
        }
        .right-img-detail img{
            width: 100%;
            height: 100%;
        }
        .dialog-box{
            background: #fff;
            width: 250px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin: -220px 0 0 -290px;
            box-shadow: 0 2px 5px rgba(0,0,0,.3);
            border-radius: 1px;
            display: none;
        }
        .dialog-box select{
            width: 100px;
            height: 30px;
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
            margin-top: 10px;
        }
        .button{
            display: inline-block;
            width: 50px;
            height: 30px;
            line-height: 30px;
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
        .header{
            width: 150px;
            height: 50px;
            margin: 0 auto;
            color: #ffffff;
            font-size: 30px;
            line-height: 75px;
        }
        .menu{
            width: 100px;
            height: 30px;
        }
        .left-pic a{
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="header"><label>管理员首页</label></div>
<div class="content">
    <div class="left-pic">
     <div class="menu"><a href="/petal/admin/allUser">查看用户</a></div>
     <div class="menu"><a href="/petal/columnDetail/adminColumnIndex">专栏配置</a></div>
     <div class="menu"><a>修改密码</a></div>
    </div>
    <div class="right-detail">

    </div>
</div>
<div class="dialog-box ">
    <div class="box-content">
        <label>选择收藏夹</label>
        <select id="select">
            <option value="0">未选择</option>
        </select>
    </div>
    <div class="box-bottom">
        <div class="buttons">
            <a href="#" onclick="return false;" class="cancel button">
                <span class="text"> 取消</span>
            </a>
            <a href="#" onclick="return false;" class="submit button">
                <span class="text"> 收藏</span>
            </a>
        </div>
    </div>
</div>
</body>
</html>