<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매물 등록</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		<%--카카오 API 주소 예제에서 가져 옴 : https://postcode.map.daum.net/guide#sample --%>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
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
	<script>
		
		$(document).ready(function(){
			// 라디오 버튼 선택에 따른 인풋 변경
			$("input[name=type]").on('change',function(){
				if($(this).val() == 'sale') {
					$("#sale").removeClass("d-none");
					$("#jeonse").addClass("d-none");
					$("#monthly").addClass("d-none");
				} else if ($(this).val() == 'jeonse') {
					$("#sale").addClass("d-none");
					$("#jeonse").removeClass("d-none");
					$("#monthly").addClass("d-none");
				} else {
					$("#sale").addClass("d-none");
					$("#jeonse").removeClass("d-none");
					$("#monthly").removeClass("d-none");
				}
			});
			
			
			$("#imageUploadBtn").on("click",function(){
				$("#fileInput").click();
			});
			
			$("#addListBtn").on("click",function(){
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return;
				}
				<%--				
				let memberType = $("#memberTypeInput").val().trim();
				
				if(memberType == null || memberType == "") {
					alert("구분을 입력하세요")
					return;
				}

				let type = $("#typeInput").val().trim();
				
				if(type == null || type == "") {
					alert("종류를 입력하세요")
					return;
				}
				--%>				
				var memberTypeCheck = $("input[name=memberType]:checked").val();
				
				
				
				
				
				let address = $("#sample4_roadAddress").val().trim();
				
				if(address == null || address == "") {
					alert("주소를 입력하세요")
					return;
				}
				
				let detailAddress = $("#sample4_detailAddress").val().trim();
				
				if(detailAddress == null || detailAddress == "") {
					alert("상세주소를 입력하세요")
					return;
				}
				
				let extraAddress = $("#sample4_extraAddress").val().trim();
				
				
				
				let space = $("#spaceInput").val().trim();
				
				if(space == null || space == "") {
					alert("전용면적을 입력하세요")
					return;
				}
				<%--
				id는 대응하는 밸류 있어야하나 라디오는 name, checked 된 값 기반임
				--%>
				
				var typeCheck = $("input[name=type]:checked").val();
				
				
				let price = 0;
				let downPayment = 0; 
				let rent = 0;
				
				
				if($("input[name=type]:checked").val() == "sale") {
					price = $("#priceInput").val().trim();
					//let은 지역 변수이기 때문에 따로 선언하지 않으면 if 문 밖에서는 사용 못함
					if(price == null || price == "") {
						alert("매매가를 입력하세요")
						return;
					}
				}
				else if($("input[name=type]:checked").val() == "jeonse") {
					downPayment = $("#downPaymentInput").val().trim();
					
					if(downPayment == null || downPayment == "") {
						alert("보증금을 입력하세요")
						return;
					}					
				}
				else{
					downPayment = $("#downPaymentInput").val().trim();
					
					if(downPayment == null || downPayment == "") {
						alert("보증금을 입력하세요")
						return;
					}

					rent = $("#rentInput").val().trim();
					
					if(rent == null || rent == "") {
						alert("월세를 입력하세요")
						return;
					}
				}

				
				
				
				<%----%>
				let complexNumber = $("#complexNumberInput").val().trim();
				
				if(complexNumber == null || complexNumber == "") {
					alert("동을 입력하세요")
					return;
				}

				let housingUnitNumber = $("#housingUnitNumberInput").val().trim();
				
				if(housingUnitNumber == null || housingUnitNumber == "") {
					alert("호수를 입력하세요")
					return;
				}

				let residence = $("#residenceInput").val().trim();
				
				if(residence == null || residence == "") {
					alert("거주를 입력하세요")
					return;
				}

				let moveInDate = $("#moveInDateInput").val().trim();
				
				if(moveInDate == null || moveInDate == "") {
					alert("입주일을 입력하세요")
					return;
				}

				let option = $("#optionInput").val().trim();
				
				if(option == null || option == "") {
					alert("옵션을 입력하세요")
					return;
				}

				let others = $("#othersInput").val().trim();
				
				if(others == null || others == "") {
					alert("기타를 입력하세요")
					return;
				}
				<%-- 방문 가능 시간 입력 --%>
				let startDate = $("#startDateInput").val().trim();
				
				if(startDate == null || startDate == "") {
					alert("방문 가능 시작일을 입력하세요")
					return;
				}
				let endDate = $("#endDateInput").val().trim();
				
				if(endDate == null || endDate == "") {
					alert("방문 가능 종료일을 입력하세요")
					return;
				}
				
				// 기본주소, 상세주소, 참고항목을 address 한 줄로 합쳐야 한다
				address = address + ", " + detailAddress + " " + extraAddress;
				
				
				var formData = new FormData();
				formData.append("file", $("#fileInput")[0].files[0]);
				
				formData.append("memberType",memberTypeCheck);
				formData.append("type",typeCheck);
				
				formData.append("address",address);
				formData.append("space",space);
				formData.append("price",price);
				formData.append("downPayment",downPayment);
				formData.append("rent",rent);
				formData.append("complexNumber",complexNumber);
				formData.append("housingUnitNumber",housingUnitNumber);
				formData.append("residence",residence);
				formData.append("moveInDate",moveInDate);
				formData.append("option",option);
				formData.append("others",others);
				formData.append("startDate",startDate);
				formData.append("endDate",endDate);
				
				$.ajax({
					enctype: "multipart/form-data",
					processData: false,
					contentType: false,
					type:"post",
					url:"/real_estate/listUp",
					data: formData,
					success : function(data) {
						if(data.result == "success") {
							//alert("입력 성공");
							location.reload();
						} else {
							alert("글쓰기에 실패했습니다.");
						}			
					},
					error : function(e) {
						alert("error");
					}
				});
				
				
			});
			// data.address를 input 의 value에 넣어주기
			$("#sample4_roadAddress").on("click",function(){
				new daum.Postcode({
					oncomplete: function(data){
						
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						//alert(roadAddr);
						var extraRoadAddr = ''; // 참고 항목 변수
						
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraRoadAddr += data.bname;
						}
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraRoadAddr += (extraRoadAddr !== '' ? ',' + data.buildingName : data.buildingName);
						}
						if(extraRoadAddr !== ''){
							extraRoadAddr = '(' + extraRoadAddr + ')';
						}
						
						
						$("#sample4_roadAddress").val(data.address);
						
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는ㄴ다
						if(roadAddr !== '') {
							
							$("#sample4_extraAddress").val(extraRoadAddr);
							//document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							$("#sample4_extraAddress").val();
						}
						
						
						
						
						
						
						
						
						
						
					}
				}).open();
			});
			
			
		});
	
	</script>
	
	
</body>
</html>