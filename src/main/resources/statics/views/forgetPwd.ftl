<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>大学生的收集网站--找回密码</title>
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
  #randomVal{
    width: 200px;
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
  #random{
    margin-left: 10px;
    display: inline-block;
    width: 90px;
    height: 36px;
    background-color: #E53E49;
    line-height: 36px;
    text-align: center;
    color: white;
    font-size: 12px;
    cursor: pointer;
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
        url: "/petal/user/findPwd",
        type: "post",
        dataType: "json",
        data:{"newPwd":$("#secondPwd").val().trim(),"userName":$("#email").val().trim()},
        async: false,
        success:function (ret){
          if(ret.code=="0"){
            if(ret.data.code=="0"){
                location.href="/petal/user/init";
            }else if(ret.data.code=="2"){
                $(".errorTips").text("邮箱不存在").show();
            }else{
              alert("系统异常");
            }
          }
        }
      })
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
  })
</script>
<body>
<div class="header">
</div>
<div class="content">
  <input type="text" id="email" placeholder="请输入注册邮箱">
  <input type="text" placeholder="邮箱验证码" id="randomVal"><a id="random">发送验证码</a>
  <input type="password" placeholder="请输入新密码" id="firstPwd">
  <input type="password" placeholder="请再次输入新密码" id="secondPwd">
  <a class="errorTips">两次输入不一致</a>
  <a class="register-btn">修改</a>
</div>
</body>
</html>