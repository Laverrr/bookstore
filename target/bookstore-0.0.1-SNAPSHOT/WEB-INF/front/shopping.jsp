<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <li><a href="productList.do?type=${bt}">${bt}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="wrap">
    <div id="shopping">
        <c:if test="${sessionScope.cart.totalPrice!=0&&sessionScope.cart!=null}">
            <form action="shopping-result.html">
                <table class="table table-hover">
                    <tr>
                        <th>商品名称</th>
                        <th>单价（元）</th>
                        <th>购买数量</th>
                        <th>金额（元）</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="good" items="${sessionScope.cart.goods}">
                        <tr id="product_id_1">
                            <td class="thumb"><img height="80" width="80"
                                                   src="<%=basePath %>images/product/${good.key.image}"/><a
                                    href="bookView.do?bid=${good.key.bid}">${good.key.bname}</a></td>
                            <td class="price">
                                <span>￥${good.key.pirce}</span>
                                <input id="price${good.key.bid}" type="hidden" value="${good.key.pirce}"/>
                            </td>
                            <td class="number">
                                <span id="sub" onclick="sub(${good.key.bid});"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></span>
                                <input style="height: 25px; width:25px;" type="text" id="number${good.key.bid}" name="number" value="${good.value}" size="2" readonly/>
                                <span id="add" onclick="add(${good.key.bid});"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span>
                            </td>
                            <td class="price">
                                <span>￥</span>
                                <span id="goodSum${good.key.bid}">${good.key.pirce*good.value}</span>
                            </td>
                            <td class="delete"><a href="removeGoodsFromCart.do?bid=${good.key.bid}">删除</a></td>
                        </tr>
                    </c:forEach>

                    <tr class="warning">
                        <td colspan="" rowspan="" headers="">合计金额</td>
                        <td colspan="" rowspan="" headers=""></td>
                        <td colspan="" rowspan="" headers=""></td>
                        <td colspan="" rowspan="" headers=""></td>
                        <td class="price" id="price_id_1">
                            <span>￥</span>
                            <span id="sum">${sessionScope.cart.totalPrice }</span>
                            <input id="hiddenSum" type="hidden" value="${sessionScope.cart.totalPrice}"/>
                        </td>
                    </tr>
                </table>
                <div class="button">
                    <a href="cleanCart.do">清空购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${sessionScope.user!=null}"><a id="submit" href="#"><img
                            src="<%=basePath %>images/pay.png"></a></c:if>
                    <c:if test="${sessionScope.user==null}"><a onclick="unLog();" href="#"><img
                            src="<%=basePath %>images/pay.png"></a></c:if>


                </div>
            </form>
        </c:if>
        <c:if test="${sessionScope.cart.totalPrice==0||sessionScope.cart==null}">
            <img src="<%=basePath %>images/empty.jpg"/>
        </c:if>

    </div>
</div>
<jsp:include page="../static/footer.html"/>
<script src="../../js/shopping.js"></script>
</body>
</html>

