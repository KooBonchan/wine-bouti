<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
        <!-- 기업 이미지 -->
 
 <div class="info">      
<div class="logo-cs-info">
    <div class="logo">
        <img src="your-logo-url" alt="Company Logo" />
        <div class="phone">
            <p>전화번호: 123-456-7890</p>
        </div>
    </div>

    <div class="cs-info">
        <!-- 연락처 및 정보 -->
        <div class="contact-info">
            <div class="address">
                <p>오시는 길:</p>
            </div>
            <div class="business-info">
                <p>사업자 번호: 123-45-67890</p>
            </div>
            <div class="consultant">
                <p>상담사 연결: 080-1234-5678</p>
            </div>
        </div>

        <!-- SNS 아이콘 -->
        <div class="social-media">
		    <a href="https://facebook.com" target="_blank">
		       <img src="/resources/images/icon/X.svg" alt="Twitter" width="100" height="100">
		    </a>
		    <a href="https://twitter.com" target="_blank">
		        <img src="/resources/images/icon/X.svg" alt="Twitter" width="100" height="100">
		    </a>
		    <a href="https://instagram.com" target="_blank">
		        <img src="/resources/images/icon/instagram.svg" alt="Instagram" width="100" height="100">
		    </a>
		</div>
    </div>
</div>
</div>