const invreg = /is-invalid/;
const vreg = /is-valid/;
const cvreg = /valid/;

const editctitlepattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w ]){0,62}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;
const editccontentpattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w\s]){0,254}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;

var orictitle;
var orictitleclass;
var oriccontent;
var oriccontentclass;
var oriinvcnt;
var orifeedback;

var invcnt = 0;

function strremv(ori, sub){
	var ind = ori.indexOf(sub);
	if(ind > -1){
		if(ind == 0)
			return ori.substring(sub.length, ori.length);
		else
			return ori.substring(0, ind);
	}else
		return ori;
}
function bevalid(cinput, cnt){
	$(cinput).removeClass("is-invalid");
	$(cinput).addClass("is-valid");
	$(cinput).parent().parent().find(".myinvalid-feedback").text(strremv($(cinput).parent().parent().find(".myinvalid-feedback").text(), $(cinput).attr("data-invalid")));
	if($(cinput).parent().parent().find(".myinvalid-feedback").text()==''){
		//$(".erradd").text("");
		$(cinput).parent().parent().find(".myinvalid-feedback").hide();
		if(cnt == 0){
			$(cinput).parent().parent().find(".willnone").hide();
			$(cinput).parent().parent().find(".myvalid-feedback").show();
		}else{
			$(cinput).parent().parent().find(".willnone").show();
			$(cinput).parent().parent().find(".myvalid-feedback").hide();
		}
	}
}

function beinvalid(cinput){
	$(cinput).removeClass("is-valid");
	$(cinput).addClass("is-invalid");
	if($(cinput).parent().parent().find(".myinvalid-feedback").text().indexOf($(cinput).attr("data-invalid")) < 0)
		$(cinput).parent().parent().find(".myinvalid-feedback").text($(cinput).parent().parent().find(".myinvalid-feedback").text()+$(cinput).attr("data-invalid"));
	$(cinput).parent().parent().find(".myinvalid-feedback").show();
	$(cinput).parent().parent().find(".willnone").hide();
	$(cinput).parent().parent().find(".myvalid-feedback").hide();
}
function foreditctitle(){
	if(!editctitlepattern.test($("#editctitle").val())){
		if(vreg.test($("#editctitle").attr("class")) || !cvreg.test($("#editctitle").attr("class")))
			invcnt++;
		beinvalid($("#editctitle")[0]);
	}else{
		if(invreg.test($("#editctitle").attr("class")))
			invcnt--;
		bevalid($("#editctitle")[0], invcnt);
	}
	if(invcnt == 0)
		$("#editbtn").removeClass("disabled");
	else
		$("#editbtn").addClass("disabled");
}

function foreditccontent(){	
	if(!editccontentpattern.test($("#editccontent").val())){
		if(vreg.test($("#editccontent").attr("class")) || !cvreg.test($("#editccontent").attr("class")))
			invcnt++;
		beinvalid($("#editccontent")[0]);
	}else{
		if(invreg.test($("#editccontent").attr("class")))
			invcnt--;
		bevalid($("#editccontent")[0], invcnt);
	}
	if(invcnt == 0)
		$("#editbtn").removeClass("disabled");
	else
		$("#editbtn").addClass("disabled");
}

$(function(){
	orictitle = $("#editctitle").val();
	oriccontent = $("#editccontent").val();
	$("[data-toggle='tooltip']").tooltip();
	if(!editctitlepattern.test($("#editctitle").val())){
		invcnt++;
		if(invreg.test($("#editctitle").attr("class")))
			beinvalid($("#editctitle")[0]);
	}else if(vreg.test($("#editctitle").attr("class")))
		bevalid($("#editctitle")[0], invcnt);

	if(!editccontentpattern.test($("#editccontent").val())){
		invcnt++;
		if(invreg.test($("#editccontent").attr("class")))
			beinvalid($("#editccontent")[0]);
	}else if(vreg.test($("#editccontent").attr("class")))
		bevalid($("#editccontent")[0], invcnt);
	orictitleclass = $("#editctitle").attr("class");
	oriccontentclass = $("#editccontent").attr("class");
	orifeedback = $(".myinvalid-feedback").text();
	oriinvcnt = invcnt;

	if(invcnt == 0)
		$("#editbtn").removeClass("disabled");
	else
		$("#editbtn").addClass("disabled");

	$("#editctitle").change(foreditctitle);
	$("#editccontent").change(foreditccontent);
	$("#editctitle").keyup(foreditctitle);
	$("#editccontent").keyup(foreditccontent);
	$("#rstbtn").click(function(){
		if(confirm("你确定吗？")){
			$("#editctitle").val(orictitle);
			$("#editctitle").removeClass("is-valid");
			$("#editctitle").removeClass("is-invalid");
			$("#editccontent").val(oriccontent);
			$("#editccontent").removeClass("is-valid")
			$("#editccontent").removeClass("is-invalid");
			invcnt = oriinvcnt;
			$("#editctitle").attr("class", orictitleclass);
			$("#editccontent").attr("class", oriccontentclass);
			$(".myinvalid-feedback").text(orifeedback);
			if(orifeedback == ''){
				$(".myinvalid-feedback").hide();
				$(".willnone").show();
				$(".myvalid-feedback").hide();
			}
			if(invcnt == 0){
				$("#editbtn").removeClass("disabled");
			}else{
				$("#editbtn").addClass("disabled");
			}
		}
	});
});
