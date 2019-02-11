<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form name="gstdiscount" method="post" action="gstdiscountupdate">
		<form:input path="gst" class="form-control" name="gst" id="gst" required="required"/>
		<form:input path="discount" class="form-control" name="discount" id="discount" required="required"/>
		<input class="btn btn-primary btn-sm"  type="submit" value="Update" />
	</form:form>
</body>
</html>