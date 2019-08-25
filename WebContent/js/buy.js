function numKeyUp() {
	var num = document.getElementById("num").value;
	var sellPrice = document.getElementById("sellPrice").innerHTML;
	num = num.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g, '');
	document.getElementById("num").value = num;

	if (num != "") {
		document.getElementById("totalPrice_info").innerHTML = (parseFloat(sellPrice) * parseInt(num)).toFixed(2);

	}

}

var points = Array("0", "0");

// 检查所有;
function checkall() {
	var i = 0;
	while (i <2) {
		if (points[i] == "0") {

			alert("您的填写的购买商品信息不正确，请检查");
			checkPsw();
			checkMoney();

			return false;
		} else {
			i++;
		}
	}
	return true;
}

function checkPsw() {
	var psw = document.getElementById("password").value;
	var truePsw = document.getElementById("truePassword").value;

	if (psw != truePsw) {
		points[0] = "0";
		document.getElementById("password_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >密码错误</font>";
	} else {
		points[0] = "1";
		document.getElementById("password_info").innerHTML = "";
	}
}

function checkMoney() {
	var num = document.getElementById("num").value;
	var totalPrice = document.getElementById("totalPrice_info").innerHTML;
	var moneyLeft = document.getElementById("moneyLeft").innerHTML;

	if (num == "") {
		points[1] = "0";
		document.getElementById("num_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >请填写商品数量</font>";
	}

	else if (parseFloat(totalPrice) > parseFloat(moneyLeft)) {
		points[1] = "0";
		document.getElementById("moneyLeft_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >余额不足</font>";
	} else {
		points[1] = "1";
		document.getElementById("moneyLeft_info").innerHTML = "";
	}
}
