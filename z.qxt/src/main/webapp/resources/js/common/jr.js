(function($) {
	$.fn
			.extend({
				jrTabs : function(operParam) {

					function init() {
						if (operParam.floatType == 'left') {
							thisObject
									.append('<div class="tabs-wrap"><ul class="tabs"></ul></div>');
						} else {
							thisObject
									.append('<div class="tabs-wrap"><ul class="tabs-right"></ul></div>');
						}
						for ( var index = 0; index < operParam.data.length; index++) {
							if (operParam.data[index].id === undefined
									|| operParam.data[index].id === null
									|| operParam.data[index].id == '') {
								operParam.data[index].id = "jrTabs_"
										+ (new Date().getTime()) + index;
							}
							addTab(operParam.data[index]);
						}
						if (operParam.floatType == 'left') {
							thisObject.find('.tabs-wrap').find('.tabs-data')
									.hide();
						} else {
							thisObject.find('.tabs-wrap').find(
									'.tabs-right-data').hide();
						}
						thisObject.find('.tabs-wrap').find(
								'li:eq(' + operParam.initSelect + ')').click();
					}

					function addTab(tabParamData) {
						var ul = thisObject.find('.tabs-wrap').find('ul');
						var operParamData = jQuery.extend({
							id : '',
							title : '',
							url : '',
							value : '',
							data : {},
							needRequest : true,
							customRequest : false,
							click : function() {
								return;
							},
							completeCallback : function() {
								return;
							},
							requestSuccessCallback : function() {
								return;
							}
						}, tabParamData);

						$("<li linkUrl=\"" + operParamData.url + "\"></li>")
								.bind(
										'click',
										function() {
											var operParamDataTemp = operParamData;
											if (operParamDataTemp.click) {
												operParamDataTemp
														.click(operParamDataTemp.value);
											}
											jrTabsClick(this,
													operParamDataTemp,
													operParam);
										}).append(
										"<div class=\"tabs-inner\"><span class=\"tabs-title\">"
												+ operParamData.title
												+ "</span></div>").appendTo(ul);
						if (operParam.floatType == 'left') {
							thisObject.find('.tabs-wrap').append(
									"<div id=\"" + operParamData.id
											+ "\" class=\"tabs-data\"></div>");
							thisObject.find('.tabs-wrap').find('.tabs-data')
									.css(operParam.style);
						} else {
							thisObject
									.find('.tabs-wrap')
									.append(
											"<div id=\""
													+ operParamData.id
													+ "\" class=\"tabs-right-data\"></div>");
							thisObject.find('.tabs-wrap').find(
									'.tabs-right-data').css(operParam.style);
						}
					}

					function jrTabsClick(obj, operParamData, operParam) {
						var dataDiv = $('#' + operParamData.id);
						if (!dataDiv.is(":hidden")) {
							return;
						}

						var linkUrl = $(obj).attr('linkUrl');
						var ul = $(obj).parent();
						ul.find('.tabs-selected').removeAttr('class');
						$(obj).addClass('tabs-selected');

						var tabsWrap = ul.parent();
						tabsWrap.children().each(function() {
							$(this).hide();
						});
						ul.show();
						dataDiv.show();

						if (operParam.eachRequest) {
							tabsWrap.find('.tabs-data').empty();
							tabsWrap.find('.tabs-right-data').empty();
						}

						var needRequest = operParam.eachRequest;
						if ($.trim(dataDiv.html()) == '') {
							needRequest = true;
						}

						if (linkUrl !== undefined && linkUrl != ''
								&& needRequest && operParamData.needRequest) {
							if (operParamData.customRequest) {
								operParamData.customRequest('#' + operParamData.id, linkUrl);
							} else {
								$('#' + operParamData.id)
										.jrAjax(
												{
													url : linkUrl,
													data : operParamData.data,
													newdLoading : true,
													resultAutoProcess : operParam.autoProcess,
													successCallback : function(
															result) {
														if (operParam.completeCallback) {
															operParam
																	.completeCallback(
																			obj,
																			dataDiv,
																			result);
														}
														if (operParam.requestSuccessCallback) {
															operParam
																	.requestSuccessCallback(
																			operParamData.value,
																			obj,
																			dataDiv,
																			result);
														}
													}
												});
							}
						} else {
							if (operParam.completeCallback) {
								operParam.completeCallback(obj, dataDiv);
							}
						}
					}

					operParam = jQuery.extend({ 
						data : [],
						eachRequest : false,
						initSelect : 0,
						autoProcess : true,
						floatType : 'left',
						style : {},
						completeCallback : function() {
							return;
						},
						requestSuccessCallback : function() {
							return;
						}
					}, operParam || {});
					var thisObject = this;
					init();
				}
			});

	$.fn
			.extend({
				jrAjax : function(operParam) {
					function getParam() {

						if (operParam.autoGetParam == true) {
							thisObject
									.find(
											":hidden,:text,:password,select,textarea")
									.each(
											function() {
												if ($(this).attr("name")
														&& $(this).attr("name") != ''
														&& $
																.trim($(this)
																		.val()) != '') {
													operParam.data[$(this)
															.attr("name")] = $( 
															this).val();
												}
											});
							thisObject
									.find(":checkbox,:radio")
									.each(
											function() {
												if ($(this).attr("name")
														&& $(this).attr("name") != ''
														&& $
																.trim($(this)
																		.val()) != ''
														&& this.checked == true) {
													if (operParam.url
															.indexOf("?") == -1) {
														operParam.url += "?"
																+ $(this).attr(
																		"name")
																+ "="
																+ $(this).val();
													} else {
														operParam.url += "&"
																+ $(this).attr(
																		"name")
																+ "="
																+ $(this).val();
													}
												}
											});
						} else if (operParam.data === undefined
								|| operParam.data === null
								|| operParam.data === "") {
							operParam.data = {};
						}
					}

					function loadingOpen() {
						if (operParam.newdLoading) {
							if (operParam.loadingType == 'full') {
								var height = operParam.container.innerHeight();
								var width = operParam.container.innerWidth();
								var childrenWidth = $(
										operParam.container.children().get(0))
										.innerWidth();
								if (childrenWidth > width) {
									width = childrenWidth;
								}
								operParam.container
										.append("<div class=\"fullLoadingWarp\"><div class=\"fullLoadingBg\"  style=\"width:"
												+ width
												+ "px;height:"
												+ height
												+ "px;\"></div><div class=\"fullLoading\" style=\"width:"
												+ width
												+ "px;height:"
												+ height
												+ "px;line-height:"
												+ height
												+ "px\"><span>"
												+ operParam.loadingText
												+ "</span></div></div>");
							} else {
								operParam.container.empty();
								operParam.container
										.html("<div class='loading'><div><span><img src='resources/images/loading.gif' /></span>"
												+ operParam.loadingText
												+ "</div></div>");
							}
						}
					}

					function loadingClose() {
						if (operParam.newdLoading) {
							if (operParam.loadingType == 'full') {
								operParam.container.find('.fullLoadingWarp')
										.remove();
							} else {
								operParam.container.find('.loading').remove();
							}
						}
					}

					function exec() {

						loadingOpen();

						getParam();

						$
								.ajax({
									url : operParam.url,
									type : 'post',
									data : operParam.data,
									beforeSend : function() {
										operParam.beforeSend();
										return true;
									},
									success : function(result) {
										if (operParam.resultAutoProcess) {
											if (result == '1') {
												$.message.alert('info', '提示信息',
														'操作成功');
											} else if (result == '2') {
												$.message.alert('info', '提示信息',
														'操作失败');
												
											} else if (result == '3') {
												$.message.alert('info', '提示信息',
														'已经存在');
												
											}
												if(result!=2&&result!=3){
													operParam.container.empty();
													operParam.container.html(result);
												}else{
													loadingClose();
												}
											
										} else {
											loadingClose();
										}
										operParam.successCallback(result);
									},
									error : function(result) {
										loadingClose();
										operParam.errorCallback(result);
									},
									complete : function(result) {
										operParam.completeCallback(result);
									}
								});
					}

					operParam = jQuery.extend({
						url : '',
						data : {},
						container : '',
						autoGetParam : true,
						resultAutoProcess : true,
						newdLoading : false,
						loadingType : 'noBg',
						loadingText : '数据加载中…?',
						beforeSend : function() {
						},
						successCallback : function() {
						},
						errorCallback : function() {
						},
						completeCallback : function() {
						}
					}, operParam || {});
					var thisObject = this;
					if (operParam.container == '') {
						operParam.container = thisObject;
					} else {
						operParam.container = $(operParam.container);
					}
					exec();
				}
			});

	$.fn
			.extend({
				jrDialog : function(oper, operParam) {

					function init() {
						var divId = thisObject.attr('id');
						var thisHtml = thisObject.html();
						var needReload = true;
						var divWindow = $("div[id='" + divId + "']");
						if (divWindow.length >= 2) {
							divWindow.each(function() {
								if ($(this).attr('class') == 'panel-window') {
									$(this).remove();
									$('#panel-window_' + divId).remove();
								} else {
									thisObject = $(this);
								}
							});
						}
						if (thisObject.attr('class') == 'panel-window'
								&& operParam.url == '') {
							needReload = false;
						}
						openDiv(divId, thisHtml, needReload);
					}

					function openDiv(divId, thisHtml, needReload) {
						var fullHeight = $(document).height();
						var windowsHeight = $(window).height();
						var windowsWeight = $(window).width();
						var scrollTop = $(document).scrollTop();
						var zIndex = $.fn.jrDefaults.zIndex++;
						var width = operParam.width.replace('px', "");
						var height = operParam.height.replace('px', "");
						var dialogDivTop = scrollTop + 150;
						var halfWindowsHeight = windowsHeight / 2;
						if (halfWindowsHeight <= height) {
							if (height >= windowsHeight) {
								dialogDivTop = scrollTop;
							} else {
								dialogDivTop = scrollTop
										+ (windowsHeight - height) / 2;
							}
						}

						if (needReload == false) {
							$('#panel-window_' + divId).css({
								'width' : windowsWeight + 'px',
								'height' : fullHeight + 'px'
							});
							$('#panel-window_' + divId).show();
							thisObject.css({
								'top' : dialogDivTop + 'px'
							});
							thisObject.show();
							var bodyDiv = thisObject.find('.panel-body');
							if (operParam.completeCallback) {
								operParam.completeCallback(bodyDiv);
							}
							return;
						}

						thisObject.remove();
						$('#panel-window_' + divId).remove();
						var fullWindow = $(
								"<div id=\"panel-window_"
										+ divId
										+ "\" class=\"full-window\" style=\"z-index:"
										+ zIndex + "; width:" + windowsWeight
										+ "px; height:" + fullHeight
										+ "px\"></div>").appendTo("body");
						zIndex = $.fn.jrDefaults.zIndex++;
						thisObject = $(
								"<div id=\""
										+ divId
										+ "\" class=\"panel-window\" style=\"width: "
										+ width + "px; height:" + height
										+ "px; left:"
										+ ((windowsWeight - width) / 2)
										+ "px; top:" + dialogDivTop
										+ "px; z-index:" + zIndex + "\"></div>")
								.appendTo("body");
						var header = $("<div class=\"panel-header\"></div>")
								.appendTo(thisObject);
						if (operParam.needClose) {
							var tool = $("<div class=\"tool\"></div>")
									.appendTo(header);
							$(
									"<a href=\"javascript:void(0)\" class=\"panel-close\"></a>")
									.bind("click", function() {
										if (operParam.closeCallback) {
											operParam.closeCallback();
										}
										thisObject.hide();
										fullWindow.hide();
									}).appendTo(tool);
						}
						header.append($(
								"<div class=\"title\">" + operParam.title
										+ "</div>").bind('mousedown',
								function(event) {
									messageMoveEvent(this, event);
								}));

						var bodyDiv = $(
								"<div class=\"panel-body\" style=\"height:"
										+ (height - 43) + "px\"></div>")
								.appendTo(thisObject);
						if (operParam.url != '') {
							bodyDiv.empty();
							bodyDiv.jrAjax({
								url : operParam.url,
								data : operParam.data,
								autoGetParam : true,
								resultAutoProcess : true,
								newdLoading : true,
								loadingType : 'full',
								completeCallback : function() {
									if (operParam.completeCallback) {
										operParam.completeCallback(bodyDiv);
									}
								}
							});
						} else {
							bodyDiv.html(thisHtml);
							if (operParam.completeCallback) {
								operParam.completeCallback(bodyDiv);
							}
						}
					}

					var thisObject = this;

					if (oper == 'clear') {
						thisObject
								.find(":hidden,:text,:password,select,textarea")
								.each(
										function() {
											if ($(this).attr("name")
													&& $(this).attr("name") != ''
													&& $.trim($(this).val()) != '') {
												$(this).val('');
											}
										});
					} else if (oper == 'close') {
						var divId = thisObject.attr('id');
						thisObject.hide();
						$('#panel-window_' + divId).hide();
					} else {
						operParam = jQuery.extend({
							url : '',
							title : '',
							width : '800',
							height : '200',
							data : {},
							needClose : true,
							closeCallback : function() {

							},
							completeCallback : function() {

							}
						}, operParam || {});
						init();
					}
				}
			});

	$.message = {
		alert : function(icon, title, msg, fn) {
			var div = "<div class=\"txt\">" + msg + "</div>";
			switch (icon) {
			case "error":
				div = "<div class=\"message-icon message-error\"></div>" + div;
				break;
			case "info":
				div = "<div class=\"message-icon message-info\"></div>" + div;
				break;
			case "question":
				div = "<div class=\"message-icon message-question\"></div>"
						+ div;
				break;
			case "warn":
				div = "<div class=\"message-icon message-warn\"></div>" + div;
				break;
			}
			div += "<div style=\"clear:both;\"/>";
			var button = {};
			button[$.message.defaults.ok] = function() {
			};
			var win = openMesWin(title, div, button, fn);
			return win;
		},
		confirm : function(title, msg, fn) {
			var div = "<div class=\"message-icon message-question\"></div>"
					+ "<div class=\"txt\">" + msg + "</div>"
					+ "<div style=\"clear:both;\"/>";
			var button = {};
			button[$.message.defaults.ok] = function() {
			};
			button[$.message.defaults.cancel] = function() {
			};
			var win = openMesWin(title, div, button, fn);
			return win;
		}
	};
	$.message.defaults = {
		ok : "确　定",
		cancel : "取消"
	};

	$.fn.jrDefaults = $.extend({}, {
		zIndex : 10000
	});

	function openMesWin(title, div, button, fn) {
		var fullHeight = $(document).height();
		var windowsHeight = $(window).height();
		var windowsWeight = $(window).width();
		var scrollTop = $(document).scrollTop();
		var zIndex = $.fn.jrDefaults.zIndex++;

		var fullWindow = $(
				"<div class=\"full-window\" style=\"z-index:" + zIndex
						+ ";width:" + windowsWeight + "px;height:" + fullHeight
						+ "px;\"></div>").appendTo("body");
		zIndex = $.fn.jrDefaults.zIndex++;
		var messageWin = $(
				"<div class=\"message-window\" style=\"display: block; width: 288px; left:"
						+ ((windowsWeight - 288) / 2) + "px; top:"
						+ (scrollTop + 150) + "px; z-index:" + zIndex
						+ "\"></div>").appendTo("body");
		var header = $("<div class=\"message-header\"></div>").appendTo(
				messageWin);
		header.append($("<div class=\"title\">" + title + "</div>").bind(
				'mousedown', function(event) {
					messageMoveEvent(this, event);
				}));
		var tool = $("<div class=\"tool\"></div>").appendTo(header);
		$("<a href=\"javascript:void(0)\" class=\"message-close\"></a>").bind(
				"click", function() {
					messageWin.remove();
					fullWindow.remove();
					if (fn) {
						fn();
						return false;
					}
				}).appendTo(tool);

		var win = $("<div class=\"message-body\"></div>").appendTo(messageWin);
		win.append(div);
		if (button) {
			var tb = $("<div class=\"message-button\"></div>").appendTo(win);
			for ( var bt in button) {
				if (bt == $.message.defaults.ok) {
					$("<a></a>").attr("href", "javascript:void(0)").text(bt)
							.attr("class", 'btn').bind("click", function() {
								messageWin.remove();
								fullWindow.remove();
								if (fn) {
									fn(true);
									return false;
								}
							}).appendTo(tb);
				} else {
					$("<a></a>").attr("href", "javascript:void(0)").text(bt)
							.attr("class", 'btn').bind("click", function() {
								messageWin.remove();
								fullWindow.remove();
								if (fn) {
									fn(false);
									return false;
								}
							}).appendTo(tb);
				}
			}
			tb.find('a').eq(0).focus();
		}
		return win;
	}

	function messageMoveEvent(objTitle, event) {

		var obj = $(objTitle).parent().parent();

		if (obj.attr('class') == 'message-window'
				|| obj.attr('class') == 'panel-window') {
			var top = obj.offset().top;
			var left = obj.offset().left;
			var width = obj.width();
			var height = obj.height();
			var maxWidth = $(window).width() - width;
			var maxHeight = $(document).height() - height;
			if (maxWidth < 0) {
				maxWidth = 0;
			}
			if (maxHeight < 0) {
				maxHeight = 0;
			}
			var zIndex = $.fn.jrDefaults.zIndex++;
			var proxy = $(
					"<div class=\"window-proxy\" style=\"display: block; z-index: "
							+ zIndex + "; left: " + left + "px; top: " + top
							+ "px; width: " + width + "px; height: " + height
							+ "px;\"></div>").appendTo('body');
			var isMove = true;
			var abs_x = event.pageX - left;
			var abs_y = event.pageY - top;
			$(document).bind('mousemove', function(event) {
				if (isMove) {
					var leftMove = event.pageX - abs_x;
					var topMove = event.pageY - abs_y;
					if (leftMove < 0) {
						leftMove = 0;
					}
					if (leftMove > maxWidth) {
						leftMove = maxWidth;
					}
					if (topMove < 0) {
						topMove = 0;
					}
					if (topMove > maxHeight) {
						topMove = maxHeight;
					}
					proxy.css({
						'left' : leftMove,
						'top' : topMove
					});
				}
			}).bind('mouseup', function() {
				$(document).unbind("mouseup");
				$(document).unbind("mousemove");
				isMove = false;
				obj.css({
					'left' : proxy.offset().left,
					'top' : proxy.offset().top
				});
				proxy.remove();
			});
		}
	}
})(jQuery);