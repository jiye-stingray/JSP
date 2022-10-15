function Change_C_NO(){
	
	frm.cNo.value = frm.c_name.value;
	Change_class_name();
}

function Change_class_name(){
	if(frm.c_name.value >= 20000){
		frm.tuition.value =  frm.className.value / 2;
	}
	else{
		frm.tuition.value =  frm.className.value;
		
	}
	
}

function JoinCheck(){
	if(frm.regist_month.value.length == 0){
		alert("수강일이 입력되지 않았습니다");
		frm.regist_month.focus();
		
		return false;
	}
	if(frm.cNo.value.length == 0){
		alert("수강번호를 입력하지 않았습니다.");
		frm.cNo.focus();
		return false;
	}
	if(frm.tuition.value.length == 0){
		alert("수강료를 입력하지 않았습니다");
		frm.tuition.focus();
		return false;
	}
	

	alert("수강신청이 정상적으로 완료되었습니다!");
	frm.submit();
	
	window.location = "index.jsp";
	
	return true;
}

function Re(){
	alert("정보를 지우고 처음부터 다시 합니다");
	frm.reset();
}