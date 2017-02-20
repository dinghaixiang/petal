<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>属于大学生的素材收集网站--最新图片</title>
    <style>
        *{
            margin: 0;
            padding: 0;
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
        .middle{
            width: 300px;
            height: 200px;
            margin: 0 auto;
            color: #777777;
            font-size: 30px;
            text-align: center;
            line-height: 200px;
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
        .collections{
            margin: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content:flex-start;
        }
        .collection{
            width: 300px;
            height: 500px;
            border:2px solid #dedede;
            align-content: center;
            line-height: 300px;
            align-content: center;
            margin: 11px;
            cursor: pointer;
        }
        .collection:hover{
            transform: scale(1.1,1.1);
        }
        .collection img{
            width: 300px;
            height: 500px;
        }
    </style>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        $(function () {
            $(".find").click(function () {
                location.href = "/petal/user/init";
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
    </div>
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
</body>
</html>