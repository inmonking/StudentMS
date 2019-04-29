<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생등록</title>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Jua');
		*{
			font-family: 'Jua', sans-serif;
		}

		body, ul{margin: 0; padding: 0;}
		a{color: inherit;text-decoration: none;}
		ul{list-style: none;}

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
		<a href="index.jsp">
			<div class="shs_title">
				JAVA기반 스마트하이브리드<br>
				개발자 과정 2기
			</div>
		</a>
		<div class="shs_manager"> - 학사등록 - </div>

		<form action="SHSInsert" id="frm_insert" name="frm_insert" method="POST">
			<div class="in_content">
				<div class="div_input">
					<label for="input_name">이름:</label>
					<input type="text" name="input_name" id="input_name" class="shs_input" placeholder="NAME"><br>
					<span class="err_msg">필수 정보입니다.</span>
				</div>
				<div class="div_input">
					<label for="input_age">나이:</label>
					<input type="text" name="input_age" id="input_age" class="shs_input" placeholder="AGE"><br>
					<span class="err_msg">몇살이야?( ͡° ͜ʖ ͡°)</span>
				</div>
				<div class="div_input">
					<label for="input_major">전공:</label>
					<input type="text" name="input_major" id="input_major" class="shs_input" placeholder="MAJOR"><br>
					<span class="err_msg">학교 어디다녀 ( ͡° ͜ʖ ͡°)</span>
				</div>
				<div class="div_input">
					<label for="input_phone">핸드폰번호:</label>
					<input type="text" name="input_phone" id="input_phone" class="shs_input" placeholder="PHONE"><br>
					<span class="err_msg">번호는 모야?( ͡° ͜ʖ ͡°)</span>
				</div>
			</div>
			<div class="div_index btn_wrap">
				<a href="index" class="btn_index btn3">취소</a>
				<a href="#" class="btn_index btb1 submitBtn">등록</a>
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
				$('#frm_insert').submit();

			});
		});
	</script>
</body>
</html>	