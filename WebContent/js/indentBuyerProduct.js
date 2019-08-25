function confirmDelete() {
	if (confirm("确认删除该订单？\n删除后不可请求退款，请谨慎处理！")) {
		return true;
	} else
		return false;
}