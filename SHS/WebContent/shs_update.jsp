<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>학생수정</title>
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
		.btn_index{
			padding: 10px 12px;
			background-color: yellowgreen;
			color: white;
			width: 90px;
			display: inline-block;
			border-radius: 10px;
			font-size: 17px;
		}
		.btn_index:hover{
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
			0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.div_index{
			padding: 9px 30px;
			text-align: center;
		}
		.btn2{
			background-color: orange;
		}
		.btn3{
			background-color: salmon;
		}
		.in_content{
			text-align: right;
		}
		.div_input{
			padding: 3px 20px;
		}
		.div_input > label{
			float: left;
			line-height: 40px;
		}
		.shs_input{
			width: 250px;
			display: inline-block;
			height: 40px;
			font-size: 16px;
			color: #515151;
			outline: none;
			border: 1px solid #aaa;
			padding: 0 10px;
		}
		.btn_wrap{
			display: flex;
			padding: 15px 0;
			justify-content: space-evenly;
		}
		hr{
			margin: 2px 0px;
			border: 1px dashed #515151;
		}
		#input_id{
			background-color: lightyellow;
			border: 1px solid #aaa!important;
			cursor: not-allowed;
		}
		.err_msg{
			color: tomato;
			font-size: 14px;
			display: none;
			text-align: left;
			padding-left: 80px;
		}
	</style>
</head>
<body>
	<div class="content">
		<%@ include file="include/header.jsp" %>
		<div class="shs_manager"> - 학사수정 - </div>

		<form action="SHSUpdate" id="frm_update" name="frm_update" method="POST">
			<div class="in_content">
				<hr>
				<div class="div_input">
					<label for="input_id">아이디:</label>
					<input type="text" value="${mDto.sid}" name="input_id" id="input_id" class="shs_input" placeholder="ID" readonly="readonly"><br>
				</div>	
				<hr>
				<div class="div_input">
					<label for="input_name">이름:</label>
					<input type="text" value="${mDto.sname}" name="input_name" id="input_name" class="shs_input" placeholder="NAME"><br>
					<span class="err_msg">필수 정보입니다.</span>
				</div>
				<div class="div_input">
					<label for="input_age">나이:</label>
					<input type="text" value="${mDto.sage}" name="input_age" id="input_age" class="shs_input" placeholder="AGE"><br>
					<span class="err_msg">필수 정보입니다.</span>
				</div>
				<div class="div_input">
					<label for="input_major">전공:</label>
					<input type="text" value="${mDto.smajor}" name="input_major" id="input_major" class="shs_input" placeholder="MAJOR"><br>
					<span class="err_msg">필수 정보입니다.</span>
				</div>
				<div class="div_input">
					<label for="input_phone">핸드폰번호:</label>
					<input type="text" value="${mDto.sphone}" name="input_phone" id="input_phone" class="shs_input" placeholder="PHONE"><br>
					<span class="err_msg">필수 정보입니다.</span>
				</div>
			</div>
			<div class="div_index btn_wrap">
				<a href="index" class="btn_index btn3">취소</a>
				<a href="#" class="btn_index btb1 submitBtn">수정</a>
			</div>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.shs_input').focus(function(event) {
				$(this).css('border', '1px solid dodgerblue');
			});
			$('.shs_input').blur(function(event) {
				$(this).css('border', '1px solid #aaa');
			});
			$('#input_name').keyup(function(event) {
				nameCheck();
			});
			$('#input_age').keyup(function(event) {
				ageCheck();
			});
			$('#input_major').keyup(function(event) {
				majorCheck();
			});
			$('#input_phone').keyup(function(event) {
				phoneCheck();
			});
			
			$('.submitBtn').click(function(event) {
				if(!nameCheck()){
					$('#input_name').focus();
					return false;
				}
				if(!ageCheck()){
					$('#input_age').focus();
					return false;
				}
				if(!majorCheck()){
					$('#input_major').focus();
					return false;
				}
				if(!phoneCheck()){
					$('#input_phone').focus();
					return false;
				}
				
				$('#frm_update').submit();
			});
		});
	</script>
</body>
</html>	