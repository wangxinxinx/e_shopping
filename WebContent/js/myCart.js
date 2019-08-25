function firm() {
	if (confirm("确认要删除该商品吗？")) {
		return true;
	} else
		return false;
}

function selectall() {
	var checkAllBox = document.getElementById('selectAll');
	var checkboxs = document.getElementsByName('checkBox');
	var totalPrice = document.getElementsByName('total_price');

	var count = 0;
	var total = 0;

	for (var i = 0; i < checkboxs.length; i++) {
		checkboxs[i].checked = checkAllBox.checked;
		if (checkboxs[i].checked) {
			count++;
			total += parseFloat(totalPrice[i].value);
		}
	}

	document.getElementById('pro_count').innerHTML = count;
	document.getElementById('total').innerHTML = total.toFixed(2);
	document.getElementById('totalInput').value = total;
}

function clickCheckBox() {
	var checkAllBox = document.getElementById('selectAll');
	var checkboxs = document.getElementsByName('checkBox');
	var totalPrice = document.getElementsByName('total_price');

	var count = 0;
	var total = 0;
	for (var i = 0; i < checkboxs.length; i++) {
		if (checkboxs[i].checked) {
			count++;
			total += parseFloat(totalPrice[i].value);
		}
	}
	// alert(count);
	// alert(total);

	document.getElementById('pro_count').innerHTML = count;
	document.getElementById('total').innerHTML = total.toFixed(2);
	document.getElementById('totalInput').value = total;

}

function deleteCarts() {
	var checkboxs = document.getElementsByName('checkBox');
	var cids = "";

	for (var i = 0; i < checkboxs.length; i++) {
		if (checkboxs[i].checked) {
			if (cids == "")
				cids += checkboxs[i].value;
			else
				cids += "," + checkboxs[i].value;
		}
	}

	if (cids == "") {
		alert("请选择商品");
	}
	else if (confirm("确认要删除这些商品吗？")) {
		window.location.href = "deleteCarts.jsp?cids=" + cids;
	}
}