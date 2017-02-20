<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大学生的收集网站</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .header{
            display: flex;
            justify-content: space-around;
            font-size: 18px;
            font-weight: 200;
        }
        .content-content{
            display: flex;
            justify-content: space-around;
            font-size: 16px;
            color: #777777;
            font-weight: 100;

        }
        .content{
            margin: 20px;
            background-color: #ffffff;
        }
        body{
            background-color: #CCCCCC;
        }
        .element{
            width: 100px;
            height: 100px;
            line-height: 100px;
        }
        .element a{
            cursor: pointer;
        }
        .title{
            width: 100px;
            height: 30px;
            line-height: 30px;
        }
        .border{
            border: 1px solid #CCCCCC;
            width:96%;
            margin: 0 auto;
        }
        img{
            width: 100px;
            height: 100px;
        }
        .time{
            width: 168px;
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

    </style>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        var columnId="${columnId}";
        $(function () {
            $("#columnId").val(columnId);
            $(".delete").click(function () {
                $.ajax({
                    url: "/petal/columnDetail/deleteColumnPic",
                    type: "post",
                    dataType: "json",
                    data: {"columnId": columnId, "picId": $(this).attr('data-id')},
                    async: false,
                    success: function (ret) {
                        if(ret.code=="0") {
                            if (ret.data.code == "0") {
                                window.location.reload();
                            }else{
                                alert("删除失败");
                            }
                        }
                    }
                })
        })
            $(".add").click(function () {
                $(".dialog-box").show();
            })
            $(".cancel").click(function () {
                $(".dialog-box").hide();
            })
            $(".submit").click(function () {
                $("#itemForm").submit();
            })
        })
    </script>
</head>
<body>
<div class="content">
    <div class="header">
        <div class="element title">图片缩略图</div>
        <div class="element title">图片大小</div>
        <div class="element title">图片格式</div>
        <div class="element title time">上传时间</div>
        <div class="element title">操作 <span class="add">添加</span></div>
    </div>
    <div class="border"></div>
    <div>
        <#list pictureList as picture>
        <div class="content-content">
            <div class="element"><img src="/pic/${picture.picName}"></div>
            <div class="element">${picture.picSize}<span>字节</span></div>
            <div class="element">${picture.picFormat}</div>
            <div class="element time">${picture.uploadTime}</span></div>
            <div class="element"><a data-id="${picture.picId}" class="delete">删除</a> <a class="add">添加</a></div>
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
            <input type="hidden" name="columnId" id="columnId">
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