var points = Array("0", "0", "0");
// 收款人、付款金额、备注
// 检查所有;
function checkall() {
	var i = 0;
	while (i <3) {
		if (points[i] == "0") {
			alert("您输入的部分信息格式不正确,请检查!");
			checkreceiver();
			checkmoney();
			checkremark();
			return false;
		} else {
			i++;
		}
	}
	return true;
}

// 检查收款人
function checkreceiver() {
	var receiver = document.getElementById("receiver").value;
	
	if (receiver == "") {
		document.getElementById("recv_info").innerHTML = "<font color=\"red\">请填写收款人信息</font>";
		points[0] = "0";
		return false;
	}  else if (receiver.length > 100) {
		document.getElementById("recv_info").innerHTML = "<font color=\"red\">收款人信息过长</font>";
		points[0] = "0";
		return false;
	} else {
		document.getElementById("recv_info").innerHTML = "";
		points[0] = "1";
		return true;
	}
}

// 检查金额;
function checkmoney() {
	var money = document.getElementById("money").value;
	var money_left=document.getElementById("money_left").value;
	
	if (money == "") {
		document.getElementById("money_info").innerHTML = "<font color=\"red\">请填写付款金额</font>";
		points[1] = "0";
		return false;
	}else if(parseFloat(money)>parseFloat(money_left))
	{
		document.getElementById("money_info").innerHTML = "<font color=\"red\">余额不足</font>";
		points[1] = "0";
		return false;
	}
	else {
		document.getElementById("money_info").innerHTML = "";
		points[1] = "1";
		return true;
	}
}
// 检查备注;
function checkremark() {
	var remark = document.getElementById("remark").value;
	if (remark.length>300) {
		document.getElementById("remark_info").innerHTML = "<font color=\"red\">付款说明过长</font>";
		points[2] = "0";
		return false;
	} else {
		document.getElementById("remark_info").innerHTML = "";
		points[2] = "1";
		return true;
	}
}