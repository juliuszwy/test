<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<html>
<head>
<base href="${contextPath }/" />
<link href="resources/css/cpd.css" rel="stylesheet">
<style type="text/css">
</style>
<script>
var demo;
	$(function() {
		$("#loginName").focus();
			demo=$(".registerform").Validform({
				btnReset:"#btn_reset",
				tiptype:3,
				label:'.label',
				showAllError:true,
				ajaxPost:true,
				ignoreHidden:true,
			});
			demo.addRule([{
				ele:".inputxt:eq(0)",
				datatype:"s",
				sucmsg:" "
			},
			{
				ele:".inputxt:eq(1)",
				datatype:"n",
				sucmsg:" "
			}]);
		var started = false;
		function handlePointerEventStart(event) {

			if (typeof event.x != 'undefined') {
				lastX = event.x;
				lastY = event.y;
			}
			started = true;

		}
		function hanldePointerEventMove(event) {
			if (!started) {

				return;
			}
			var dx, dy;

			if (typeof event.x != 'undefined') {
				dx = event.x - lastX;
				dy = event.y - lastY;
			} else {
				return;

			}
			var trans = $("#AddSubChannel_bar").css("transform");
			var regTrans = /1,\s0,\s0,\s1,\s(-*\d+),\s(-*\d+)/;
			var r = trans.match(regTrans);
			var transX = RegExp.$1;
			var transY = RegExp.$2;
			if (transX == '') {
				transX = '0';
			}
			if (transY == '') {
				transY = '0';
			}
			if (trans == 'none') {
				transX = '0';
				transY = '0';
			}

			$("#AddSubChannel_bar").css(
					"transform",
					"translateX(" + (parseInt(transX) + dx) + "px)"
							+ " translateY(" + (parseInt(transY) + dy) + "px)");
			transX = parseInt(transX) + dx;
			if (typeof event.x != 'undefined') {
				lastX = event.x;
				lastY = event.y;
			}
		}

		function handlePointerEventEnd(event) {
			started = false;
		}

		document.getElementById('AddSubChannel_bar').addEventListener(
				'mouseup', handlePointerEventEnd);
		document.getElementById('AddSubChannel_bar').addEventListener(
				'mousemove', hanldePointerEventMove);
		document.getElementById('AddSubChannel_bar').addEventListener(
				'mousedown', handlePointerEventStart);
		$("#Validform_msg").remove();
				
	});
	
    $(document).tooltip(); 
       
</script>
</head>

