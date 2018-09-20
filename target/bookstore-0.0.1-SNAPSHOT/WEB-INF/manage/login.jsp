<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/3/22
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <meta charset="utf-8">
    <title>BOOK HOUSE后台管理系统登录登陆界面</title>
    <meta name="viewport" content="width=device-width">
    <link href="../../css/base.css" rel="stylesheet" type="text/css">
    <link href="../../css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
    <form action="backLogin.do" method="post">
        <div class="logo"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value"  name="username" type="text" style="width:245px;height:50px;" />
                <input class="text_value"  name="password" type="password" style="width:245px;height:50px;"/>
            </div>
            <button class="button" id="submit" type="submit">登录</button>
        </div>

        <div id="tip"></div>

    </form>
</div>
<script>var basedir='../ui/';</script>
<script src="../ui/do.js"></script>
<script src="../ui/config.js"></script>
<script>
    Do.ready('form', function() {
        $("#form").Validform({
            ajaxPost:true,
            postonce:true,
            tiptype:function(msg,o,cssctl){
                if(!o.obj.is("form")){
                    var objtip=o.obj.siblings(".Validform_checktip");
                    cssctl(objtip,o.type);
                    objtip.text(msg);
                }else{
                    var objtip=o.obj.find("#tip");
                    cssctl(objtip,o.type);
                    if(o.type==2){
                        window.location.href='index.php?r=admin/index/index';
                    }else{
                        objtip.text(msg);
                    }
                }
            }
        });
    });

</script>
</body>
</html>
