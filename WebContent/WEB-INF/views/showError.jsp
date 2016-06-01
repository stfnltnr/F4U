<%@ page isErrorPage="true" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Fehler</h1>
	Message: <%=exception.getMessage() %><br>
	<br>
	Exception:    ${requestScope["javax.servlet.error.exception"]}<br>
	Message:      ${requestScope["javax.servlet.error.message"]}<br>
	Status Code:  ${requestScope["javax.servlet.error.status_code"]}<br>
	Request-URI:  ${requestScope["javax.servlet.error.request_uri"]}<br>
	Servlet Name: ${requestScope["javax.servlet.error.servlet_name"]}<br>
	<br>
	Exception:    ${pageContext.exception}<br>
	Message:      ${pageContext.exception.message}<br>
	<br>
	Exception:    ${pageContext.errorData.throwable}<br>
	Message:      ${pageContext.errorData.throwable.message}<br>
	Status Code:  ${pageContext.errorData.statusCode}<br>
	Request-URI:  ${pageContext.errorData.requestURI}<br>
	Servlet Name: ${pageContext.errorData.servletName}<br>
	<br>
	<a href="./index">Zurück</a>
</body>
</html>