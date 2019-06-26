const invreg = /is-invalid/;
const vreg = /is-valid/;
const cvreg = /valid/;

const addctitlepattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w ]){0,62}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;
const addccontentpattern = /^([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w\s]){0,254}([^\x00-\xff]|[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w])$/;

var invcnt = 0;
var cedit = null;
var einvcnt = 0;

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

	function foreditctitle(){
		if(!addctitlepattern.test($("#editctitle").val())){
			if(vreg.test($("#editctitle").attr("class")) || !cvreg.test($("#editctitle").attr("class")))
				einvcnt++;
			beinvalid($("#editctitle")[0]);
		}else{
			if(invreg.test($("#editctitle").attr("class")))
				einvcnt--;
			bevalid($("#editctitle")[0], einvcnt);
		}
		if(einvcnt == 0)
			$("#editbtn").removeClass("disabled");
		else
			$("#editbtn").addClass("disabled");
	}

	function foreditccontent(){	
		if(!addccontentpattern.test($("#editccontent").val())){
			if(vreg.test($("#editccontent").attr("class")) || !cvreg.test($("#editccontent").attr("class")))
				einvcnt++;
			beinvalid($("#editccontent")[0]);
		}else{
			if(invreg.test($("#editccontent").attr("class")))
				einvcnt--;
			bevalid($("#editccontent")[0], einvcnt);
		}
		if(einvcnt == 0)
			$("#editbtn").removeClass("disabled");
		else
			$("#editbtn").addClass("disabled");
	}

	function foreditbtn(){
		/*if(cedit == null){

		}*/
		if(cedit != null){
			cedit.html(decodeURIComponent(cedit.find("#cancelbtn").attr("data-ori")));
			cedit.find("button.myeditbtn").click(foreditbtn);
		}
		cedit = $(this).parent().parent().parent();
		einvcnt = 0;
		cedit.html('<form class="mycard" action="/PForum/content/editServlet?from=list" method="post"><div class="mycard-header"><input type="hidden" id="editcid" name="editcid" class="form-control" value="'+$(this).attr("data-cid")+'" required><input type="text" id="editctitle" name="editctitle" placeholder="新标题" data-invalid="标题为2~64个字符，且不能以空格开头或结尾！"  class="form-control" value="'+cedit.find(".mycard-title").text()+'" required></div><div class="mycard-body"><textarea placeholder="新内容" id="editccontent" name="editccontent" data-invalid="内容为2~256个字符，且不能以空格开头或结尾！" class="form-control" required>'+cedit.find(".mycard-text").text()+'</textarea></div><div class="mycard-footer"><div class="willnone">快速修改</div><div class="myinvalid-feedback"></div><div class="myvalid-feedback">nice</div><button type="submit" id="editbtn" class="btn btn-outline-primary">确定</button><button type="button" id="cancelbtn" data-ori=\''+encodeURIComponent(cedit.html())+'\' class="btn btn-outline-warning">取消</button></div></form>');

		$("#editctitle").change(foreditctitle);
		$("#editccontent").change(foreditccontent);
		$("#editctitle").keyup(foreditctitle);
		$("#editccontent").keyup(foreditccontent);
		// $("#editctitle").blur(foreditctitle);
		// $("#editccontent").blur(foreditccontent);
		$("#cancelbtn").click(function(){
			cedit.html(decodeURIComponent($(this).attr("data-ori")));
			cedit.find("button.myeditbtn").click(foreditbtn);
			cedit = null;
		});
	}
	//居然要递归...
	$("button.myeditbtn").click(foreditbtn);
});
