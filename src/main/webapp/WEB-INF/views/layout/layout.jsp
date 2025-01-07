<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/mobile.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- TODO: 이하 JS 파일들을 3.7.1에 맞게 버전 업 - GPT 사용 권장 -->
<script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script>
<title><tiles:insertAttribute name="title" /></title>
<tiles:insertAttribute name="style" ignore="true" />
</head>

<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header><tiles:insertAttribute name="header" /></header>
			<div class="clear"></div> <!-- TODO: CSS에서 Float를 사용하고 있으므로 flex 등으로 변경할 것! -->
			<aside><tiles:insertAttribute name="side" /></aside>
			<article><tiles:insertAttribute name="body" /></article>
			<div class="clear"></div>
			<footer><tiles:insertAttribute name="footer" /></footer>
		</div>
		<tiles:insertAttribute name="quickMenu" />
	</div>
	<script>
		// 슬라이드 
		$(document).ready(function() {
			$('#ad_main_banner').bjqs({
				'width' : 775,
				'height' : 145,
				'showMarkers' : true,
				'showControls' : false,
				'centerMarkers' : false
			});
		});
		// 스티키    
		$(function() {
			$("#sticky").stickySidebar({
				timer : 100,
				easing : "easeInBounce"
			});
		});
	</script>        	
</body>