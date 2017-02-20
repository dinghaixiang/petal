<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大学生的收集网站-专栏配置</title>
    <script src="/petal/statics/js/jquery.min.js"></script>
    <script>
        $(function () {
            $(".add").click(function () {
                $(".dialog-box").show();
            })
            $(".cancel").click(function () {
                $(".dialog-box").hide();
            })
            $(".submit").click(function () {
                $.ajax({
                    url: "/petal/columnDetail/save",
                    type: "post",
                    dataType: "json",
                    data: {"columnName": $("#columnName").val().trim()},
                    async: false,
                    success: function (ret) {
                        if(ret.code=="0") {
                            if (ret.data.code == "0") {
                                window.location.reload()
                            }else{
                                alert("网络异常，稍后重试");
                            }
                        }
                    }
                })
            })
            $(".icon").click(function () {
                $.ajax({
                    url: "/petal/columnDetail/delete",
                    type: "post",
                    dataType: "json",
                    data: {"columnId": $(this).attr("data-id")},
                    async: false,
                    success: function (ret) {
                        if(ret.code=="0") {
                            if (ret.data.code == "0") {
                                window.location.reload()
                            }else{
                                alert("网络异常，稍后重试");
                            }
                        }
                    }
                    })
            })



        })
    </script>
    <style>
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
        .content{
            margin-top: 100px;
        }
        .add{
            margin-left: 18px;
            background-color: #E53E49;
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
        .tips{
            color: #777777;
        }
        .dialog-box {
            background: #fff;
            width: 580px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin: -220px 0 0 -290px;
            box-shadow: 0 2px 5px rgba(0,0,0,.3);
            border-radius: 1px;
            display: none;
            border: 1px solid #D9D9D9;
        }
        .box-title {
            height: 50px;
            line-height: 50px;
            font-size: 18px;
            border-bottom: 1px solid #EDEDED;
            position: relative;
            padding-left: 30px;
        }
        .box-content {
            width: 80%;
            margin: 10px auto;
        }
        .box-bottom {
            display: flex;
            justify-content: flex-end;
            background-color: #fafafa;
        }
        .buttons {
            margin-right: 35px;
            margin-bottom: 10px;
        }
        .cancel {
            background: linear-gradient( #FAFAFA, #F2F2F2);
        }
        .submit {
            background-color: #E53E49;
        }
        .button {
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
        .box-content input {
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
        .icon{
            width: 20px;
            height: 20px;
            background-size: contain;
            background-image: url("/petal/statics/image/delete.svg");
            background-repeat: no-repeat;
            position: absolute;
            left: 154px;
            top: -8px;
            cursor: pointer;
        }
        .father{
            position: relative;
        }
    </style>
</head>
<body>
   <div class="content">
       <div class="focus">
           <#list columns as column>
               <div class="father">
               <a href="/petal/columnDetail/adminColumnDeatil?columnId=${column.columnId}">${column.columnName}</a>
               <label class="icon" data-id="${column.columnId}"></label>
               </div>
           </#list>
       </div>
       <div><a class="add">添加</a><label class="tips" >提示:建议专栏数目不要大于6个</label></div>
   </div>
   <div class="dialog-box ">
       <div class="box-title">
           <label>添加专栏</label>
       </div>
       <div class="box-content">
           <input type="text" id="columnName" placeholder="专栏名称">
       </div>
       <div class="box-bottom">
           <div class="buttons">
               <a href="#" onclick="return false;" class="cancel button">
                   <span class="text"> 取消</span>
               </a>
               <a href="#" onclick="return false;" class="submit button">
                   <span class="text"> 添加</span>
               </a>
           </div>
       </div>
   </div>
</body>
</html>