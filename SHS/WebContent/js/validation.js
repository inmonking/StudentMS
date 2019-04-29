function nameCheck(){
	var name = $.trim($('#input_name').val());
	
	var regEmpty = /\s/g;
	var regNum = /[~0-9]/g;

	var resultBool = false;
	if(name==''||name.length == 0){
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato').text('필수정보 입니다.');
	}else if(regNum.test(name)){
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato').text('문자만 입력해주세요.');
	}else if(name.match(regEmpty)){
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato').text('공백없이 작성해주세요.');
	}else if(name.length > 4||name.length<2){
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato').text('2~4글자로만 작성해주세요.');
	}else{
		$('.err_msg').eq(0).css('display', 'block').css('color', 'dodgerblue')
		.text('존멋.');
		resultBool = true;
	}
	return resultBool;
}

function ageCheck(){
	var age = $.trim($('#input_age').val());
	var resultBool = false;
	if(age==''||age.length == 0){
		$('.err_msg').eq(1).css('display', 'block').css('color', 'tomato').text('필수정보 입니다.');
	}else if(isNaN(age)){
		$('.err_msg').eq(1).css('display', 'block').css('color', 'tomato').text('숫자만 입력해주세요.');
	}else if(age > 99||age<19){
		$('.err_msg').eq(1).css('display', 'block').css('color', 'tomato').text('19세~99세까지만 입력해주세요.');
	}else{
		$('.err_msg').eq(1).css('display', 'block').css('color', 'dodgerblue').text('등록가능.');
		resultBool = true;
	}
	return resultBool;
}

function majorCheck(){
	var major = $.trim($('#input_major').val());
	var regEmpty = /\s/g;
	var regNum = /[~0-9]/g;
	var resultBool = false;
	if(major.length == 0){
		$('.err_msg').eq(2).css('display', 'none');
	}else if(regNum.test(major)){
		$('.err_msg').eq(2).css('display', 'block').css('color', 'tomato').text('문자만 입력해주세요.');
	}else if(major.match(regEmpty)){
		$('.err_msg').eq(2).css('display', 'block').css('color', 'tomato').text('공백없이 작성해주세요.');
	}else{
		$('.err_msg').eq(2).css('display', 'block').css('color', 'dodgerblue').text('백수되기 좋은 전공이네요!');
		resultBool = true;
	}
	return resultBool;
}

function phoneCheck(){
	var phone = $.trim($('#input_phone').val());
	var phoneReg = RegExp(/^[0-9]{8,11}$/);
	var resultBool = false;
	if(phone==''||phone.length == 0){
		$('.err_msg').eq(3).css('display', 'block').css('color', 'tomato').text('필수정보 입니다.');
	}else if (isNaN(phone)) {
		$('.err_msg').eq(3).css('display', 'block').css('color', 'tomato').text('숫자만 입력해주세요.');
	}else if(!phoneReg.test(phone)){
		$('.err_msg').eq(3).css('display', 'block').css('color', 'tomato').text('올바른 값을 입력해주세요.');
	}else{
		$('.err_msg').eq(3).css('display', 'block').css('color', 'dodgerblue').text('등록 가능한 번호입니다.');
		resultBool = true;
	}
	return resultBool;
}