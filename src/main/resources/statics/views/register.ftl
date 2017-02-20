<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>大学生的收集网站--注册</title>
</head>
<style>
  *{
    padding: 0px;
    margin: 0px;
  }
  .content{
    width: 500px;
    height: 300px;
    margin: 0 auto;
    position: fixed;
    top:30%;
    left:40%;

  }
  .content input{
    width: 300px;
    height: 36px;
    background-color: #fcfcfc;
    border: 1px solid #CCC;
    box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
    margin-bottom: 10px;
  }
   .register-btn {
     font-family: "\5FAE\8F6F\96C5\9ED1", "helvetica neue", arial, sans-serif;
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
  .errorTips{
    color: red;
    display: none;
  }
  .header{
    background: url(/petal/statics/image/register.jpg) no-repeat;
    height: 900px;
    width: 100%;
  }


</style>
<script src="/petal/statics/js/jquery.min.js"></script>
<script>
    $(function () {
        $(".register-btn").click(function () {
            var first=$("#firstPwd").val();
            var second=$("#secondPwd").val();
            if(first!=second){
                $(".errorTips").text("两次输入不一致").show();
                return;
            }
            $.ajax({
                url: "/petal/user/register",
                type: "post",
                dataType: "json",
                data:{"passWord":$("#secondPwd").val().trim(),"nickName":$("#nickName").val().trim()},
                async: false,
                success:function (ret){
                    if(ret.code=="0"){
                        if(ret.data.code=="1"){
                            $(".errorTips").text(ret.data.message).show();
                        }else{
                            location.href="/petal/user/init";
                        }
                    }
                }
            })
        })
    })
</script>
<body>
<div class="header">
</div>
<div class="content">
    <input type="text" placeholder="请输入昵称" id="nickName">
  <input type="password" placeholder="请输入密码" id="firstPwd">
  <input type="password" placeholder="请再次输入密码" id="secondPwd">
  <a class="errorTips">两次输入不一致</a>
  <a class="register-btn" >注册</a>
</div>
</body>
</html>