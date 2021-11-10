<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 예약 신청</title>

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
					<div class="border-box1  border border-secondary d-flex align-items-center justify-content-center">
						<div class="input-box ">
							<form id="visitRequestBtn" data-real-estate-id="${param.realEstateId }">
					
								<div class="banner d-flex align-items-center justify-content-center mb-3">
									<span class="font-weight-bold">방문예약 신청</span>
								</div>
						
								<div class="input-group mb-3 mt-2">
									<span class="input-group-text" >방문 일자</span>
	 									<input type="text" class="form-control" id="dateInput" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								<div class="input-group mb-3">
									<span class="input-group-text" >방문 시간</span>
	 									<input type="text" class="form-control" id="timeInput" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								
								
								<button type="submit" class="btn btn-success form-control mb-5" id="reservationRequestBtn">예약 요청하기</button>
							
							</form>
					
						</div>
					</div>
				</div>
							
				
			</div>
		</section>
	
		
	</div>
	
	<script>
		$(document).ready(function(){
			$("#dateInput").datepicker({
				minDate:0,
				showButtonPanel: true,
				currentText: '오늘',
				dateFormat: "yy-mm-dd",
				dayNamesMin:['일','월','화','수','목','금','토']
			
				
			});
			
			// timepicker : https://timepicker.co/
			// 매물과 방문예약은 결속력이 있으면(두 가지에 한해 기능이 구성되면) 방문예약을 매물 아래에 (심플하기는 함).
			// 매물이 방문 예약과 별개로 실거래라든가 완전히 다른 용도로 사용 가능하다면
			// reservation 패키지를 별도로 만드는 게 좋을 것 (O, 매물 패키지의 확장성에 용이)
			
			$('#timeInput').timepicker({
			    timeFormat: 'h:mm p',
			    interval: 30,
			    minTime: '10',
			    maxTime: '7:00pm',
			    defaultTime: '11',
			    startTime: '10:00',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
			});
			
			
			
			$("#visitRequestBtn").on("submit", function(e){
				e.preventDefault();
				
				var date = $("#dateInput").val().trim(); 
				var time = $("#timeInput").val().trim(); 
				var id = $(this).data("real-estate-id");//12를 꺼내 입력함. data 메소드. 아주 자주 쓰는 문법 흐름이므로 숙지
				
				if(date==null || date=="") {
					alert("방문 일자를 선택하세요")
				} 
				if(time==null || time=="") {
					alert("방문 시간을 선택하세요")
				} 
				
				$.ajax({
					type: "get",
					url: "/reservation/sendRequest",
					data: {"reserveDate":date,"reserveTime":time,"realEstateId":id},//${param.realEstateId } 처음 한 방법
					success: function(data){
						if(data.result == "success") {
							//alert("입력 성공");
							location.href="/reservation/list_view";//21.11.10일 추가
						} else {
							alert("입력 실패")
						}
						//10:30:00초 형식 저장시 될 수도 있음. 아니면 시간만 저장 가능한 타입(timestamp) 있는지 확인
						// 아니면 String으로 데이타에 저장
					},
					error: function(e) {
						alert("에러");
					}
					
				});
			});
			
		});
	
		
	
	</script>

</body>
</html>