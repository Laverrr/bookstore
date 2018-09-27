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
		<button type="button" onclick="window.location.href='index.do'" class="btn btn-warning btn-lg ">首页</button>
		<div class="searchBook">
			<form method="post" action="productList.do">
				查找书籍：<input  type="text" class="text" name="key" placeholder="请输入商品关键字"  /> <input class="btn btn-info" type="submit" name="submit" value="搜索" />
			</form>
		</div>
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
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>图书分类</h2>
			<c:forEach items="${bts}" var="bt">
			<dl>
				<dd><a href="productList.do?type=${bt}" >${bt}</a></dd>
			</dl>
			</c:forEach>
		</div>
		<div class="spacer"></div>
		<div class="last-view">
			<h2>最近浏览</h2>
			<c:forEach items="${Cbooks}" var="cbook" end="5">
			<dl class="clearfix">
				<dt><img height="50" width="50" src="<%=basePath %>images/product/${cbook.image}" /></dt>
				<dd><a href="bookView.do?bid=${cbook.bid}">${cbook.bname}</a></dd>
			</dl>
			</c:forEach>
		</div>
	</div>
	<div id="product" class="main">
		<h1>${book.bname}</h1>
		<h3> </h3>
		<div class="infos">
			<div class="thumb"><img height="300" width="300" src="<%=basePath %>images/product/${book.image}" /></div>
			<div class="buy">
				<p>价格：<span class="price">￥${book.pirce}</span></p>
				<p>作 者：${book.writer}</p>
				<p>出版社：${book.printer}</p>
				<p>出版日期：${dateStr}</p>
				<p>库　存：${book.store}</p>
				<p>购买数量：<span id="sub" onclick="subNum();"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></span>&nbsp;
					<input style="height: 25px; width:25px;"  id="number" name="number"  value="1" size="2" readonly/>&nbsp;
					<span id="add" onclick="addNum();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span></p>
				<div class="button">
				<c:if test="${book.store>0}">
					<%--<input id="buy" type="button" name="button"  />--%>
					<a id="buy" href="#"><img class="buyBtn" src="../../images/buy.jpg"></a>&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="bid" value="${book.bid}"  />&nbsp;&nbsp;&nbsp;
				<a id="submit" href="#"><img src="../../images/cart.png"></a>
				</c:if>
				<c:if test="${book.store==0}">
					<img src="images/null.png">
				</c:if>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">
				${book.detail}
			</div>
		</div>
		
		<div class="guestbook">
			<h2>商品评价</h2>
			<ul>
				<c:forEach items="${comments}" var="comment">
				<li>
					<dl>
						<dt>网友：${comment.uname} </dt>
						<dd>${comment.content}</dd>
						<dd> <span class="timer">${comment.date}</span></dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
			<div class="clear"></div>
			<c:if test="${comments.size()!=0}">
			<div class="pager">
					<ul class="clearfix">
						<c:choose>
							<c:when test="${pageInfo.hasPreviousPage}">
								<li><a href="bookView.do?pageNum=1&bid=${book.bid}">首页</a></li>
								<li><a href="bookView.do?pageNum=${pageInfo.prePage }&bid=${book.bid}">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>首页</span></li>
								<li><span>上一页</span></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="index" begin="1" end="${pageInfo.pages }">

							<li
								<c:if test="${index==pageInfo.pageNum}">class="current"</c:if>><a
								href="bookView.do?pageNum=${index }&bid=${book.bid}">${index }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pageInfo.hasNextPage}">
								<li><a href="bookView.do?pageNum=${pageInfo.nextPage }&bid=${book.bid}">下一页</a></li>
								<li><a href="bookView.do?pageNum=${pageInfo.pages }&bid=${book.bid}">尾页</a></li>
							</c:when>
							<c:otherwise>
								<li><span>下一页</span></li>
								<li><span>尾页</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</c:if>
				<c:if test="${comments.size()==0}">
					<div class="introduce">
						<div class="text">该商品还没有人写评价呢~</div>
					</div>
				</c:if>
			</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="../static/footer.html"/>
<script src="../../js/product.js"></script>
</body>
</html>

