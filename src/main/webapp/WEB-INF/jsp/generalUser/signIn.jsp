<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<section class="content d-flex align-items-center justify-content-center">
			
			<div class="">
				
				<c:import url="/WEB-INF/jsp/include/header.jsp" />
				
				<div class="d-flex align-items-center justify-content-center">
					
					<div class="border-box1  border border-secondary d-flex align-items-center justify-content-center">
						
						<div class="input-box ">
							
							<div class="banner d-flex align-items-center justify-content-center mb-3">
								<span class="font-weight-bold">라이티어 리얼티</span>
							</div>
							
							<form id="signInForm">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">🚺</span>
									</div>
									<input type="text" class="form-control" placeholder="ID" name="loginId" id="idInput">
								</div>
								
								<div class="input-group mb-5">
									<div class="input-group-prepend">
										<span class="input-group-text">🔑</span>
									</div>
									<input type="password"  class="form-control" placeholder="●●●●" name="password" id="passwordInput">
								</div>
								
								
								<button type="submit" class="btn btn-success form-control mb-3" id="logInBtn">로그인</button>
							</form>
							
							
						</div>
					</div>
				</div>
							
				<div class="d-flex align-items-center justify-content-center mt-3">
					<div class="border-box3  border border-secondary d-flex align-items-center justify-content-center">
						<span class=" ">계정이 없으신가요?<a href="/generalUser/signup_view" > 일반회원 가입하기</a></span>
					
					</div>
				</div>
			</div>
			
		</section>	
	
	</div>
	<script>
			
		$(document).ready(function(){
			$("#signInForm").on("submit",function(e){
				e.preventDefault();
				
				var id = $("#idInput").val().trim();
				var password = $("#passwordInput").val().trim();
				
				if(id == null || id =="") {
					alert("ID를 입력해 주세요");
					return;
				}
				if(password == null || password == "") {
					alert("비밀번호를 입력해 주세요");
					return;
				}
				
				$.ajax({
					type: "post",
					url: "/generalUser/sign_in",
					data: {"loginId":id,"password":password},
					success: function(data){
						if(data.result == "success") {
							//alert("로그인 성공");
							location.href="/real_estate/view_list";
						} else {
							alert("로그인 실패");
						}
						
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