function prom()
{
    var name=prompt("请输入您的名字","");//将输入的内容赋给变量 name ，
    //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
   if(name)//如果返回的有内容
   {
       alert("欢迎您："+ name)
    }
}