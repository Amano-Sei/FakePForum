const invreg = /is-invalid/;
const vreg = /is-valid/;
const cvreg = /valid/;
const hasreg = /hasdesu/;
const ubirthpattern = /^(19[0-9][0-9]|200[0-9]|201[0-8])-((?<=(19([02468][048]|[13579][26])|200[048]|201[26])-)02-29|02-([01][1-9]|10|2[0-8])|(0[13578]|10|12)-(0[1-9]|[12][0-9]|3[01])|(0[469]|11)-(0[1-9]|[12][0-9]|30))$/;
//哼哧哼哧熬夜吐血写了个正则，其实写的时候已经知道可以用Date了，但是为了加强正则的能力...还是手动哼哧哼哧了（
//虽然java这边一样可以直接用date，但是还是正则比较轻松诶
const uhobbypattern = /^([^\x00-\xff]|\w)([^\x00-\xff]|\w| ){0,58}([^\x00-\xff]|\w)$/;
const usignaturepattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w\s]){0,254}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;

const checknamepage = "/PForum/checknameServlet";

var invcnt = 0;

function bevalid(cinput){
	$(cinput).removeClass("is-invalid");
	$(cinput).addClass("is-valid");
	$("#a"+cinput.name).removeClass("list-group-item-light");
	$("#a"+cinput.name).removeClass("list-group-item-danger");
	$("#a"+cinput.name).addClass("list-group-item-success");
}

function beinvalid(cinput){
	$(cinput).addClass("is-invalid");
	$(cinput).removeClass("is-valid");
	$("#a"+cinput.name).removeClass("list-group-item-light");
	$("#a"+cinput.name).removeClass("list-group-item-success");
	$("#a"+cinput.name).addClass("list-group-item-danger");
}

function benullrequ(cinput){
	$(cinput).removeClass("is-invalid");
	$(cinput).removeClass("is-valid");
	$("#a"+cinput.name).removeClass("list-group-item-danger");
	$("#a"+cinput.name).removeClass("list-group-item-success");
	$("#a"+cinput.name).addClass("list-group-item-light");
}

function benull(cinput){
	$(cinput).removeClass("is-invalid");
	$(cinput).removeClass("is-valid");
	$("#a"+cinput.name).removeClass("list-group-item-danger");
	$("#a"+cinput.name).addClass("list-group-item-success");
}

function changeinvlast(cnt){
	$("#invlast").text(cnt);
	if(cnt == 0){
		$("#invlast").removeClass("badge-secondary");
		$("#invlast").removeClass("badge-danger");
		$("#invlast").addClass("badge-success");
		$("#tosubmit").prop("disabled", false);
		$("#tosubmit").removeClass("disabled");
	}else if(cnt <= 7){
		$("#invlast").removeClass("badge-danger");
		$("#invlast").removeClass("badge-success");
		$("#invlast").addClass("badge-secondary");
		$("#tosubmit").prop("disabled", true);
		$("#tosubmit").addClass("disabled");
	}else{
		$("#invlast").removeClass("badge-secondary");
		$("#invlast").removeClass("badge-success");
		$("#invlast").addClass("badge-danger");
		$("#tosubmit").addClass("disabled");
		$("#tosubmit").prop("disabled", true);
	}
}

//这里抽象化的最主要的原因是因为本来在提交的时候想重新检查一遍的
//但是事实上如果能够提交必然是因为用户进行了一些修改的原因
//虽然本着提高攻击的成本是可以做一下重新检查的
//但是终究防不住一心想突破客户端检查的人
//所以还是全权交给服务器检查吧（
//其实还漏一个省市县...但是现在不想做...等假期再做吧

