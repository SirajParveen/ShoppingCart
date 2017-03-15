<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Admin Home Page </title>
</head>
<body>

<img src="<c:url value="/resources/Images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="50px" height="50px" align="left">
<h3><b>Shopping Cart</b><small> <br> 
Your Need Your Choice</small></h3>

<jsp:include page="../Menu/CategoryMenu.jsp"></jsp:include>

<a href="Manage_Category"> Category </a><br>
<a href="Manage_Product"> Product </a><br>
<a href="Manage_Supplier"> Supplier </a>

<a href="Logout">Logout <span class="glyphicon glyphicon-log-out"></span></a>

<c:if test="${isUserClickedCategory == true}">
<jsp:include page="Category.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedProduct == true}">
<jsp:include page="Product.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedSupplier == true}">
<jsp:include page="Supplier.jsp"></jsp:include>
</c:if>

</body>
</html>