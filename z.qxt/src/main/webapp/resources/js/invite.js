var appArgs = '', link = false;
if(location.search){
	appArgs = '?'+location.search.replace('?','');
}

if(location.pathname.slice(-9).toLowerCase()==='link.html'){
	link = true;
}

// 是否是安卓
function isAndroid() {
	var u = navigator.userAgent;
	if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) { //安卓手机
		return true;
	}
	return false;
}

function isIOS(){
	var u = navigator.userAgent;
	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
	return isiOS;
}
function isRunOnWeChat(){
	var ua = navigator.userAgent.toLowerCase();  
    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
        return true;  
    } else {  
        return false;  
    }  
}
$(document).ready(function(){
	initialize();
	function initialize(){
		if(true == isIOS()){
			$('#download-tip').removeClass("common-hide");
			$('.common-ios').removeClass('common-hide');
			//$('.down-ios').attr('href',setup.iosLink);
			$('.down-ios').hide();
			if(link){
				$('.open-ios').attr('href',setup.iosOpen+appArgs);
				$('#download-ios').on('click',function(e){
					setTimeout(function(){
						location.href = setup.iosLink;
					},1000);
				});
			}else{
				$('.open-ios').attr('href',setup.appLink+appArgs);
			}
			//setupLink('.open-ios','shmj11000://?'+appArgs);
		}else if(true == isAndroid()){
			$('.common-android').removeClass('common-hide');
			$('.down-android').attr('href',setup.androidLink);
			$('.open-android').attr('href',setup.androidOpen+appArgs);
			//setupLink('.open-android','shmj11000://?'+appArgs);
		}else{
			$('.common-pc').removeClass('common-hide');
			$('.common-non-pc').addClass('common-hide');
			$('.down-pc').attr('href',setup.pcLink);
			new QRCode(document.getElementById('download-qrcode'),location.href);
		}
		// 如果在微信中打开，直接弹遮罩
		if(true == isRunOnWeChat()){
			if(isAndroid() || link){
				$('#mask').removeClass("common-hide");
			}
		}
	}
	/*$('#download-android').on('click', function(e){
		if(true == isRunOnWeChat()){
			e.preventDefault();
			$('#mask').removeClass("common-hide");
		}				
	});
	$('#download-ios').on('click', function(e){
		if(true == isRunOnWeChat()){
			e.preventDefault();
			$('#mask').removeClass("common-hide");
		}				
	});
	$('#download-pc').on('click', function(){
		//alert("在手机中浏览器中打开点击“立即下载”，将会自动下载安装包。");
		$('.hp-download .common-android').click();
	});
	$('#mask').on('click', function(){
		//$('#mask').addClass("common-hide");
	});*/
});