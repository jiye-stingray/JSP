function jo_check(){
	
	
	if(document.orderfrm.orderno.value.length==0){
		alert("주문번호가 입력되지 않았습니다");
		orderfrm.orderno.focus();
		return false;
	}
	if(document.orderfrm.custno.value.length==0){
		alert("고객번호가 입력되지 않았습니다");
		orderfrm.custno.focus();
		return false;
	}
	if(document.orderfrm.custname.value.length==0){
		alert("고객이름이 입력되지 않았습니다");
		orderfrm.custname.focus();
		return false;
	}
	
	var i;
	for(i=0; i < 5; i++){
		
		if(orderfrm.menuno[i].checked == false){
			alert("메뉴번호가 입력되지 않았습니다");
			orderfrm.menuno.focus();
			return false;
		}
	
	}
		
	
	if(orderfrm.amount.value.length==0){
		alert("수량이 입력되지 않았습니다");
		orderfrm.amount.focus();
		return false;
	}
	
	success();
	return true;
}

function success(){
	
	alert("주문완료");
}



