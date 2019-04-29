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
			width: 330px;
			margin: 0 auto;
		}
		table{
			font-size: 17px;
			border-collapse: collapse;
			width: 330px;
			margin-bottom: 20px;
		}

		.table_title{
			background-color: yellowgreen;
			height: 25px;
			border: 0px;
		}
		.table_data{
			background-color: white;
			height: 25px;
			font-size: 17px;
		}
		.table_data:hover{
			background-color: lightyellow;
		}
		th{padding: 5px;}
		td{text-align: center;}
		tr{border-bottom: 1px dashed #bbbbbb;}
		.uBtn{color: dodgerblue}
		.dBtn{color: tomato; cursor:pointer;}

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
		.name{
			color : dodgerblue;
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
		<a href="index.jsp">
			<div class="shs_title">
				JAVA기반 스마트하이브리드<br>
				개발자 과정 2기
			</div>
		</a>
		<div class="shs_manager"> - 출석부 - </div>
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
						<td colspan="5">등록된 학생이 없습니다.</td>
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
		});
	</script>
</body>
</html>	