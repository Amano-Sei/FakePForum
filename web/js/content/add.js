const invreg = /is-invalid/;
const vreg = /is-valid/;
const cvreg = /valid/;

const addctitlepattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w ]){0,62}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;
const addccontentpattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w\s]){0,254}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;

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

function foraddctitle(){
	if(!addctitlepattern.test($("#addctitle").val())){
		if(vreg.test($("#addctitle").attr("class")))
			invcnt++;
		beinvalid($("#addctitle")[0]);
	}else{
		if(!vreg.test($("#addctitle").attr("class")))
			invcnt--;
		bevalid($("#addctitle")[0], invcnt);
	}
	if(invcnt == 0)
		$("#addbtn").removeClass("disabled");
	else
		$("#addbtn").addClass("disabled");
}

function foraddccontent(){	
	if(!addccontentpattern.test($("#addccontent").val())){
		if(vreg.test($("#addccontent").attr("class")))
			invcnt++;
		beinvalid($("#addccontent")[0]);
	}else{
		if(!vreg.test($("#addccontent").attr("class")))
			invcnt--;
		bevalid($("#addccontent")[0], invcnt);
	}
	if(invcnt == 0)
		$("#addbtn").removeClass("disabled");
	else
		$("#addbtn").addClass("disabled");
}

$(function(){
	$("[data-toggle='tooltip']").tooltip();
	if(!addctitlepattern.test($("#addctitle").val())){
		invcnt++;
		if(invreg.test($("#addctitle").attr("class")))
			beinvalid($("#addctitle")[0]);
	}else if(vreg.test($("#addctitle").attr("class")))
		bevalid($("#addctitle")[0], invcnt);

	if(!addccontentpattern.test($("#addccontent").val())){
		invcnt++;
		if(invreg.test($("#addccontent").attr("class")))
			beinvalid($("#addccontent")[0]);
	}else if(vreg.test($("#addccontent").attr("class")))
		bevalid($("#addccontent")[0], invcnt);

	if(invcnt == 0)
		$("#addbtn").removeClass("disabled");
	else
		$("#addbtn").addClass("disabled");

	$("#addctitle").change(foraddctitle);
	$("#addccontent").change(foraddccontent);
	$("#addctitle").keyup(foraddctitle);
	$("#addccontent").keyup(foraddccontent);
	$("#rstbtn").click(function(){
		if(confirm("你确定吗？")){
			$("#addctitle").val("");
			$("#addctitle").removeClass("is-valid");
			$("#addctitle").removeClass("is-invalid");
			$("#addccontent").val("");
			$("#addccontent").removeClass("is-valid")
			$("#addccontent").removeClass("is-invalid");
			invcnt = 2;
			$("#addbtn").addClass("disabled");
		}
	});
});