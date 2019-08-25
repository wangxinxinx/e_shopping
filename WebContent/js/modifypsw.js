var points = Array("0", "0", "0");
// 旧密码，新密码，确认新密码
// 检查所有;
function checkall() {
	var i = 0;
	while (i <3) {
		if (points[i] == "0") {

			alert("您的填写的修改密码信息不正确，请检查");
			checkpassword();
			checknewpassword();
			checkcpassword();
			return false;
		} else {
			i++;
		}
	}
	return true;
}

// 检查旧密码;
function checkpassword() {
	var pwd = document.getElementById("password").value;
	if (pwd == "") {
		document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码不能为空</font>";
		points[0] = "0";
		return false;
	} else if (pwd.length < 6) {
		document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码长度过短</font>";
		points[0] = "0";
		return false;
	} else if (pwd.length > 100) {
		document.getElementById("pwd_info").innerHTML = "<font color=\"red\">密码长度过长</font>";
		points[0] = "0";
		return false;
	} else {
		document.getElementById("pwd_info").innerHTML = "";
		points[0] = "1";
		return true;
	}
}

// 检查新密码;
function checknewpassword() {
	var pwd = document.getElementById("newpassword").value;
	if (pwd == "") {
		document.getElementById("newpwd_info").innerHTML = "<font color=\"red\">密码不能为空</font>";
		points[1] = "0";
		return false;
	} else if (pwd.length < 6) {
		document.getElementById("newpwd_info").innerHTML = "<font color=\"red\">密码长度过短</font>";
		points[1] = "0";
		return false;
	} else if (pwd.length > 100) {
		document.getElementById("newpwd_info").innerHTML = "<font color=\"red\">密码长度过长</font>";
		points[1] = "0";
		return false;
	} else {
		document.getElementById("newpwd_info").innerHTML = "";
		points[1] = "1";
		return true;
	}
}
// 检查密码是否一致;
function checkcpassword() {
	var pwd2 = document.getElementById("cqpassword").value;
	if (pwd2 == document.getElementById("newpassword").value) {
		document.getElementById("pwdrepeat_info").innerHTML = "";
		points[2] = "1";
		return true;
	} else {
		document.getElementById("pwdrepeat_info").innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";
		points[2] = "0";
		return false;
	}
}