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
		<c:if test="${sessionScope.user==null}">
			<button type="button" class="btn btn-default" onclick="window.location.href='login.do'">登陆</button>
			<button type="button" class="btn btn-default" onclick="window.location.href='reg.do'">注册</button>
		</c:if>
	</div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="index.do">首页</a></li>

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
		<div class="main">
		<h2>修改密码</h2>
		<div class="manage">
			<form id="Form">
						<input type="hidden" class="text" name="uid" id="uid" value="${sessionScope.user.uid }" />
				<table class="form">
					<tr>
						<td class="field">旧密码：</td>
						<td><input type="password" class="text" name="password" id="password"/></td>
					</tr>
					<tr>
						<td class="field">新密码：</td>
						<td><input type="password" class="text" name="newPassword" id="newPassword"/></td>
					</tr>
					<tr>
						<td class="field">再次输入新密码：</td>
						<td><input type="password" class="text" name="rePassword" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" id="submit" value="更新" /></label></td>
					</tr>
				</table>
			</form>
		</div>
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

        validator = $("#Form").validate({
            rules: {
                password: {
                    required: true,
                },
                newPassword: {
                    required: true,
                },
                rePassword: {
                	required: true,
                    equalTo: "#newPassword"
                }
            },
            messages: {
                password: {
                     required: "必须填写旧密码",
                },
                newPassword: {
                    required: "必须填写密码",
                },
                rePassword: {
            	    required: "必须填写确认密码",
                    equalTo: "两次输入的密码不一致"
                }
            }
        });
    });
 $(document).ready(function(){
	$("#submit").click(function(){
		$.post("updatePwd.do",{
			uid:$("#uid").val(),
			password:$("#password").val(),
			newPassword:$("#newPassword").val()
		},
		function(data){
			if(data=='success'){
				alert("修改密码成功");
			}
			if(data=='false'){
				alert("旧密码输入有误");
			}
			if(data=='pwdEmpty'){
				alert("密码不能为空");
			}
			if(data=='newEmpty'){
				alert("确认密码不能为空");
			}
		});
	});
}); 
</script>
</body>
</html>