function checkself(cinput){
	var cname = cinput.name;
	switch(cname){
		case "uname":
			if(!cinput.checkValidity()){
				$(cinput).next().text("用户名只能为5~16位的字母或下划线且只能以字母开头!");
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				changeinvlast(invcnt);
			}else{
				$.post(
					checknamepage,
					{"uname": cinput.value},
					function(result){
						if(0 <= result){
							$(cinput).next().text("用户名重复!");
							if(vreg.test($(cinput).attr("class")))
								invcnt++;
							beinvalid(cinput);
						}else if(-1 == result){
							if(!vreg.test($(cinput).attr("class")))
								invcnt--;
							bevalid(cinput);
						}
						changeinvlast(invcnt);
					}
				)
			}
			break;
		case "upassword":
			if(cinput.checkValidity()){
				if(!vreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
			}else{
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
			}
			if(cvreg.test($("#reupassword").attr("class"))){
				if($("#reupassword").val() == $(cinput).val()){
					if(!vreg.test($("#reupassword").attr("class")))
						invcnt--;
					bevalid($("#reupassword")[0]);
				}else{
					if(vreg.test($("#reupassword").attr("class")))
						invcnt++;
					beinvalid($("#reupassword")[0]);
				}
			}
			changeinvlast(invcnt);
			break;
		case "reupassword":
			if($(cinput).val() == $("#upassword").val()){
				if(!vreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
			}else{
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
			}
			changeinvlast(invcnt);
			break;
		case "unickname":
			if(!cinput.checkValidity()){
				$(cinput).next().text("昵称为2~16位的汉字或者字符或者下划线或者空格切不能以空格为开头或结尾!");
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				changeinvlast(invcnt);
			}else{
				$.post(
					checknamepage,
					{"unickname": cinput.value},
					function(result){
						if(0 <= result){
							$(cinput).next().text("昵称重复!");
							if(vreg.test($(cinput).attr("class")))
								invcnt++;
							beinvalid(cinput);
						}else if(-1 == result){
							if(!vreg.test($(cinput).attr("class")))
								invcnt--;
							bevalid(cinput);
						}
						changeinvlast(invcnt);
					}
				)
			}
			break;
		case "umail":
			if(cinput.checkValidity()){
				if(!vreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
				// $("#aumail").removeClass("text-danger");
				// $("#aumail").removeClass("border-danger");
				// $("#aumail").addClass("text-success");
				// $("#aumail").addClass("border-success");
			}else{
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				// $("#aumail").addClass("text-danger");
				// $("#aumail").removeClass("text-success");
				// $("#aumail").removeClass("border-success");
				// $("#aumail").addClass("border-danger");
			}
			changeinvlast(invcnt);
			break;
		case "usex":
			if(cinput.checkValidity()){
				if(!vreg.test($(cinput).attr("class")))
					invcnt--;
				$("input:radio").removeClass("is-invalid");
				$("input:radio").addClass("is-valid");
				$("#ausex").removeClass("list-group-item-light");
				$("#ausex").removeClass("list-group-item-danger");
				$("#ausex").addClass("list-group-item-success");
				// $("#ausex").removeClass("text-danger");
				// $("#ausex").removeClass("border-danger");
				// $("#ausex").addClass("text-success");
				// $("#ausex").addClass("border-success");
			}else{
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				$("input:radio").removeClass("is-invalid");
				$("input:radio").addClass("is-valid");
				$("#ausex").removeClass("list-group-item-light");
				$("#ausex").removeClass("list-group-item-success");
				$("#ausex").addClass("list-group-item-danger");
				// $("#ausex").addClass("text-danger");
				// $("#ausex").removeClass("text-success");
				// $("#ausex").removeClass("border-success");
				// $("#ausex").addClass("border-danger");
			}
			changeinvlast(invcnt);
			break;
		case "uagree":
			if(cinput.checkValidity()){
				if(!vreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
				// $("#auagree").removeClass("text-danger");
				// $("#auagree").removeClass("border-danger");
				// $("#auagree").addClass("text-success");
				// $("#auagree").addClass("border-success");
			}else{
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				// $("#auagree").addClass("text-danger");
				// $("#auagree").removeClass("text-success");
				// $("#auagree").removeClass("border-success");
				// $("#auagree").addClass("border-danger");
			}
			changeinvlast(invcnt);
			break;
		case "uprofile":
			$(cinput).next().text(!$(cinput)[0].files||$(cinput)[0].files.length==0 ? "上传头像..." : $(cinput)[0].files[0].name);
			$(cinput).parent().addClass("mb-4");
			if(!$(cinput)[0].files || $(cinput)[0].files.length==0){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				benull(cinput);
			}else if(($(cinput)[0].files[0].name.endsWith(".jpg") && $(cinput)[0].files[0].size <= 1048576)){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
				// $("#auprofile").removeClass("text-danger");
				// $("#auprofile").removeClass("border-danger");
				// $("#auprofile").addClass("text-success");
				// $("#auprofile").addClass("border-success");
			}else{
				if(!invreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				// $("#auprofile").addClass("text-danger");
				// $("#auprofile").removeClass("text-success");
				// $("#auprofile").removeClass("border-success");
				// $("#auprofile").addClass("border-danger");
			}
			changeinvlast(invcnt);
			break;
		case "ubirth":
			//var tbirth = new Date($("#ubirth").val());
			//想了下还是正则比较方便诶...
			//然后发觉好像这个chrome下没必要...
			var sbirth = $(cinput).val();
			if(sbirth == ''){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				benull(cinput);
			}else if(ubirthpattern.test(sbirth)){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
				// $("#aubirth").removeClass("text-danger");
				// $("#aubirth").removeClass("border-danger");
				// $("#aubirth").addClass("text-success");
				// $("#aubirth").addClass("border-success");
			}else{
				if(!invreg.test($(cinput).attr("class")))
					invcnt++;beinvalid(cinput);
				// $("#aubirth").addClass("text-danger");
				// $("#aubirth").removeClass("text-success");
				// $("#aubirth").removeClass("border-success");
				// $("#aubirth").addClass("border-danger");
			}
			changeinvlast(invcnt);
			break;
		case "uhobby":
			var shobby = $(cinput).val();
			if(shobby == ''){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				benull(cinput);
			}else if(uhobbypattern.test(shobby)){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
				// $("#auhobby").removeClass("text-danger");
				// $("#auhobby").removeClass("border-danger");
				// $("#auhobby").addClass("text-success");
				// $("#auhobby").addClass("border-success");
			}else{
				if(!invreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				// $("#auhobby").addClass("text-danger");
				// $("#auhobby").addClass("border-danger");
				// $("#auhobby").removeClass("text-success");
				// $("#auhobby").removeClass("border-success");
			}
			changeinvlast(invcnt);
			break;
		case "usignature":
			var ssignature = $(cinput).val();
			if(ssignature == ''){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				benull(cinput);
			}else if(usignaturepattern.test(ssignature)){
				if(invreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
				// $("#ausignature").removeClass("text-danger");
				// $("#ausignature").removeClass("border-danger");
				// $("#ausignature").addClass("text-success");
				// $("#ausignature").addClass("border-success");
			}else{
				if(!invreg.test($(cinput).attr("class")))
					invcnt++;
				beinvalid(cinput);
				// $("#ausignature").addClass("text-danger");
				// $("#ausignature").removeClass("text-success");
				// $("#ausignature").removeClass("border-success");
				// $("#ausignature").addClass("border-danger");
			}
			changeinvlast(invcnt);
			break;
	}
}

$(function(){
	$("input").each(function(){
		if($($(this)).attr("required")){
			if(!vreg.test($(this).attr("class"))){
				invcnt++;
				if(hasreg.test($(this).attr("class")))
					$(this).next().text($(this).attr("id")=='uname'?"用户名重复!":"昵称重复!");
			}
		}else{
			if(invreg.test($(this).attr("class")))
				invcnt++;
		}
	});
	if(!$(":radio")[0].checkValidity())
		invcnt -= 2;
	changeinvlast(invcnt);

	$("input[type='checkbox']").change(function(){ checkself(this); })
	//$("input[required]").blur(function(){ checkself(this); })
	//斟酌了下这个还是不要的好，个人不喜欢失去焦点就检查
	$("input[type!='radio']").change(function(){checkself(this);});
	//事实证明change要保留...
	$("input[type!='radio'][type!='checkbox'][type!='file']").keyup(function(){checkself(this);});

	$("input:radio").click(function(){checkself(this);});

	// $("#usignature").blur(function(){checkself(this);});
	$("#usignature").keyup(function(){checkself(this);});

	$("button[type='reset']").click(function(event){
		event.preventDefault();
		invcnt = 7;
		changeinvlast(invcnt);
		$("input[type!='radio'][type!='checkbox'][required]").each(function(){
			$(this).val("");
			benullrequ(this);
		});
		$("input[type='radio'], input[type='checkbox']").each(function(){
			$(this).prop("checked", false);
			benullrequ(this);
		});
		$(".optionallist input").each(function(){
			benull(this);
			$(this).val("");
		});
		benull($("#usignature")[0]);
		$("#usignature").text("");
		$("#uprofile").next().text("上传头像...");
	});
});
