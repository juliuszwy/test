 function menuSkip(obj,icon){
  		var url = $(obj).attr("url");
  		var headFirstTest = $(obj).find("span").html();
  		$(".breadcrumb").empty();
  		$(".breadcrumb").html("<li ><i class=\"ace-icon "+icon+"\"></i></li><li class=\"active\" url=\""+url+"\" onclick=\"menuReturn(this)\"><span class=\"\">"+headFirstTest+"</span></li>");
  		$(".nav-list").find("li").removeClass("active");
  		var pli = $(obj).parent("li");
  		pli.addClass("active");
 		
  		while(pli.parent().hasClass("submenu")){
  			pli.parent().parent().addClass("active");
  			pli = pli.parent().parent();
  		}
  		menuAjax(url);
 }
function menuReturn(obj){
  		var clas = $(obj).attr('class');
  		if(clas==""||typeof(clas)=="undefined"){
  			$(obj).nextAll('li').remove();
  			$(obj).addClass("active");
  			$(obj).find("span").removeClass();
  			menuAjax($(obj).attr("url"));
  		}
}

function menuAjax(url){
	$("#dataDiv").empty();
	$
	.ajax({
		url : url,
		type : 'get',
		success : function(result) {
			$("#dataDiv").html(result);
		},
		error : function(result) {
			
		},
		complete : function(result) {
		}
	});
}
function rechange(){
	$(".breadcrumb").empty();
	$(".breadcrumb").html("<li ><i class=\"ace-icon fa fa-home home-icon\"></i></li><li class=\"active\"><span>卡片充值</span></li>");
	menuAjax('/order/product');
}
function insideSkip(i,name,url){
	var li = $(".breadcrumb li:eq("+i+")");
	li.removeClass("active");
	li.find("span").addClass("blue");
	$(".breadcrumb").append("<li class=\"active\" url=\""+url+"\" onclick=\"menuReturn(this)\"><span class=\"\">"+name+"</span></li>");
	menuAjax(url);
}

function initFileInput(ctrlName, uploadUrl,fileNameId) {    
    var control = $('#' + ctrlName); 
    var valInput = $('#' + fileNameId);
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        showRemove : false,
        browseClass: "btn btn-primary", //按钮样式             
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    }).on("fileuploaded", function(event, data) {
	    if(data.response.status=="SUCCESS")
	    {
	        valInput.val(data.response.fileName);
	    };
    }).on("filebatchselected", function(event, files) {
        $(this).fileinput("upload");
    }).on('filesuccessremove', function(event, id) {
    	valInput.val("");
     });
    $(".fileinput-remove").remove();
 }

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}