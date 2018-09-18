<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../static/head.html"/>

</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="<%=basePath %>images/logo.gif" /></div>
	<div class="help">
		<a href="cartPage.do" class="shopping">查看购物车</a>
		<c:if test="${sessionScope.user!=null}"><a href="userOrder.do?uid=${sessionScope.user.uid}">我的订单</a>&nbsp;用户:${sessionScope.user.uname}&nbsp;&nbsp;<a href="updateUserPage.do">更新个人信息</a><a href="updatePwdPage.do">修改密码</a><a href="logout.do">注销</a></c:if>
		<c:if test="${sessionScope.user==null}"><a href="login.do">登录</a><a href="reg.do">注册</a></c:if>
	</div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="index.do">首页</a></li>
			<div class="search">
				<form method="post" action="productList.do">
					 查找书籍：<input type="text" class="text" name="key" placeholder="请输入商品关键字"  /> <label class="ui-blue"><input type="submit" name="submit" value="搜索" /></label>
				</form>
			</div>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<c:forEach items="${bts}" var="bt">
			<li><a href="productList.do?type=${bt}" >${bt}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册BOOK HOUSE</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>填写注册信息</li>
				<li class="last"><em></em>注册成功</li>
			</ul>
			<form id="regForm">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td><input class="text" type="text" name="userName" id="userName" /></td>
					</tr>
					<tr>
						<td class="field">登录密码：</td>
						<td><input class="text" type="password" id="passWord" name="passWord"  /></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input class="text" type="password" name="rePassWord"  /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" id="submit" value="提交注册" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="../static/footer.html"/>
<script>
    var validator;
    $(document).ready(function () {
        $.validator.setDefaults({
            //debug: true
        });

        validator = $("#regForm").validate({
            rules: {
                userName: {
                    required: true
                },
                passWord: {
                    required: true
                },
                rePassWord: {
                	required: true,
                    equalTo: "#passWord"
                }
            },
            messages: {
                userName: {
                     required: "必须填写用户名"
                },
                passWord: {
                    required: "必须填写密码"
                },
                rePassWord: {
            	    required: "必须填写确认密码",
                    equalTo: "两次输入的密码不一致"
                }
            }
        });
    });
    $(document).ready(function(){
        $("#submit").click(function(){
            $.post("userReg.do",{
                    userName:$("#userName").val(),
                    passWord:$("#passWord").val()
                },
                function(data){
                    if(data=='success'){
                        alert("注册成功，请登陆。");
                        window.location.href="login.do";
                    }
                    if(data=='false'){
                        alert("用户名已存在");
                    }
                });
        });
    });
</script>
</body>
</html>
