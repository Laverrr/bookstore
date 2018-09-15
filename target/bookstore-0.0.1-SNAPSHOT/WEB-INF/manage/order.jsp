<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../static/back-head.html"/>

</head>
<body onload="getNowFormatDate()">
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="index.do">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li ><a href="mana.do">首页</a></li>
			<li><a href="manaUser.do">用户</a></li>
			<li><a href="manaBook.do">商品</a></li>
			<li class="current"><a href="allBookOrder.do">订单</a></li>

		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员您好，今天是<a id="time"></a>，欢迎回到管理后台。
	</div>
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><em><a href="addUserPage.do">新增</a></em><a href="manaUser.do">用户管理</a></dd>
				<dt>商品管理</dt>
				<dd><em><a href="addproductPage.do">新增</a></em><a href="manaBook.do">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="allBookOrder.do">订单管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				<form method="post" action="allBookOrder.do">
					订单号：<input type="text" class="text" id="oid" name="oid" /> 收货人：<input type="text" class="text" id="oname" name="oname" /> <label class="ui-blue"><input type="submit" name="submit" value="查询" /></label>
				</form>
			</div>
			<div class="spacer"></div>
			<table class="list">
					<c:forEach items="${bookOrders}" var="bookOrder">
						<tr>
							<td class="first w4 c">订单号:${bookOrder.oid}</td>
							<td class="w1 c">${bookOrder.date}</td>
							<td class="w1 c">收货人:${bookOrder.oname}</td>
							<td>收货地址：${bookOrder.adress}</td>
							<td class="w1 c"><a href="orderModifyPage.do?oid=${bookOrder.oid}">修改</a> <a
								href="delserchBookOrder.do?oid=${bookOrder.oid}">删除</a></td>
						</tr>
							<c:forEach items="${orderDetails }" var="orderDetail">
							<c:if test="${bookOrder.oid==orderDetail.orderId}">
								<c:forEach items="${books }" var="book">
								<c:if test="${book.bid==orderDetail.bookId }">
										<tr>
											<td class="first w4 c">${book.bname }</td>
											<td class="w1 c"><img height="80" width="80" src="../../images/product/${book.image}"></td>
											<td class="w1 c">数量：${orderDetail.bookNum }</td>
											<td>￥${book.pirce*orderDetail.bookNum }</td>
											<td class="w1 c">${bookOrder.status }</td>
										</tr> 
								</c:if>
								</c:forEach>
							</c:if>
							</c:forEach>
					</c:forEach>
				</table>
			<div class="pager">
					<ul class="clearfix">
						<c:choose>
							<c:when test="${pageInfo.hasPreviousPage}">
								<li><a href="allBookOrder.do?pageNum=1">首页</a></li>
								<li><a href="allBookOrder.do?pageNum=${pageInfo.prePage }">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li>首页</li>
								<li>上一页</li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="index" begin="1" end="${pageInfo.pages }">

							<li
								<c:if test="${index==pageInfo.pageNum}">class="current"</c:if>><a
								href="allBookOrder.do?pageNum=${index }">${index }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pageInfo.hasNextPage}">
								<li><a href="allBookOrder.do?pageNum=${pageInfo.nextPage }">下一页</a></li>
								<li><a href="allBookOrder.do?pageNum=${pageInfo.pages }">尾页</a></li>
							</c:when>
							<c:otherwise>
								<li>下一页</li>
								<li>尾页</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2010 All Rights Reserved.
</div>
</body>
</html>
