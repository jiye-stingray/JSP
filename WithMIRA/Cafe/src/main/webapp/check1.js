function jo_check() {

	if (document.orderfrm1.custno.value.length == 0) {
		alert("고객번호가 입력되지 않았습니다");
		orderfrm1.custno.focus();
		return false;
	}
	if (document.orderfrm1.custname.value.length == 0) {
		alert("고객이름이 입력되지 않았습니다");
		orderfrm1.custname.focus();
		return false;
	}
	for (var i = 0; i < 5; i++) {

		if (orderfrm1.menuno[i].checked == true) {
			break;

		}
		else if (i >= 4) {
			alert("메뉴번호가 입력되지 않았습니다");
			orderfrm1.menuno.focus();
			return false;
		}

	}



	if (orderfrm1.orderdate.value.length == 0) {
		alert("주문일자가 입력되지 않았습니다");
		orderfrm1.amount.focus();
		return false;
	}

	success();

	return true;
}

function success() {
	alert("주문완료");
}


function re() {
	alert("sdfhjkl");
	orderfrm1.reset();
	orderfrm1.custno.focus();
}

function modify() {
	alert("회원정보가 수정되었습니다");
}

function search() {
	window.location = "orderlist.jsp";
}

function modify(){
	alert("회원정보 수정이 완료되었습니다");
}