var points = Array("0", "0", "1", "1", "1");
// 商品名，价格，折扣，商品介绍，协议
// 检查所有;
function checkall() {
	var i = 0;
	while (i < 5) {
		if (points[i] == "0") {

			alert("您的填写的创建商品信息不正确，请检查");
			checkpname();
			checkprice();
			checkdiscount();
			checkProductDesc();
			checkagree();
			return false;
		} else {
			i++;
		}
	}
	return true;
}
// 检查商品名;
function checkpname() {

	var pname = document.getElementById("pname").value;
	if (pname == "") {

		document.getElementById("product_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >商品名不能为空</font>";
		points[0] = "0";
		return false;
	} else if (pname.length > 100) {
		document.getElementById("product_info").innerHTML = "<font color=\"red\" class=\"STYLE1\" >商品名长度太长</font>";
		points[0] = "0";
		return false;
	} else {
		document.getElementById("product_info").innerHTML = "";
		points[0] = "1";
		return true;
	}

}
//检查商品价格;
function checkprice() {
	var price = document.getElementById("price").value;
	
	if (price == "") {
		document.getElementById("price_info").innerHTML = "<font color=\"red\">请填写商品价格</font>";
		points[1] = "0";
		return false;
	}
	else {
		document.getElementById("price_info").innerHTML = "";
		points[1] = "1";
		return true;
	}
}

//检查商品折扣;
function checkdiscount() {
	var discount = document.getElementById("discount").value;
	
	if (discount == "") {
		document.getElementById("discount").value="1";
		points[2] = "0";
		return false;
	}
	else if(parseDouble(discount)<0||parseDouble(discount)>1)
		{
		document.getElementById("discount_info").innerHTML = "<font color=\"red\">商品折扣应该在0~1之间</font>";;
		points[2] = "0";
		return false;
		}
	else {
		document.getElementById("discount_info").innerHTML = "";
		points[2] = "1";
		return true;
	}
}
//检查商品介绍;
function checkProductDesc() {
	var product_desc = document.getElementById("product_desc").value;
	if (product_desc.length > 1000) {
		document.getElementById("product_desc_info").innerHTML = "<font color=\"red\">商品介绍过长</font>";
		points[3] = "0";
		return false;
	} else {
		document.getElementById("product_desc_info").innerHTML = "";
		points[3] = "1";
		return true;
	}
}

// 检查协议;
function checkagree() {
	if (document.getElementById("agree").checked) {

		document.getElementById("confirm").disabled = false;
		points[4] = "1";
	} else {
		document.getElementById("confirm").disabled = "disabled";
		points[4] = "0";

	}
}