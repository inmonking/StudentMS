<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>학사관리</title>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Jua');
		@import url("css/common.css");

		.content{
			width: 390px;
			height: 600px;
			border: 2px solid black;
			margin: 50px auto 0;
			background-color: #eee;
			border-radius: 5px;
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
			0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.shs_title{
			padding-top: 50px;
			text-align:center;
			font-size: 30px;
			color: black;
		}
		.shs_manager{
			padding-top: 20px;
			padding-bottom: 20px;
			text-align: center;
			color: #454552;
			font-size: 20px;
		}
		.btn_index:hover{
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
			0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.div_index{
			padding: 9px 30px;
			border: 1.5px dashed black;
			display: inline-block;
			width: 60%;
			border-radius: 10px;
			background-color: white;
			margin: 0 auto;
		}
		.container{
			height: 320px;
			display: flex;
			flex-direction: column;
			justify-content: space-evenly;
		}
	</style>
</head>
<body>
	<div class="content">
		<%@ include file="include/header.jsp" %>
		
		<div class="shs_manager"> - 학사관리 - </div>
		<div class="container">
			<div class="div_index" style="display: flex;">
				<div style="display:flex; align-items: center; justify-content: center;margin-right: 20px; position: relative; width: 40px;">
					<div style="position: absolute; z-index: 2; color: tomato">STMS</div>
					<div style="position: absolute; border: 2px solid black; border-radius: 5px; width: 45px; height: 40px; z-index: 1"></div>
				</div>
				<div>
					<div><span style="color: mediumseagreen">StudentMS</span>는 교육생</div>
					<div>웹관리 프로그램 입니다</div>
				</div>
			</div>
			<div class="div_index">
				<div>만든이 : 최인준</div>
				<div>email : <span style="color: dodgerblue">inmonking@gmail.com</span></div>
			</div>
			<div class="div_index">
				<div>사용중 발생한 문제 사항은</div>
				<div>만든이 메일 주소</div>
				<div style="color: dodgerblue">inmonking@gmail.com</div>
				<div>로 문의 주시기 바랍니다.</div>
			</div>
		</div>
	</div>
</body>
</html>