function jo_check(){
	
	if(document.orderfrm1.custno.value.length==0){
		alert("고객번호가 입력되지 않았습니다");
		orderfrm1.custno.focus();
		return false;
	}
	if(document.orderfrm1.custname.value.length==0){
		alert("고객이름이 입력되지 않았습니다");
		orderfrm1.custname.focus();
		return false;
	}	
	if(orderfrm1.amount.value.length==0){
		alert("수량이 입력되지 않았습니다");
		orderfrm1.amount.focus();
		return false;
	}
	alert("주문완료");
	return true;
}


function re(){
	alert("sdfhjkl");
	
}
/**
 * 
 */