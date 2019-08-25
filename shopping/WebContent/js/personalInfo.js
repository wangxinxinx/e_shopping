var points = Array("1", "1", "1", "1", "1","1");
// 收件人姓名,电话，邮政编码,地址，email,出生日期
// 检查所有;
function checkall() {

	var i = 0;
	while (i < 6) {
		if (points[i] == "0") {
			alert("您输入的部分修改信息格式不正确,请检查!");
			checkrecvname();
			checktelphone();
			checkpostcode();
			checkadd()
			checkemail();
			checkbirthday();
			return false;
		} else {
			i++;
		}
	}
	return true;
}

// 检查收件人姓名
function checkrecvname() {
	var recvname = document.getElementById("recvname").value;
	
	if (recvname == "") {
		document.getElementById("recvname_info").innerHTML = "<font color=\"red\">收件人姓名不能为空</font>";
		points[0] = "0";
		return false;
	}
	if (recvname.length > 100) {
		document.getElementById("recvname_info").innerHTML = "<font color=\"red\">收件人姓名过长</font>";
		points[0] = "0";
		return false;
	} else {
		document.getElementById("recvname_info").innerHTML = "";
		points[0] = "1";
		return true;
	}

}
// 检查电话;
function checktelphone() {
	var tel = document.getElementById("tel").value;
	var num1 = /(^13[013456789]\d{8}$)/;

	if (tel == "") {
		document.getElementById("tel_info").innerHTML = "<font color=\"red\">联系电话不能为空</font>";
		points[1] = "0";
		
	} else if (num1.test(tel)) {
		if (tel.length != 11) {
			// alert("您输入的手机号码有误!!");
			document.getElementById("tel_info").innerHTML = "<font color=\"red\">您输入的手机号码有误,请重输</font>";
			points[1] = "0";
		} else {
			document.getElementById("tel_info").innerHTML = "";
			points[1] = "1";
		}
	} else {
		document.getElementById("tel_info").innerHTML = "<font color=\"red\">您输入的手机号码有误,请重输</font>";
		points[1] = "0";
	}
}
// 检查邮政编码
function checkpostcode() {
	var reg = /[1-9]\d{5}(?!\d)/;
	var postcode = document.getElementById("postcode").value;

	if (postcode == "") {
		document.getElementById("postcode_info").innerHTML = "<font color=\"red\">邮政编码不能为空</font>";
		points[2] = "0";
	} else if (!reg.test(postcode)) {
		document.getElementById("postcode_info").innerHTML = "<font color=\"red\">您输入的邮政编码有误,请重输</font>";
		points[2] = "0";

	} else if (postcode.length != 6) {
		document.getElementById("postcode_info").innerHTML = "<font color=\"red\">您输入的邮政编码有误,请重输</font>";
		points[2] = "0";
	} else {
		document.getElementById("postcode_info").innerHTML = "";
		points[2] = "1";
	}
}
//检查地址;
function checkadd() {

	if (document.getElementById("addr").value == "") {
		document.getElementById("address_info").innerHTML = "<font color=\"red\">收货地址不能为空</font>";
		points[3] = "0";
	} else {
		address_info.innerHTML = "";
		points[3] = "1";
	}
}
// 检查Email
function checkemail() {
	var email = document.getElementById("email").value;
	var reg = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");

	if (email == "") {
		document.getElementById("email_info").innerHTML = "";
		points[4] = "1";
	} else if (reg.test(email)) {
		document.getElementById("email_info").innerHTML = "";
		points[4] = "1";
	} else {
		document.getElementById("email_info").innerHTML = "<font color=\"red\">E-mail地址无效</font>";
		points[4] = "0";
	}
}

// 检查出生日期;
function checkbirthday() {
	var reg = /^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
	var birthday = document.getElementById("birthday").value;

	if (birthday == "") {
		document.getElementById("birthday_info").innerHTML = "";
		points[5] = "1";
	} else if (reg.test(birthday)) {
		document.getElementById("birthday_info").innerHTML = "";
		points[5] = "1";
	} else {
		document.getElementById("birthday_info").innerHTML = "<font color=\"red\">出生日期格式有误,请重输</font>";
		points[5] = "0";
	}
}
