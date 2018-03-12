(function($) {

	$.WebUI = {
		/***********************************************************************
		 **********************************************************************/
		Loading : function(showCloseBtn) {
			$.dialog({
				title : "",
				content : "<div class='myLoading' style='width:60px;height:60px;'></div>",
				id : "WebUILoading",
				lock : true,
				opacity : 0.2, 
				esc : false,
				padding : "0px",
				drag : false,
				resize : false,
				init : function() {
					if (!showCloseBtn || showCloseBtn && showCloseBtn == false) {
						$(".aui_close").hide();
					}
				},
				fixed : true
			});
		},
		/***********************************************************************
		 **********************************************************************/
		UnLoading : function() {
			// $(".aui_close").show();
			if ($.dialog.list['WebUILoading'] == undefined) {
				return;
			} else {
				$.dialog.list['WebUILoading'].close();
			}
		},

	};
})(jQuery);
