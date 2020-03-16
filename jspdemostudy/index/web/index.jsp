<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/2/7
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  errorPage="error.jsp" language="java" %>
<%@ include file="error.jsp" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  hello. 现在 我们需要开始学习 java 和 jsp!
  <a href="www.erremall.top">Hello,<%=500000%></a>
  <jsp:include page="error.jsp">
      <jsp:param name="hello" value="1446290050@qq.com"></jsp:param>
  </jsp:include>

  <%--<jsp:include page="error.jsp"--%>
  </body>
</html>
