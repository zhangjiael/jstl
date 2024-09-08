<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/8/9
  Time: 下午3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--   <c:set/> 作用：set标签可以往域中保存数据
        域对象.setAttribute(key,value);
        scope 属性设置保存到哪个域
            page 表示PageContext 域（默认值）
            request 表示Request 域
            session 表示Session 域
            application 表示ServletContext 域
        var 属性设置key 是多少
        value 属性设置值
        注意事项：1.只能使用jsp注释 2.when标签的父标签只能是choose--%>
    保存之前：${ sessionScope.abc } <br>
    <c:set scope="session" var="abc" value="abcValue"/>
    保存之后：${ sessionScope.abc } <br>
    <hr>
<%--    <c:if /> if 标签用来做 if 判断。
        test属性表示判断的条件（使用EL表达式输出）--%>
    <c:if test="${12==12}">
        <h1>12等于12</h1>
    </c:if>
    <hr>
<%--    <c:choose> <c:when> <c:otherwise>标签
    作用：多路判断。跟 switch ... case .... default 非常接近
    choose标签表示开始选择判断
    when标签表示每一种判断情况 test属性表示当前判断情况的值
    只会执行一个成立的
    otherwise表示剩下的情况
    --%>
    <%
        request.setAttribute("height",178);
    %>
    <c:choose>
        <c:when test="${ requestScope.height>190}">
            <h2>小巨人</h2>
        </c:when>
        <c:when test="${ requestScope.height>180}">
            <h2>很高</h2>
        </c:when>
        <c:when test="${requestScope.height>170}">
            <h2>还可以</h2>
        </c:when>
        <c:otherwise>
            <h2>剩下小于170的情况</h2>
        </c:otherwise>
    </c:choose>
    <hr>
</body>
</html>
