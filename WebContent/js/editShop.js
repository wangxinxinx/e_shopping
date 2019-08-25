var http_request = false;
var shopnameValidate = "0";
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
			shopnameValidate = getBody(http_request.responseText).replace(
					/(^\s+)|(\s+$)/g, "");
			if (shopnameValidate == "1") {
				document.getElementById("shop_info").innerHTML = "";
				points[0] = "1";
			} else {
				document.getElementById("shop_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >该商店名已被占用</font>";
				points[0] = "0";

			}
		} else { // 页面不正常
			alert("您所请求的页面有异常。");
		}
	}
}

var points = Array("1", "1");
// 商店名，商店描述
// 检查所有;
function checkall() {
	var i = 0;
	while (i <2) {
		if (points[i] == "0") {

			alert("您的填写的商店信息不正确，请检查");
			checkshopname();
			checkShopDesc();
		

			return false;
		} else {
			i++;
		}
	}
	return true;
}
// 检查商店名;
function checkshopname() {

	var shopname = document.getElementById("shopname").value;
	if (shopname == "") {

		document.getElementById("shop_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >商店名不能为空</font>";
		points[0] = "0";
		return false;
	} else if (shopname.length > 100) {
		document.getElementById("shop_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >商店名长度过长</font>";
		points[0] = "0";
		return false;
	} else if(shopname==document.getElementById("shopname").defaultValue){
		document.getElementById("shop_info").innerHTML = "";
		points[0] = "1";
		return true;
	}else {
		send_request('checkShopname.jsp?shopname=' + shopname);
	}

}
// 检查商店描述;
function checkShopDesc() {
	var shop_desc = document.getElementById("shop_desc").value;
	if (shop_desc.length > 300) {
		document.getElementById("desc_info").innerHTML = "<font color=\"red\">商店说明过长</font>";
		points[1] = "0";
		return false;
	} else {
		document.getElementById("desc_info").innerHTML = "";
		points[1] = "1";
		return true;
	}
}

