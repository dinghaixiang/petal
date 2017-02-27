<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大学生的收集网站-图片详情</title>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        $(function () {
            var userName="${userName}";
            $(".cancel").click(function () {
                $(".dialog-box").hide();
                $(".dialog-box2").hide();
            })
            $(".collect-btn").click(function () {
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
                                    $("#select").append(' <option value="'+collects[i].collectId+'">'+collects[i].collectName+'</option>')
                                }
                                $(".dialog-box").show();
                            }
                        }
                    }
                })
            })
            $(".dialog-box .submit").click(function () {
                if($("#select").val()=='0') {
                    alert("请选择收藏夹");
                    return;
                }
                $.ajax({
                    url: "/petal/collection/collect",
                    type: "post",
                    dataType: "json",
                    data: {"collectionId":$("#select").val(),"picId":$(".collect-btn").attr('data-id')},
                    async: false,
                    success: function (ret) {
                        if(ret.code=="0") {
                            if (ret.data.code == "0") {
                                alert("该图片已存在当前收藏夹中");
                            }else{
                                window.history.back();
                            }
                        }
                    }
                })
            })
            $(".create-btn").click(function () {
                if(userName=='youke'){
                    alert("请先登录");
                    location.href="/petal/user/init";
                    return;
                }
                $(".dialog-box2").show();
            })

          $(".dialog-box2 .submit").click(function () {
              if(userName=='youke'){
                  alert("请先登录");
                  location.href="/petal/user/init";
                  return;
              }
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
        })
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
            width: 90%;
            margin: 0 auto;
            margin-top: 30px;
            display: flex;
            justify-content: space-around;
        }
        .left-pic{
            background-color: #ffffff;
            width: 60%;
            padding: 30px;
        }
        .right-detail{
            width: 28%;
        }
        .pic-src img{
            width: 100%;
        }
        .collect-btn,.create-btn{
            margin-right: 30px;
            display: inline-block;
            margin-bottom: 20px;
            width: 50px;
            height: 30px;
            line-height: 30px;
            background: #E53E49;
            background: linear-gradient( #E53E49, #D43636);
            box-shadow: inset 0 1px 0 rgba(255,255,255,.08), 0 1px 0 rgba(255,255,255,.3);
            text-shadow: 0 -1px 0 rgba(0,0,0,.1);
            color: #fff;
            border: 1px solid #C90000;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
        }
        .right-header{
            margin-bottom: 20px;
            width: 100px;
            height: 30px;
            font-size: 18px;
            font-weight: 800;
            color: rosybrown;
        }
        .collect-btn{
            cursor: pointer;
        }
        .right-img-detail{
            border: 1px solid;
            width: 150px;
            height: 200px;
        }
        .right-img-detail img{
            width: 100%;
            height: 100%;
        }
        .right-img{
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
        }
        .pic-detail-title{
            font-size: 20px;
            margin-top: 20px;
            margin-bottom: 20px;
            font-weight: 800;
            color: rosybrown;
            font-family: "\5FAE\8F6F\96C5\9ED1", "helvetica neue", arial, sans-serif;
        }
        .pic-content{
            margin-bottom: 10px;
            color: #777777;
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
        .dialog-box2{
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
        .relative-recommend{
            background-color: #ffffff;
            padding: 4%;
        }
        .property{
            background-color: #ffffff;
            padding: 10%;
            margin-top: 22px;
        }
    </style>
</head>
<body>
<div class="content">
    <div class="left-pic">
        <div class="header">
            <a class="collect-btn" data-id="${picture.picId}">收藏</a>
            <a class="create-btn">新建</a>
        </div>
        <div class="pic-src">
            <img src="/pic/${picture.picName}">
        </div>
    </div>
    <div class="right-detail">
        <div class="relative-recommend">
            <div class="right-header">
                <label>相关推荐</label>
            </div>
            <div class="right-img">
                <#list subPictures as subPicture>
                    <div class="right-img-detail">
                        <a href="/petal/picDetail/detail?picId=${subPicture.picId}">
                            <img src="/pic/${subPicture.picName}">
                        </a>
                    </div>
                </#list>
            </div>
        </div>
        <div class="property">
            <div class="pic-detail-title"><label>图片相关属性</label></div>
            <div>
                <div class="pic-content">图片大小:<span>${picture.picSize}</span><span>字节</span></div>
                <div class="pic-content">图片格式:<label>${picture.picFormat}</label></div>
                <div class="pic-content">图片标签:<span>${picture.keyWord!""}</span></div>
                <div class="pic-content">上传时间:<span>${picture.uploadTime}</span></div>
                <div class="pic-content">上传用户:<span>${picture.userId}</span></div>
            </div>
        </div>
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
<div class="dialog-box2 ">
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
</body>
</html>