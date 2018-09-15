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
		<div class="main">
		<h2>修改用户</h2>
		<div class="manage">
			<form action="updateUser.do" id="Form">
						<input type="hidden" class="text" name="uid" value="${user.uid }" />
				<table class="form">
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="uname" value="${user.uname }" readonly/></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td>
						<input type="radio" name="gender" value="男" <c:if test="${user.gender=='男' }"> checked="checked"</c:if>/>男
						<input type="radio" name="gender" value="女" <c:if test="${user.gender=='女' }"> checked="checked"</c:if>/>女
						</td>
					</tr>
					<tr>
						<td class="field">邮箱：</td>
						<td><input type="text" class="text" name="email" value="${user.email }" /></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="phone" value="${user.phone}" /></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><input type="text" class="text" name="address" value="${user.adress}" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2010  All Rights Reserved.
</div>
<script>
    var validator;
    $(document).ready(function () {
        $.validator.setDefaults({
        });

        validator = $("#Form").validate({
            rules: {
                uname: {
                    required: true
                },
                phone: {
                    required: true,
                    minlength: 11,
                    maxlength: 11
                },
                email: {
                    required: true,
                    email:true
                },
                address: {
                    required: true
                }
            },
            messages: {
                uname: {
                    required: "必须填写用户名"
                },
                phone: {
                    required: "必须填写电话",
                    minlength: "电话号码长度不正确",
                    maxlength: "电话号码长度不正确"
                },
                email: {
                    required: "必须填写邮箱",
                    email:"邮箱格式有误"
                },
                address: {
                    required: "必须填写送货地址"
                }
            }
        });

    });

</script>
</body>
</html>

