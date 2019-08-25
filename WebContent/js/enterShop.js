function firm() {
	if (confirm("确认删除该商店以及该商店下的所有商品？\n删除后不可恢复，请谨慎处理！")) {
		return true;
	} else
		return false;
}

function firmDelProduct() {
	if (confirm("确认删除该商品？\n删除后不可恢复，请谨慎处理！")) {
		return true;
	} else
		return false;
}