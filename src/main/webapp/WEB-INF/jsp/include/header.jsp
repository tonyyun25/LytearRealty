<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
    
<header class="">    
	<c:if test="${not empty userName}">
		<div class="text-right mr-3">
			${userName } 님 <a href="/generalUser/sign_out">[로그아웃]</a>
		</div><!--mafia/123-->
		
		
		
		
	</c:if>
				
</header>				