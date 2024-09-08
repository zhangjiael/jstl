<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/8/12
  Time: 下午2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="http://localhost:8088/jstl_Web_exploded/UploadServlet" method="post" enctype="multipart/form-data">
        用户名：<input type="text" name="username"> <br>
        头像： <input type="file" name="photo"> <br>
        <input type="submit" value="上传">
    </form>
</body>
</html>
