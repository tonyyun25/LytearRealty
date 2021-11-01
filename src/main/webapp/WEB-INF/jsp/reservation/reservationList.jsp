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

</head>
<body>

	<div id="wrap">
		<%--<c:import url="/WEB-INF/jsp/include/header.jsp" /> --%>
		
		<section class="content align-items-center d-flex justify-content-center">
			<div class="">
				
				<c:if test="${not empty userName}">
				<div class="text-right mr-3">${userName } 님 [로그아웃]</div><!--mafia/123-->
				</c:if>
				
				<div class="d-flex align-items-center justify-content-center">
					<div class="border-box1  border border-secondary d-flex align-items-center justify-content-center">
						<div class="input-box ">
					
					
							<div class="d-flex justify-content-between  align-items-center mt-2">
								<!--  <button type="button" class="btn btn-secondary" >첨부</button>-->
								<a href="#" id="imageUploadBtn"><i class="bi bi-card-image image-upload-icon"></i></a>
								<input type="file" accept="image/*"  id="fileInput" class="d-none"> <!-- 웹프론트 / 아이콘무료사이트 
								구글링 bootsrap icon, bootstrap icon cdn
								-->
								<%-- <button type="button" class="btn btn-success" id="uploadBtn">업로드</button>--%>
							</div>
							
							
							<%--form은 엔터쳤을 때 입력값을 물고 다음으로 넘어가는 것이 장점이나
							여기서는 id / password 입력이 아니므로 form은 없어도 됨
							입력 값 가져오는 것은 ajax로 개별적으로 가능함. --%>
								
							<div class="input-group mb-3">
								<span class="input-group-text" id="memberTypeInput">구분</span>
								
								<div class="d-flex align-items-end justify-content-between">
									<div class="">
 									<label><input type="radio" name="memberType" value="broker" class="ml-3" checked>중개사 매물</label>
 									<label><input type="radio" name="memberType" value="member" class="ml-3" >일반회원 매물</label>
									</div>
								</div>
 									
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" id="typeInput">종류</span>
								
 									<div class="d-flex align-items-end justify-content-between">
 										<div class="">
	  									<label><input type="radio" name="type" value="sale" class="ml-3" checked>매매</label>
	  									<label><input type="radio" name="type" value="jeonse" class="ml-3" >전세</label>
	  									<label><input type="radio" name="type" value="monthly" class="ml-3" >월세</label>
  									</div>
 									</div>
 									
							</div>
							
							<div class="input-group ">
								<span class="input-group-text" >주소</span>
 									<input type="text" class="form-control" id="sample4_roadAddress" aria-label="Username" aria-describedby="basic-addon1">
 									
							</div>
							
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1">
							
							<input type="text" class="form-control mb-3" id="sample4_extraAddress" placeholder="참고항목" aria-label="Username" aria-describedby="basic-addon1">
							
							<div class="input-group mb-3">
								<span class="input-group-text" >전용면적</span>
 									<input type="text" class="form-control" id="spaceInput"aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3" id="sale">
								<span class="input-group-text" >매매가</span>
 									<input type="text" class="form-control" id="priceInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3 d-none" id="jeonse">
								<span class="input-group-text" >보증금</span>
 									<input type="text" class="form-control" id="downPaymentInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3 d-none" id="monthly">
								<span class="input-group-text" >월세</span>
 									<input type="text" class="form-control" id="rentInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >동</span>
 									<input type="text" class="form-control" id="complexNumberInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >호수</span>
 									<input type="text" class="form-control" id="housingUnitNumberInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >거주</span>
 									<input type="text" class="form-control" id="residenceInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >입주일</span>
 									<input type="text" class="form-control" id="moveInDateInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >옵션</span>
 									<input type="text" class="form-control" id="optionInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >기타</span>
 									<input type="text" class="form-control" id="othersInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >방문 가능 시작일</span>
 									<input type="text" class="form-control" id="startDateInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" >방문 가능 종료일</span>
 									<input type="text" class="form-control" id="endDateInput" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							
							
							
							<button type="submit" class="btn btn-success form-control mb-3" id="addListBtn">매물 등록</button>
						
							
					
						</div>
					</div>
				</div>
							
				
			</div>
		</section>
	
		
	</div>

</body>
</html>