<body>
	<form id="spCpdAdd_form"  method="post" class="registerform" >
		<input type="hidden" name="id" value="${spGatewayCpd.id }"/>
		<input type="hidden" name="type" value="${spGatewayCpd.type }"/>
		<input type="hidden" name="doType" value="1"/>
		<div class="tableDouble">
		    <table>
		    	<tbody>
			    	<c:if test="${not empty spGatewayCpd.id}">
						 <tr>
				            <td><label for="serialNo">通道编号:</label></td>
				            <td colspan="3"><input type="text" name="serialNo" value="${spGatewayCpd.serialNo }"disabled='disabled'></input></td>
			       		 </tr>
					</c:if>
			        <tr>
			        	<td><label  >通道类型:</label></td>
						<td>
							<input   type="text"   value="组合通道" disabled="disabled"></input>
						</td>
			            <td><label  class="label">名称:</label></td>
			            <td><input  type="text" name="name" class="inputxt"  value="${spGatewayCpd.name }" ></input></td>
			        </tr>
			        <tr>
			         	<td><label for="operator"><span class="red">*</span>运营商:</label></td>
						<td>
							<select onchange="javascript:changeOperator();"id="OperatorSelect"  name="operator" panelHeight="auto"  style="width:150px" >
			            	 	<option value="M" <c:if test="${spGatewayCpd.operator=='M' }">selected</c:if>>移动</option>
			                	<option value="U" <c:if test="${spGatewayCpd.operator=='U' }">selected</c:if>>联通</option>
			                	<option value="T" <c:if test="${spGatewayCpd.operator=='T' }">selected</c:if>>电信</option>
			           		</select>
						</td>
						<td><label for="price" class="label"><span class="red">*</span>价格:</label></td>
			            <td><input id="price"  type="text" name="price"class="inputxt" id="price"  value="${spGatewayCpd.price }" 
			            onchange="javascript:changeOperator();" <c:if test="${not empty spGatewayCpd.id}">disabled='disabled'</c:if>></input></td>
			        </tr>
			        <tr>
			        	<td><label for="level" class="label" ><span class="red">*</span>等级:</label></td>
						<td>
							<select  name="level" panelHeight="auto" style="width:150px" >
		            	 	<option value="0" <c:if test="${spGatewayCpd.level==0 }">selected</c:if>>优</option>
		                	<option value="1" <c:if test="${spGatewayCpd.level==1 }">selected</c:if>>良</option>
		                	<option value="2" <c:if test="${spGatewayCpd.level==2 }">selected</c:if>>中</option>
		                	<option value="3" <c:if test="${spGatewayCpd.level==3 }">selected</c:if>>差</option>
						</td>
						<td><label  class="label"><span class="red">*</span>状态:</label></td>
			            <td>
				            <select  name="status"  style="width:150px;">
				            	<option value="0"<c:if test="${spGatewayCpd.status==0 }">selected</c:if>>enable</option>
				            	<option value="1"<c:if test="${spGatewayCpd.status==1 }">selected</c:if>>disable</option>
				            </select>
			            </td>
			        </tr>
			        <tr >
			             <td ><label  class="label">短信间隔时间:</label></td>
			            <td colspan="3">
				           <input  name="interval"  type="text"   class="inputxt" value="${spGatewayCpd.interval}"></input>
			            </td>
					</tr>
					<tr >
			        	<td><label  class="label">屏蔽时间段:(例：02-12|13-14)</label></td>
			            <td colspan="3">
				          <input  name="timeQuantum"  type="text"    style="width:560px"></input>
			            </td>
					</tr>
					<tr>
						<td><label  class="label">扣费提示:</label></td>
						<td colspan="3">
							<input  name="costTip"  type="text"   style="width:700px"></input>
						</td>
					</tr>
					<tr>
						<td><label  class="label">扣费成功提示:</label></td>
						<td colspan="3">
							<input  name="costSucTip"  type="text"    style="width:700px"></input>
						</td>
					</tr>
					<tr>
						<td><label  class="label">警示:</label></td>
						<td colspan="3">
							<input  name="costWarnTip"  type="text"    style="width:700px"></input>
						</td>
					</tr>
					<tr>
						<td><label  class="label">备忘:</label></td>
						<td colspan="3">
							<input  name="remark"  type="text"    style="width:700px"></input>
						</td>
					</tr>
			    </tbody>
		    </table>
	    </div>
	    
			<div id="MultiChannel">
				<section>
					<label><span class="red">*</span>通道组合添加：</label>
					<button id="AddSubChannel" type="button" class="btn W100" style="margin: 0px">添加子通道</button>
					<span style="color: red">(不可重复)</span>
				</section>
				<table class="gridtable" id="gridtables">
					<tr>
						<th>运营商</th>
						<th>提供者</th>
						<th>渠道编号</th>
						<th>渠道名称</th>
						<th>类型</th>
						<th>价格</th>
						<th>操作</th>
					</tr>

					<c:forEach items="${spGatewayCpd.spGatewaySgeForms}" var="sge" varStatus="st">
						<tr id="tr${sge.id }">
							<td>${sge.operator}</td>
							<td>${sge.spInfoForm.name}</td>
							<td>${sge.serialNo}</td>
							<td>${sge.name}</a></td>
							<td>${sge.doType}</td>
							<td>${sge.price}</td>
							<td><a id="td${st.index }" href="javascript:void(0)"
								onClick="javascript:deleteTable('${sge.id }');">删除</a> <input
								type="hidden" id="data${st.index }" name="checkedGatewaySgeIds"
								value="${sge.id}"></td>
							<c:if
								test="${(sge.price * 1 gt spGatewayCpd.price * 1)  || sge.price*1 == spGatewayCpd.price * 1 && spGatewayCpd.spGatewaySgeForms.size() > 1}">
								<td style="border: 0px">通道错误!请删除.</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<section>
				<label style="width: 180px"><span class="red">*</span>&nbsp;开通的省份或城市：&nbsp;</label>
			</section>
			<section
				style="margin-left: 60px; width: 720px; font-size: 14px; height: 180px;" id="cpdProProxId">
			</section>

			<div id="AddSubChannel_Bg">
				<div id="AddSubChannel_bar"
					style="text-align: center; height: 250px;">
					<div class="choiceChannel" >选择子通道(不可重复)</div>
					<label style="width: 100px; font-weight: 100; margin-bottom: 20px;">子通道名称：</label>
					<select id="addSingleChannel" style="margin-left:80px;">
					</select>
					<button type="button" id="addChannel"
						style="margin: 0px; margin-right: 50px;margin-top:30px;" class="btn W60">确定</button>
					<button type="button" id="chanceChannel" style="margin-top:30px;" class="btn W60">返回</button>
				</div>
			</div>
			
			 <div style="text-align:center;margin-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="cpdSave();"></input>
		        <input id="btn_reset" type="button"class="btn W80" value="重置"></input>
		    </div>
	</form>
	<script>
		var provincesID = [ 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
		var provincesflag = 0;//标记是哪个省
		var singleChannel;
		var table_provinces = [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
		var table_flag = 0;
		
		$(document).ready(function(e) {
			if ($("#price").val() != "") {
				sendAjax();
			}
			createProsInput();
		});
		

		function cpdSave(){
			var arr=[];
			var inputId = document
					.getElementById(
							"gridtables")
					.getElementsByTagName(
							"input");
			var totalPrice = 0;
			for (var i = 0; i < inputId.length; i++) {
				if (singleChannel[$(
						inputId[i]).val()] == undefined) {
					alert("通道错误. 请删除.");
					return;
				}
				totalPrice += eval(singleChannel[$(
						inputId[i]).val()].price);
				arr[i] = $(inputId[i]).val();
			}
			if (totalPrice != $("#price")
					.val()) {
				alert("价格有误，请重新计算");
				return;
			} 
			var cpdCommon = $("#cpdCommon");
			if(demo.check(false)){
				$("#spCpdAdd_form").jrAjax({
					url : "cpd/save",
					autoGetParam : true,
					resultAutoProcess : true,
					newdLoading : true,
					data:{'checkSgeIds':JSON.stringify(arr)},
					loadingType : 'full',
					container : cpdCommon,
					successCallback: function(result){
						if(result=='1'){
							cpdCommon.jrDialog("close");
							$("#searchFunSpSge").click();
						}else{
							$("#btn_reset").click();
						}
							
					},
					errorCallback:function(result){
						$("#btn_reset").click();
					}
				});
			}
		}
		
		function sendAjax() {
			var inputId = document.getElementById("gridtables")
					.getElementsByTagName("input");
			$.ajax({
				type : 'get',
				dataType : 'json',
				url : "sge/getAllByCpd",
				data : {
					"operator" : $("#OperatorSelect").val(),
					"price" : $("#price").val(),
				},
				success : function(json) {
					if (typeof json != 'undefined') {
						singleChannel = json;
						for ( var key in singleChannel) {
							var cOption = document.createElement("option");
							cOption.setAttribute("value", key);
							cOption.innerHTML = singleChannel[key].serialNo
									+ "(" + singleChannel[key].price + "元)" + " " +singleChannel[key].name ;
							document.getElementById('addSingleChannel')
									.appendChild(cOption);
						}
						if (inputId.length != 0) {
							provinceCheck();
						} else {
							clearData();
						}
					}
				},
				error : function() {
					clearData();
				},
			});
		}

		function provinceCheck() {
			var inputId = document.getElementById("gridtables")
					.getElementsByTagName("input");
			for (var i = 0; i < inputId.length; i++) {
				if (singleChannel[$(inputId[i]).val()] != undefined) {
					table_flag++;
					var UinputId = $(inputId[i]).val();
					for (var j = 0; j < 31; j++) {
						if (singleChannel[UinputId].sgeProForms[j].proStatus == 1 ) {
							table_provinces[j+1]++;
						}
					}
				}
			}
			for (var i = 1; i <= 31; i++) {
				if (table_provinces[i] == table_flag) {
					document.getElementById("checkboxcity" + i).checked = true;
				}else{
					document.getElementById("checkboxcity" + i).checked = false;
				}
			}
		}
		function clearData() {
			for (var i = 1; i <= 31; i++) {
				document.getElementById("checkboxcity" + i).checked = false;
			}
			var inputId = document.getElementById("gridtables")
					.getElementsByTagName("input");
			var arr = new Array();
			for (var i = 0; i < inputId.length; i++) {
				var UinputId = $(inputId[i]).val();
				arr[i] = UinputId;
			}
			for (i = 0; i < arr.length; i++) {
				document.getElementById("tr" + arr[i]).remove();
			}
		}
		
		$("#chanceChannel").on('click', function() {
			$("#AddSubChannel_Bg").css("display", "none");
		});


		$("#addChannel")
				.on(
						'click',
						function() {
							$("#AddSubChannel_Bg").css("display", "none");
							var inputId = document.getElementById("gridtables")
									.getElementsByTagName("input");
							var optinonID = document
									.getElementById("addSingleChannel").value;
							var totalPrice = 0;
							for (var i = 0; i < inputId.length; i++) {
								totalPrice += eval(singleChannel[$(inputId[i])
										.val()].price);
							}
							addPrice = eval(singleChannel[optinonID].price);
							if (totalPrice + addPrice > $("#price").val()) {

								alert("价格超出范围，添加失败");
							} else {
								creatTable(optinonID);
								provinceCheck();
							}
						});

		function changeOperator() {
			$("#addSingleChannel").empty();
			clearData();
			if (!$("#price").val() == ""&&!$("#OperatorSelect").val() == "") {
				sendAjax();
			}
		}
		function creatTable(i) {
			var vTr = document.createElement("tr");
			var vTd1 = document.createElement("td");
			var vTd2 = document.createElement("td");
			var vTd3 = document.createElement("td");
			var vTd4 = document.createElement("td");
			var vTd5 = document.createElement("td");
			var vTd6 = document.createElement("td");
			var vTd7 = document.createElement("td");
			var vWordlink = document.createElement("a");
			var vInput = document.createElement("input");
			var vLink = document.createElement("a");
			vTr.setAttribute("id", "tr" + i);
			vLink.setAttribute("id", "td" + i);
			vLink.setAttribute("href", "javascript:void(0)");
			vLink.setAttribute("onClick", "javascript:deleteTable('" + i
					+ "');");
			//vWordlink.setAttribute("href", "mj/sge-input.do?id=" + i);
			vLink.innerHTML = '删除';
			vTd1.innerHTML = singleChannel[i].operator;
			vWordlink.innerHTML = singleChannel[i].name;
			vTd2.innerHTML = singleChannel[i].spInfoForm.name;
			vTd3.innerHTML = singleChannel[i].serialNo;
			vTd5.innerHTML = singleChannel[i].doType;
			vTd6.innerHTML = singleChannel[i].price;
			vInput.setAttribute("type", "checkbox");
			vInput.setAttribute("checked", "checked");
			vInput.setAttribute("id", "data" + i);
			vInput.setAttribute("name", "checkedGatewaySgeIds");
			vInput.setAttribute("value", singleChannel[i].id);

			vTd7.appendChild(vLink);
			vTd7.appendChild(vInput);
			vTd4.appendChild(vWordlink);
			vTr.appendChild(vTd1);
			vTr.appendChild(vTd2);
			vTr.appendChild(vTd3);
			vTr.appendChild(vTd4);
			vTr.appendChild(vTd5);
			vTr.appendChild(vTd6);
			vTr.appendChild(vTd7);
			document.getElementById('gridtables').appendChild(vTr);
		}

		function deleteTable(i) {

			document.getElementById("tr" + i).remove();
			var inputId = document.getElementById("gridtables")
					.getElementsByTagName("input");
			if (inputId.length != 0) {
				provinceCheck();
			} else {
				clearData();
			}
		}

		function adddate(i) {
			if (singleChannel[i] != undefined) {
				console.log("xxx");
				var cOption = document.createElement("option");
				cOption.setAttribute("value", i);
				cOption.innerHTML = singleChannel[i].name + "("
						+ singleChannel[i].price + ")";
				document.getElementById('addSingleChannel')
						.appendChild(cOption);
			}
		}

		

		$("#AddSubChannel").on('click', function() {
			if ($("#price").val() == "") {
				alert("请填写价格");
				$("#price").focus();
			} else if ($("#OperatorSelect").val() == "") {
				alert("请选择运营商");
				$("#OperatorSelect").focus();
			} else {
				$("#AddSubChannel_Bg").css("display", "block");
				$("#AddSubChannel_bar").css("transform", "translate(0,0)");
			}
		});
		
function createProsInput(){
	var cpdProProxId = document.getElementById("cpdProProxId");
	for ( var key in CityName) {
			if(key==0)continue;
			var name = CityName[key];
			var cInput = document.createElement("input");
			cInput.setAttribute("type", "checkbox");
			cInput.setAttribute("class", "checkPro");
			cInput.setAttribute("id", "checkboxcity"+key);
			cInput.setAttribute("disabled", "disabled");
			
			
			var proA = document.createElement("label");
			proA.setAttribute("class", "city_label ");
			var proSpan = document.createElement("span");
			var txtNode = document.createTextNode(name);
			proA.appendChild(proSpan);
			proA.appendChild(txtNode);
			
			cpdProProxId.appendChild(cInput);
			cpdProProxId.appendChild(proA);
				
	}
}
	</script>
</body>
</html>


