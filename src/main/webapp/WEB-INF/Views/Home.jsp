<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart WebSite</title>
</head>
<body>

<c:if test="${isAdmin == true}">
<jsp:include page="Menu/CategoryBarAdmin.jsp"></jsp:include>
<jsp:include page="Admin/AdminHome.jsp"></jsp:include>
</c:if>

<c:if test="${isAdmin != true  }">
<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>
</c:if>

<center><h4><b>${ErrorMessage}</b></h4></center>

<c:if test="${isUserClickedLogin == true}">
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>

<c:if test="${not empty ErrorMessage}">
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>	

<c:if test="${isUserClickedRegistration==true}">
	<jsp:include page="Registration.jsp"></jsp:include>
	</c:if>
	
<c:if test="${isUserClickedCart == true}">
	<jsp:include page="Cart.jsp"></jsp:include>
	</c:if>

</body>
</html>
