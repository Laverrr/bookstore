<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BOOK HOUSE</title>
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/style.css" />
<script type="text/javascript" src="<%=basePath %>scripts/function.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
<script type="text/javascript">
</script>
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
			<c:forEach items="${Cbooks}" var="cbook" end="4">
			<dl class="clearfix">
				<dt><img height="50" width="50" src="<%=basePath %>images/product/${cbook.image}" /></dt>
				<dd><a href="bookView.do?bid=${cbook.bid}">${cbook.bname}</a></dd>
			</dl>
			</c:forEach>
		</div>
	</div>
	<div class="main">
		<div class="demo">
			<a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
			<div class="demo">
				<a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
				<div class="slider"><!--主体结构，请用此类名调用插件，此类名可自定义-->
					<ul>
						<li><a href="bookView.do?bid=10"><img src="images/1.jpg" alt="老干部靳东演绎的中国医疗精英。" /></a></li>
						<li><a href="bookView.do?bid=11"><img src="images/2.jpg" alt="这本小说太令人震撼，很长一段时日，让我所读的一切都相形失色。" /></a></li>
						<li><a href="bookView.do?bid=12"><img src="images/3.jpg" alt="每个故事都在变成电影，每一分钟，都有人看到自己。" /></a></li>
						<li><a href="bookView.do?bid=13"><img src="images/4.jpg" alt="《白夜行》后东野圭吾备受欢迎作品：不是推理小说，却更扣人心弦" /></a></li>
						<li><a href="bookView.do?bid=14"><img src="images/5.jpg" alt="《小王子》犹如透亮的镜子，照出了荒唐的成人世界。" /></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="spacer clear"></div>
		<div class="hot">
			<h2>热卖推荐</h2>
			<ul class="product clearfix">
				<c:forEach items="${books}" var="book" end="11">
				<li>
					<dl>
						<dt><a href="bookView.do?bid=${book.bid}" target="_blank"><img src="<%=basePath %>images/product/${book.image}" /></a></dt>
						<dd class="title"><a href="bookView.do?bid=${book.bid}" target="_blank">${book.bname}</a></dd>
						<dd class="price">￥${book.pirce}</dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/YuxiSlider.jQuery.min.js"></script>
<script>
$(".slider").YuxiSlider({
	width:800, //容器宽度
	height:450, //容器高度
	control:$('.control'), //绑定控制按钮
	during:4000, //间隔4秒自动滑动
	speed:800, //移动速度0.8秒
	mousewheel:true, //是否开启鼠标滚轮控制
	direkey:true //是否开启左右箭头方向控制
});
</script>
</body>
</html>
