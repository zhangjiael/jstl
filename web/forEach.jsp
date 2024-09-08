<%@ page import="java.util.*" %>
<%@ page import="com.atguigu.pojo.Student" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/8/11
  Time: 下午3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    1. 遍历 1 到 10，输出
        begin 属性设置开始的索引
        end 属性设置结束的索引
        var 属性表示循环的变量(也是当前正在遍历到的数据)--%>
    <table border="1">
        <c:forEach var="i" begin="1" end="10" >
        <tr>
            <td>第${i}行</td>
        </tr>
    </c:forEach>
    </table>
<hr>
<%-- 2.遍历Object 数组
    for (Object item: arr)
    items 表示遍历的数据源（遍历的集合）
    var 表示当前遍历到的数据
--%>
    <%
        request.setAttribute("array",new String[]{"123455","12312312","2341231"});
    %>
    <c:forEach items="${requestScope.array}" var="number">
        ${number} <br>
    </c:forEach>
<hr>
<%-- items是map数据源 var是遍历当前的键值对--%>
    <%
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("key1", "value1");
        map.put("key2", "value2");
        map.put("key3", "value3");
        request.setAttribute("map", map);
    %>
    <c:forEach items="${requestScope.map}" var="map">
        ${map.key} = ${map.value} <br>
    </c:forEach>
<hr>
<%--遍历list集合--list 中存放 com.atguigu.pojo.Student 类，有属性：编号，用户名，密码，年龄，电话信息
    --%>
    <%
        List<Student> studentList = new ArrayList<Student>();
        for (int i = 1; i <= 10; i++) {
        studentList.add(new Student(i,"username"+i ,"pass"+i,18+i,"phone"+i));
        }
        request.setAttribute("stus", studentList);
    %>
    <table>
        <tr>
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>年龄</th>
            <th>电话信息</th>
            <th>status信息</th>
        </tr>
        <c:forEach begin="2" end="7" varStatus="status" items="${requestScope.stus}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.username}</td>
                <td>${student.password}</td>
                <td>${student.age}</td>
                <td>${student.phone}</td>
                <td>${status}</td>
            </tr>
         </c:forEach>
    </table>

</body>
</html>
