const unamepattern = /^[a-zA-Z]\w{4,15}$/;
const upasswordpattern = /^[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w]{8,20}$/;

$(function(){
	$(".form-signin").submit(function(){
		if(!unamepattern.test($("#uname").val())){
			alert("用户名只能为5~16位的字母或下划线且只能以字母开头");
			$("#uname").focus();
			return false;
		}
		if(!upasswordpattern.test($("#upassword").val())){
			alert("密码只能为8~20位的+!@#$%^&/?><,()[]{}.*-=_\\字母");
			$("#upassword").focus();
			return false;
		}
		return true;
	});
});
