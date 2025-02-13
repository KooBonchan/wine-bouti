<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><tiles:insertAttribute name="title" /></title>
	<link rel="stylesheet" href="<c:url value='/resources/style/layout.css' />" />
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
	<link rel="stylesheet" href='${contextPath}<tiles:getAsString name="style"/>' />
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <c:set var="csrfToken" value="${_csrf.token}"/>
  <script>
  $.ajaxSetup({
	  beforeSend: function(xhr) {
	    xhr.setRequestHeader("AJAX", true);
	    xhr.setRequestHeader("X-CSRF-TOKEN", "${csrfToken}"); 
	  }
	})
  </script>
</head>

<body>
  <header><tiles:insertAttribute name="header" /></header>
	<%-- <aside><tiles:insertAttribute name="side" /></aside> --%>
	<div class="bodywrap"><tiles:insertAttribute name="body" /></div>
  <%-- <tiles:insertAttribute name="quickMenu" /> --%>
	<footer><tiles:insertAttribute name="footer" /></footer>
</body>
</html>