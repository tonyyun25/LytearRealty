<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물 보여주기</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
		
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<section class="content d-flex justify-content-center">
			<div class="">
				
				
				<div class="d-flex align-items-center justify-content-between">
					<button type="submit" class="btn btn-success mt-3 mb-2" id="addListBtn">매물 등록 화면</button>
					
					<c:if test="${not empty userName}">
					<div class="text-right ">${userName } 님 [로그아웃]</div><!--mafia/123-->
					</c:if>
				</div>
				
				<c:forEach var="realEstate" items="${realEstateList }">
				<div class="d-flex justify-content-center">
					<div class="border-box-viewList border border-secondary mb-3 d-flex align-items-center justify-content-center">
						<div>
							<div class="input-box ">
								<div>${realEstate.userName }</div>
							
							</div>
							
							<img src="${realEstate.imagePath }" class="w-100 imageClick">
							<hr>
							
							<div class="d-flex align-items-center mb-1">
								<div class="d-flex m-2 text-secondary" id="memberTypeInput">구분</div>								
								<div class="font-weight-bold">${realEstate.memberType }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" id="memberTypeInput">종류</span>								
								<div class="font-weight-bold">${realEstate.type }</div>	
							</div>
														
							<div class="d-flex align-items-center mb-1 ">
								<span class="d-flex m-2 text-secondary box-title" >주소</span><%--col은 편의상, 실제할 때는 width 다 잡아줘야 함 --%>
 								<%-- <input type="text" style="border:0 solid black;" class="font-weight-bold form-control" id="sample4_roadAddress">--%>
 								<div class="font-weight-bold">${realEstate.address }</div>	
							</div>
							
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >전용면적</span>
 								<div class="font-weight-bold">${realEstate.space }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1" id="sale">
								<span class="d-flex m-2 text-secondary" >매매가</span>
 								<div class="font-weight-bold">${realEstate.price }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1 d-none" id="jeonse">
								<span class="d-flex m-2 text-secondary" >보증금</span>
 								<div class="font-weight-bold">${realEstate.downPayment }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1 d-none" id="monthly">
								<span class="d-flex m-2 text-secondary" >월세</span>
 								<div class="font-weight-bold">${realEstate.rent }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >동</span>
 								<div class="font-weight-bold">${realEstate.complexNumber }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >호수</span>
 								<div class="font-weight-bold">${realEstate.housingUnitNumber }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >거주</span>
 								<div class="font-weight-bold">${realEstate.residence }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >입주일</span>
 									
 									<%-- <input type="text" class="form-control" id="moveInDateInput" <fmt:formatDate value="${realEstate.moveInDate }" pattern="yyyy년 MM월 dd일" />  > --%>
 									
 								<%-- <input type="text" style="border:0 solid black;" class="font-weight-bold" id="moveInDateInput" value="<fmt:formatDate value="${realEstate.moveInDate }" pattern="yyyy년 MM월 dd일" />" >--%>
 								<%--format은 memo의 jsp/post/listView 참조 --%>
 								<div class="font-weight-bold"><fmt:formatDate value="${realEstate.moveInDate }" pattern="yyyy년 MM월 dd일" /></div>	
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >옵션</span>
 								<div class="font-weight-bold">${realEstate.option }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >기타</span>
 								<div class="font-weight-bold">${realEstate.others }</div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >방문 가능 시작일</span>
 								<div class="font-weight-bold"><fmt:formatDate value="${realEstate.startDate }" pattern="yyyy년 MM월 dd일" /></div>
							</div>
							
							<div class="d-flex align-items-center mb-1">
								<span class="d-flex m-2 text-secondary" >방문 가능 종료일</span>
 								<div class="font-weight-bold"><fmt:formatDate value="${realEstate.endDate }" pattern="yyyy년 MM월 dd일" /></div>
							</div>
							
							
							<div>
								<a href="/reservation/request?realEstateId=${realEstate.id }" class="btn btn-success form-control mb-3" id="reservation">방문 예약</a>
								<a href="/reservation/list_view?realEstateId=${realEstate.id }" class="btn btn-secondary form-control mb-3">예약 결과 조회</a>
								
							</div>
						</div>
					</div>
					
				</div>
				
				</c:forEach>
			</div>
		</section>
	
	</div>
	
	<script>
		$(document).ready(function(){
			$("#addListBtn").on("click", function(){
				location.href="/real_estate/listing";
			});
			
			
			
		});	
	
	
	
	</script>



</body>
</html>