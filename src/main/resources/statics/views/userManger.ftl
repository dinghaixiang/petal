<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大学生的收集网站-用户管理</title>
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
            height: 30px;
            line-height: 30px;
        }
        .border{
            border: 1px solid #CCCCCC;
            width:96%;
            margin: 0 auto;
        }

    </style>
</head>
<body>
   <div class="content">
       <div class="header">
           <div class="element">用户名</div>
           <div class="element">密码</div>
           <div class="element">权限</div>
       </div>
       <div class="border"></div>
       <div >
           <#list userList as user>
           <div class="content-content">
                <div class="element">${user.userName}</div>
                <div class="element">${user.userPwd}</div>
                <div class="element"><#if user.role?string=="1">管理员<#else>普通用户</#if></div>
           </div>
           </#list>
       </div>
   </div>
</body>
</html>