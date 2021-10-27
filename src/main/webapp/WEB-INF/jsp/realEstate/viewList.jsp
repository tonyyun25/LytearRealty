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
				<c:if test="${not empty userName}">
				<div class="text-right mr-3">${userName } 님 [로그아웃]</div><!--mafia/123-->
				</c:if>
				
				
				<c:forEach var="realEstate" items="${realEstateList }">
				<div class="d-flex justify-content-center">
					<div class="border-box-viewList border border-secondary mb-3 d-flex align-items-center justify-content-center">
						<div>
							<div class="input-box ">
								<div>${realEstate.userName }</div>
							
							</div>
							
							<img src="${realEstate.imagePath }" class="w-100 imageClick">
							<hr>
							
							<div class="input-group mb-3">
								<span class="input-group-text" id="memberTypeInput">구분</span>								
									<input type="text"  class="form-control" value="${realEstate.memberType }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" id="memberTypeInput">종류</span>								
									<input type="text"  class="form-control" value="${realEstate.type }">
							</div>
														
							<div class="input-group mb-3">
								<span class="input-group-text" >주소</span>
 									<input type="text" class="form-control" id="sample4_roadAddress" value="${realEstate.address }">
 									
							</div>
							
							
							<div class="input-group mb-3">
								<span class="input-group-text" >전용면적</span>
 									<input type="text" class="form-control" id="spaceInput" value="${realEstate.space }">
							</div>
							
							<div class="input-group mb-3" id="sale">
								<span class="input-group-text" >매매가</span>
 									<input type="text" class="form-control" id="priceInput" value="${realEstate.price }">
							</div>
							
							<div class="input-group mb-3 d-none" id="jeonse">
								<span class="input-group-text" >보증금</span>
 									<input type="text" class="form-control" id="downPaymentInput" value="${realEstate.downPayment }">
							</div>
							
							<div class="input-group mb-3 d-none" id="monthly">
								<span class="input-group-text" >월세</span>
 									<input type="text" class="form-control" id="rentInput" value="${realEstate.rent }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >동</span>
 									<input type="text" class="form-control" id="complexNumberInput" value="${realEstate.complexNumber }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >호수</span>
 									<input type="text" class="form-control" id="housingUnitNumberInput" value="${realEstate.housingUnitNumber }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >거주</span>
 									<input type="text" class="form-control" id="residenceInput" value="${realEstate.residence }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >입주일</span>
 									
 									<%-- <input type="text" class="form-control" id="moveInDateInput" <fmt:formatDate value="${realEstate.moveInDate }" pattern="yyyy년 MM월 dd일" />  > --%>
 									
 									<input type="text" class="form-control" id="moveInDateInput" value="<fmt:formatDate value="${realEstate.moveInDate }" pattern="yyyy년 MM월 dd일" />" >
 									
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >옵션</span>
 									<input type="text" class="form-control" id="optionInput" value="${realEstate.option }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >기타</span>
 									<input type="text" class="form-control" id="othersInput" value="${realEstate.others }">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >방문 가능 시작일</span>
 									<input type="text" class="form-control" id="startDateInput" value="<fmt:formatDate value="${realEstate.startDate }" pattern="yyyy년 MM월 dd일" />">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >방문 가능 종료일</span>
 									<input type="text" class="form-control" id="endDateInput" value="<fmt:formatDate value="${realEstate.endDate }" pattern="yyyy년 MM월 dd일" />">
							</div>
							
							
							
							<button type="submit" class="btn btn-success form-control mb-3" id="addListBtn">매물 등록</button>
						
							
							
						</div>
					</div>
					
						
				</div>
				
				
				
				</c:forEach>
			</div>
		</section>
	
	
	</div>




</body>
</html>