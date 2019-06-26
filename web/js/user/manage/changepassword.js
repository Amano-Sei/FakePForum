const invreg = /is-invalid/;
const vreg = /is-valid/;
const cvreg = /valid/;
const wrgreg = /wrongdesu/;

const checknamepage = "/PForum/checknameServlet";

var invcnt = 3;

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

function changeinvlast(cnt){
	$("#invlast").text(cnt);
	if(cnt == 0){
		$("#invlast").removeClass("badge-secondary");
		$("#invlast").removeClass("badge-danger");
		$("#invlast").addClass("badge-success");
		$("#tosubmit").prop("disabled", false);
		$("#tosubmit").removeClass("disabled");
	}else if(cnt <= 2){
		$("#invlast").removeClass("badge-danger");
		$("#invlast").removeClass("badge-success");
		$("#invlast").addClass("badge-secondary");
		$("#tosubmit").prop("disabled", true);
		$("#tosubmit").addClass("disabled");
	}else{
		$("#invlast").addClass("badge-danger");
		$("#invlast").removeClass("badge-success");
		$("#invlast").removeClass("badge-secondary");
		$("#tosubmit").prop("disabled", true);
		$("#tosubmit").addClass("disabled");
	}
}


function checkself(cinput){
	var cname = cinput.name;
	switch(cname){
		case "oriupassword":
			if(cinput.checkValidity()){
				if(!vreg.test($(cinput).attr("class")))
					invcnt--;
				bevalid(cinput);
			}else{
				if(vreg.test($(cinput).attr("class")))
					invcnt++;
				$(cinput).next().text("虽然还没有提交，但是我想你的密码一定是错的!");
				beinvalid(cinput);
			}
			changeinvlast(invcnt);
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
	}
}

$(function(){
	changeinvlast(invcnt);

	$("input").change(function(){checkself(this);});
	//$("input").keyup(function(){checkself(this);});
	//思考了下改成keyup体验不好,但是进一步细化代码可以改善体验...还是饶了我吧，本来这就是个半成品应该一天改好，现在第三天了...
	if(wrgreg.test($("#oriupassword").attr("class")))
		$("#oriupassword").next().text("密码错误!");

	$("button[type='reset']").click(function(event){
		event.preventDefault();
		$("#oriupassword").next().text("虽然还没有提交，但是我想你的密码一定是错的!");
		invcnt = 3;
		changeinvlast(invcnt);
		$("input").each(function(){
			$(this).val("");
			benullrequ(this);
		});
	});
});
