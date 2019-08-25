var http_request = false;
var usernameValidate = "0";
function send_request(url) {// 初始化、指定处理函数、发送请求的函数
	http_request = false;
	// var usernameValidate = "0";
	// 开始初始化XMLHttpRequest 对象
	if (window.XMLHttpRequest) { // Mozilla 浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {// 设置MiME 类别
			http_request.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) { // IE 浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
	if (!http_request) { // 异常，创建对象实例失败
		window.alert("不能创建XMLHttpRequest 对象实例.");
		return false;
	}
	http_request.onreadystatechange = processRequest;
	// 确定发送请求的方式和URL 以及是否同步执行下段代码
	http_request.open("GET", url, true);
	http_request.send(null);
}

// 获取html文件body体内的内容
function getBody(content) {
	var REG_BODY = /<body[^>]*>([\s\S]*)<\/body>/;
	var result = REG_BODY.exec(content);
	if (result && result.length === 2)
		return result[1];
	return content;
}
// 处理返回信息的函数
function processRequest() {

	if (http_request.readyState == 4) { // 判断对象状态
		if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
			// alert(getBody(http_request.responseText).replace(/(^\s+)|(\s+$)/g,
			// ""));
			usernameValidate = getBody(http_request.responseText).replace(
					/(^\s+)|(\s+$)/g, "");
			if (usernameValidate == "1") {
				document.getElementById("user_info").innerHTML = "";
				points[0] = "1";
			} else {
				document.getElementById("user_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >该用户名已被占用</font>";
				points[0] = "0";

			}
		} else { // 页面不正常
			alert("您所请求的页面有异常。");
		}
	}
}

var points = Array("0", "0", "0", "0", "0", "0", "0", "1", "1", "1");
// 用户名，密码，重复密码,收件人姓名,电话，邮政编码,收货地址,email,出生日期,协议
// 检查所有;
function checkall() {
	var i = 0;
	while (i <10) {
		if (points[i] == "0") {

			alert("您的填写的注册信息不正确，请检查");
			checkusername();
			checkpassword();
			checkcpassword();
			checkrecvname();
			checktelphone();
			checkpostcode();
			checkadd();
			checkemail();
			checkbirthday();
			checkagree();
			return false;
		} else {
			i++;
		}
	}
	return true;
}
// 检查用户名;
function checkusername() {

	var username = document.getElementById("regusername").value;
	if (username == "") {

		document.getElementById("user_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >用户名不能为空</font>";
		points[0] = "0";
		return false;
	} else if (username.length > 100) {
		document.getElementById("user_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >用户名长度太长</font>";
		points[0] = "0";
		return false;
	} else {
		send_request('checkUsername.jsp?username=' + username);

	}

}
// 检查登入密码;
function checkpassword() {
	var pwd = document.getElementById("regpassword").value;
	if (pwd == "") {
		document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码不能为空</font>";
		points[1] = "0";
		return false;
	} else if (pwd.length < 6) {
		document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码长度过短</font>";
		points[1] = "0";
		return false;
	} else if (pwd.length > 100) {
		document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码长度过长</font>";
		points[1] = "0";
		return false;
	} else {
		document.getElementById("pwd_info").innerHTML = "";
		points[1] = "1";
		return true;
	}
}
// 检查密码是否一致;
function checkcpassword() {
	var pwd2 = document.getElementById("cpassword").value;
	if (pwd2 == document.getElementById("regpassword").value) {
		document.getElementById("pwdrepeat_info").innerHTML = "";
		points[2] = "1";
		return true;
	} else {
		document.getElementById("pwdrepeat_info").innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";
		points[2] = "0";
		return false;
	}
}
// 检查收件人姓名
function checkrecvname() {
	var recvname = document.getElementById("recvname").value;

	if (recvname == "") {
		document.getElementById("recvname_info").innerHTML = "<font color=\"red\">收件人姓名不能为空</font>";
		points[3] = "0";
		return false;
	} else if (recvname.length > 100) {
		document.getElementById("recvname_info").innerHTML = "<font color=\"red\">收件人姓名过长</font>";
		points[3] = "0";
		return false;
	} else {
		document.getElementById("recvname_info").innerHTML = "";
		points[3] = "1";
		return true;
	}

}
// 检查电话;
function checktelphone() {
	var tel = document.getElementById("regtel").value;
	var num1 = /(^13[013456789]\d{8}$)/;
	if (tel == "") {
		document.getElementById("tel_info").innerHTML = "<font color=\"red\">联系电话不能为空</font>";
		points[4] = "0";
		return false;
	}
	if (num1.test(tel)) {
		if (tel.length != 11) {
			// alert("您输入的手机号码有误!!");
			document.getElementById("tel_info").innerHTML = "<font color=\"red\">您输入的手机号码有误,请重输</font>";
			points[4] = "0";
			return false;
		} else {
			document.getElementById("tel_info").innerHTML = "";
			points[4] = "1";
			return true;
		}
	} else {
		document.getElementById("tel_info").innerHTML = "<font color=\"red\">您输入的手机号码有误,请重输</font>";
		points[4] = "0";
		return false;
	}
}
// 检查邮政编码
function checkpostcode() {
	var reg = /\d{6}/;
	var postcode = document.getElementById("regpostcode").value;
	if (postcode == "") {
		document.getElementById("postcode_info").innerHTML = "<font color=\"red\">邮政编码不能为空</font>";
		points[5] = "0";
	} else if (!reg.test(postcode)) {
		document.getElementById("postcode_info").innerHTML = "<font color=\"red\">您输入的邮政编码有误,请重输</font>";
		points[5] = "0";
	} else if (postcode.length != 6) {
		document.getElementById("postcode_info").innerHTML = "<font color=\"red\">您输入的邮政编码有误,请重输</font>";
		points[5] = "0";
	} else {
		document.getElementById("postcode_info").innerHTML = "";
		points[5] = "1";
	}
}
// 检查地址;
function checkadd() {
	
	if (document.getElementById("regaddr").value == "") {
		document.getElementById("address_info").innerHTML = "<font color=\"red\">收货地址不能为空</font>";
		points[6] = "0";
	} else {
		address_info.innerHTML = "";
		points[6] = "1";
	}
}
// 检查Email
function checkemail() {
	var email = document.getElementById("regemail").value;
	var reg = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");

	if (email == "") {
		points[7] = "1";
	} else if (reg.test(email)) {
		document.getElementById("email_info").innerHTML = "";
		points[7] = "1";
	} else {
		document.getElementById("email_info").innerHTML = "<font color=\"red\">E-mail地址无效</font>";
		points[7] = "0";
	}
}

// 检查出生日期;
function checkbirthday() {
	var reg = /^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
	var birthday = document.getElementById("regbirthday").value;

	if (birthday == "") {
		document.getElementById("birthday_info").innerHTML = "";
		points[8] = "1";
	} else if (reg.test(birthday)) {
		document.getElementById("birthday_info").innerHTML = "";
		points[8] = "1";
	} else {
		document.getElementById("birthday_info").innerHTML = "<font color=\"red\">出生日期格式有误,请重输</font>";
		points[8] = "0";
	}
}

// 检查协议;
function checkagree() {
	if (document.getElementById("agree").checked) {

		document.getElementById("confirm").disabled = false;
		points[9] = "1";
	} else {
		document.getElementById("confirm").disabled = "disabled";
		points[9] = "0";

	}
}