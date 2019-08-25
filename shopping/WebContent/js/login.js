/**
 * 
 */
function check(form) {
		//document.forms.form1.username.value取得form1中Username的值 并判断是否为空
		if (document.forms.LoginForm.uname.value == "") {
			//如果 为""则弹出提示
			alert("请输入用户名！");
			//将输入焦点定位到没有输入的地方
			document.forms.LoginForm.uname.focus();
			//返回错误
			return false;
		}
		if (document.forms.LoginForm.upwd.value == "") {
			alert("请输入密码！");
			document.forms.LoginForm.upwd.focus();
			return false;
		}
	}