<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 예약 리스트</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
		
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
		
		
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	  <%-- 
	  <link rel="stylesheet" href="/resources/demos/style.css">
	  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	  --%>
	  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
		
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
		
		
</head>
<body>
	
	<div id="wrap">
		<%--<c:import url="/WEB-INF/jsp/include/header.jsp" /> --%>
		
		<section class="content align-items-center d-flex justify-content-center">
			<div class="">
				${param.realEstateId }
				<c:if test="${not empty userName}">
				<div class="text-right mr-3">${userName } 님 [로그아웃]</div><!--mafia/123-->
				</c:if>
				
				<div class="d-flex align-items-center justify-content-center">
					<div class="border-box1-visit  border border-secondary d-flex align-items-center justify-content-center">
						<div class="input-box-visit ">
							<form id="visitRequestBtn" data-real-estate-id="${param.realEstateId }">
					
								<div class="banner d-flex align-items-center justify-content-center mb-3">
									<span class="font-weight-bold">방문예약 접수현황</span>
								</div>
								
						
								<%-- 
								<div class="input-group mb-3 mt-2">
									<span class="input-group-text" >방문 일자</span>
	 								<input type="text" class="form-control" id="dateInput" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								<div class="input-group mb-3">
									<span class="input-group-text" >방문 시간</span>
	 								<input type="text" class="form-control" id="timeInput" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								--%>
								<table class="table text-center">
									<thead>
										<tr>
											<th>매물</th>
											<th>날짜</th>
											<th>시간</th>
											<th>상태 입력</th>
											<th>상태 사유 입력</th>
											<th>비고</th>
										</tr>
									</thead>
									
									<tbody>
										<%-- <c:forEach var="reservation" items="${reservationList }">--%>
										<c:forEach var="reservationDetail" items="${reservationList }">
										
										<tr>
											<td>${reservationDetail.realEstate.address }</td><%--특정 post 대응 댓글 가져오기 위해 postId 대상 다 가져온 뒤 
											하나하나 따로 따로 댓글들을 매칭. 방문예약 정보 안에 매물 id 있어. 방문 예약 리스트에서 하나하나
											꺼내 realEsateid로 매물 테이블 일치하는 정보 가져와 세트로 묶어서 만들어줘야 함.
											SNS 코멘트 BO 쪽에.
											realEstate 객체 자체에 정보 미저장 가능성
											--%>
											
											<td><fmt:formatDate value="${reservationDetail.reservation.reserveDate }" pattern="yyyy년 MM월 dd일" /></td>
											<%--지금 여기 reservation은 진짜 reservation 값이 아니야. reservationDetail 안에 reservation이 있고 그 안에 reserveDate 값이 있다 --%>
											
											<td>${reservationDetail.reservation.reserveTime }</td>
											<td>[수정 중]</td>
											<td>[수정 중]</td>
											<td>[저장하기]</td>
										</tr>
										
										</c:forEach>
										
										
									</tbody>
								</table>
								
								
							</form>
					
						</div>
					</div>
				</div>
							
				
			</div>
		</section>
	
		
	</div>
	
	<script>
		
	
	</script>

</body>
</html>