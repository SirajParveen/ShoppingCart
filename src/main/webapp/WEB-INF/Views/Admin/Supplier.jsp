
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Supplier Page </title>
</head>
<body>


<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="../Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="../Menu/CategoryMenu.jsp"></jsp:include>

<a href="Manage_Category">Manage Category</a> &nbsp; &nbsp; <a
			href="Manage_Supplier">Manage Supplier</a> &nbsp; &nbsp; <a
			href="Manage_Product">Manage Product</a> &nbsp; &nbsp;
			
${Message}			

<center>
<h2> Manage Supplier Details </h2>

<c:if test="${empty supplier.name}">
<c:url var="addAction" value="/Manage_Supplier_Create"></c:url>
</c:if>

<c:if test="${!empty supplier.name}">
<c:url var="addAction" value="/Manage_Supplier_Update"></c:url>
</c:if>

	<form:form action="${addAction}" commandName="supplier"  method="post">
	
<table border="7">
<thead>

<tr>

<td><form:label path="id"><spring:message text="id" /></form:label></td>

	<c:choose>
	<c:when test="${not empty supplier.id} ">
	<td><form:input path="id"  readonly="true" /></td>
	</c:when>
	<c:otherwise>
	<td><form:input path="id" required="true" /></td>
	</c:otherwise>
	</c:choose>

<tr>
<td><form:label path="name"><spring:message text="Name" /></form:label></td>
<td><form:input path="name" required="true" title="Name should not be empty"/></td>
</tr>

<tr>
<td><form:label path="address"> <spring:message text="Address"/></form:label></td>
<td><form:input path="address" required="true" title="Enter Address"/></td>
</tr>
			
<tr>
<td colspan="2"><c:if test="${!empty supplier.name}"><input type="submit" value="<spring:message text="Update Supplier"/>" />
	</c:if>
	<c:if test="${empty supplier.name}">
	<input type="submit" value="<spring:message text="Create Supplier"/>" />
	</c:if>
	</td>
	</tr>

</table>
</form:form>
<br>
	
<h3>Supplier List</h3>
	<c:if test="${!empty supplierList}">
	<table class="tg">
			<tr>
			<th width="80">id</th>
			<th width="120">Name</th>
			<th width="120">Address</th>
			<th width="60">Edit</th>
			<th width="60">Delete</th>
			</tr>
	<c:forEach items="${supplierList}" var="supplier">
			<tr>
			<td>${supplier.id}</td>
			<td>${supplier.name}</td>
			<td>${supplier.address}</td>
			<td><a href="<c:url value='/Manage_Supplier_Edit/${supplier.id}' />">Edit</a></td>
					
			<td><a href="<c:url value='/Manage_Supplier_Delete/${supplier.id}' />">Delete</a></td>
			</tr>
	</c:forEach>
	</table>
	</c:if>

</center>

<jsp:include page="../Menu/Footer.jsp"></jsp:include>
</body>
</html>