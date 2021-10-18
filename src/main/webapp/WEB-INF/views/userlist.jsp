<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items = "${userlist }" var="userlist">
${userlist.user_no } : ${userlist.user_email } : ${userlist.user_pw } : ${userlist.user_name } : ${userlist.user_phone } : ${userlist.user_address } <br>
</c:forEach>
</body>
</html>