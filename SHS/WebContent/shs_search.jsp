<%@page import="com.shs.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>출석부</title>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Jua');
		@import url("css/common.css");

		.content {
			position: relative;
			width: 390px;
			height: 600px;
			border: 2px solid black;
			margin: 50px auto 0;
			background-color: #eee;
			border-radius: 5px;
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 
						0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.shs_manager {
			padding-top: 20px;
			padding-bottom: 20px;
			text-align: center;
			color: #454552;
			font-size: 20px;
		}
		.btn_index {
			padding: 10px 12px;
			background-color: yellowgreen;
			color: white;
			width: 90px;
			display: inline-block;
			border-radius: 10px;
			font-size: 17px;
		}
		.btn_index:hover {
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 
						0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.div_index {
			padding-bottom: 30px;
			text-align: center;
		}
		.btn2 {
			background-color: darkorange;
		}
		.btn3 { 
			background-color: orange;
		}
		.in_content {
			width: 330px;
			margin: 0 auto;
		}
		table {
			font-size: 17px;
			border-collapse: collapse;
			width: 330px;
			margin-bottom: 20px;
		}
		.table_title {
			background-color: yellowgreen;
			height: 25px;
			border: 0px;
		}
		.table_data {
			background-color: white;
			height: 25px;
			font-size: 17px;
		}
		.table_data:hover {
			background-color: lightyellow;
		}
		th { padding: 5px; }
		td { text-align: center; padding: 3px 0px;}
		tr { border-bottom: 1px dashed #bbbbbb; }
		.uBtn { color: dodgerblue; }
		.dBtn { color: tomato; }
		.uBtn:hover, .dBtn:hover {
			text-decoration: underline;
		}


		#modal{
			position: absolute; 
			width: inherit; 
			height: inherit; 
			background-color: rgba(0,0,0,0.5); 
			z-index: 100;
			display: none;
		}
		#modal >div{
			margin: 300px auto; 
			width: 60%; 
			height: 15%; 
			background-color: white;
			border-radius: 10px; 
			text-align: center;
			padding: 10px;
		}
		#btn_wrap{
			display: flex;
		}
		.modal_btn{
			width: 30%; 
			height: 30px; 
			margin:10px auto; 
			border-radius: 10px; 
			display: flex;
			justify-content: center; 
			align-items: center;
			cursor: pointer;
		}
		#btn_ok{
			background-color: greenyellow;
		}
		#btn_cancel{
			background-color: tomato;
		}
		.name {
			color: dodgerblue; 
		}
		.search_wrap {
			margin-bottom: 15px;
			width: 100%;
			height: 40px;
			position: relative;
		}
		.input_search {
			width: 100%;
			height:100%;
			padding: 0 10px;
			border: 2.5px solid mediumpurple;
			outline: none;
			color: #515151;
			font-size: 16px;
			border-radius: 50px;
		}
		.search_btn {	
			display: inline-flex;
			width: 40px;
			height:100%;
			background-color: mediumpurple;
			position: absolute;
			top: 0;
			right: 0;
			border-radius: 50%;
			justify-content: center;
			align-items: center;
		}
		.search_btn:hover {
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 
						0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.search_btn > i {
			font-size: 17px;
			color: white;
		}
		.search_result{
			color: black;
			font-size: 15px;
			padding-left: 10px;
		}
		.err_msg{
			display: none;
			color:tomato;
			margin-top: -15px;
			padding-left: 10px;
		}
		.point{
			color: dodgerblue;
		}
		.cnt{
			color: tomato;
		}
	</style>
</head>
<body>
	<div class="content">
		<div id="modal">
			<div>
				<span class="modal_text">
					"<span class="name"></span>" 학생을<br>
					정말 삭제하시겠습니까?
				</span>
				<div id="btn_wrap">
					<div id="btn_ok" class="modal_btn">확인</div>
					<div id="btn_cancel" class="modal_btn">취소</div>
				</div>
			</div>
		</div>
		<%@ include file="include/header.jsp" %>
		<div class="shs_manager"> - 학생검색 - </div>
		<div class="in_content">
			<div class="search_wrap">
				<input type="text" placeholder="검색할 이름을 입력해주세요." id="input_search" name="input_search" class="input_search" maxlength="4">
				<a href="#" class="search_btn"><i class="fas fa-search"></i></a>
			</div>
			<span class="err_msg">필수 정보입니다.</span>
		</div>
		
		<c:if test="${search_cnt>0 }">
			<div class="in_content">
				<span class="search_result">
					"<span class="point">${name }</span>"으로 검색한 결과 총 <span class="cnt">${search_cnt}</span>건 검색됨.
				</span>
			</div>
		</c:if>
		<div class="in_content">
			<table>
				<tr class="table_title">
					<th>ID</th>
					<th>Name</th>
					<th>Tel.</th>
					<th></th>
					<th></th>
				</tr>
				<c:if test="${shslist.size()==0 }">
					<tr class="table_data">
						<td colspan="5">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${shslist}" var="mDto">
					<tr class="table_data">
						<td class="sid">${mDto.sid}</td>
						<td class="sname">${mDto.sname}</td>
						<td>${mDto.sphone}</td>
						<td><a href="SHSUpdate?id=${mDto.sid}" class="uBtn">수정</a></td>
						<td><a id="dBtn" class="dBtn">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="div_index">
			<a href="index" class="btn_index btn3">뒤로가기</a>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.dBtn').click(function(event) {
				var sid = $(this).closest('tr').find('.sid').text();
				var sname = $(this).closest('tr').find('.sname').text();
				$('.name').text(sname);
				$('#modal').css('display', 'block');
				$('#btn_ok').click(function(event) {
					location.href = "SHSDelete?id="+sid;
				});
				$('#btn_cancel').click(function(event) {
					$('#modal').css('display', 'none');
				});
			});
			$('.search_btn').click(function(event){
				var regEmpty = /\s/g;
				var regNum = /[~0-9]/g;
				var name = $.trim($('#input_search').val());
				
				if(name==''||name.length == 0){
					$('.err_msg').css('display', 'block').css('color', 'tomato').text('필수정보 입니다.');
					return false;
				}else if(regNum.test(name)){
					$('.err_msg').css('display', 'block').css('color', 'tomato').text('문자만 입력해주세요.');
					return false;
				}else if(name.match(regEmpty)){
					$('.err_msg').css('display', 'block').css('color', 'tomato').text('공백없이 작성해주세요.');
					return false;
				}else if(name.length > 4||name.length<2){
					$('.err_msg').css('display', 'block').css('color', 'tomato').text('2~4글자로만 작성해주세요.');
					return false;
				}
				location.href = "search.shs?name="+name;
			});
			$('#input_search').keyup(function(event){
				var regEmpty = /\s/g;
				var regNum = /[~0-9]/g;
				if(event.keyCode == 13){
					var name = $.trim($('#input_search').val());
					if(name==''||name.length == 0){
						$('.err_msg').css('display', 'block').css('color', 'tomato').text('필수정보 입니다.');
						return false;
					}else if(regNum.test(name)){
						$('.err_msg').css('display', 'block').css('color', 'tomato').text('문자만 입력해주세요.');
						return false;
					}else if(name.match(regEmpty)){
						$('.err_msg').css('display', 'block').css('color', 'tomato').text('공백없이 작성해주세요.');
						return false;
					}else if(name.length > 4||name.length<2){
						$('.err_msg').css('display', 'block').css('color', 'tomato').text('2~4글자로만 작성해주세요.');
						return false;
					}
					location.href = "search.shs?name="+name;
				}
			});
		});
	</script>
</body>
</html>	