<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset='utf-8'">
<title>通道管理 | 编辑通道</title>
<base href="${contextPath }/" />
<script type="text/javascript" src="resources/js/jquery.form.js"></script>
<link href="resources/css/sge.css" rel="stylesheet"/>
<script src="resources/js/order.js"></script>
<style type="text/css">
</style>
<script>
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#customDayLimit").focus();
		//active tab
		$.extend($.fn.validatebox.defaults.rules, {
           timeQuan: {// 验证身份证
                validator: function (value) {
               		 var timeQuan = /^((([01][0-9]|[2][0-4])-([01][0-9]|[2][0-4]))|(([01][0-9]|[2][0-4])-([01][0-9]|[2][0-4])\|([01][0-9]|[2][0-4])-([01][0-9]|[2][0-4]))|(([01][0-9]|[2][0-4])-([01][0-9]|[2][0-4])\|([01][0-9]|[2][0-4])-([01][0-9]|[2][0-4])\|([01][0-9]|[2][0-4])-([01][0-9]|[2][0-4])))$/;
                    return   timeQuan.test(value)
                },
                message: '"时间段格式01-10|15-16,小时2位，不足补0"'
            }
        });
		typeChange();
		
	});
		function changeChoice(){
			var condition = $("#cpChoice").val();
			newChannelOrder();
			if(condition == undefined || $.trim(condition) == ""){
				$("#total option").bind('dblclick', function(){	
				chooseItems(conditionForm.choices, conditionForm.selectcolumns);
				});
				return;
			}
			$("#total option").each(function(){
				if($(this).html().indexOf(condition) < 0){
					$(this).remove();
				}
			});	
			$("#total option").bind('dblclick', function(){	
				chooseItems(conditionForm.choices, conditionForm.selectcolumns);
			});	
		}
	function newChannelOrder(){
		var avail = [];
		$("#total").empty();
		$("#avail option").each(function(){
			avail[$(this).attr("value")]=cps[$(this).attr("value")].name;
		});
		if(totalsize!=avail.length) {
			var left = new Array();
			for(key in cps){
					var flag = false;
					for(key1 in avail){
						if(key==key1){
							flag = true;
							break;
						}
					}
					if(!flag) {
						left[left.length] = key;
					}
				}
				var map = {};
				left.sort();
				for(var j =0;j<left.length;j++){
					var key2 = left[j];
					var value = apps[key2].name;
					map[key2] = value;
				} 
				for(key in map)
				{   
		   		 	var vTotalOption=document.createElement("option");
					vTotalOption.innerHTML = map[key]+"("+key+")";
					vTotalOption.value = key;
					document.getElementById('total').appendChild(vTotalOption);   
				} 
		}
	}
	
	
	function typeChange(){
        var type =$("#type option:selected").val();
        if(type==1){
          $("#addCps").show();
        }else{
         	$("#addCps").hide();
        }
       }
</script>
</head>
<body >
	<h1>通道维护</h1>
	<form id="inputForm"  method="post">
		<input type="hidden" id="gateId" name="id" value="${sgeForm.id }"/>
		<input type="hidden"  name="spInfoForm.id" value="${sgeForm.spInfoForm.id }"/>
		<input type="hidden" id="provincesID" name="provinces" value="${sgeForm.provinces }"/>
		<input type="hidden" id="citiesID" name="cities" value="${sgeForm.cities }"/>
		<input type="hidden" id="mlimitsID" name="mproLimits" value="${sgeForm.mproLimits }"/>
		<input type="hidden" id="tlimitsID" name="tproLimits" value="${sgeForm.tproLimits }"/>
		<input type="hidden" id="avaLength" name="avaLength" value="${sgeForm.avaLength }"/>
		<input type="hidden" id="cpIds" name="cpIds" value="3"/>
		
			<legend>
				<small>单通道管理</small>
			</legend>
			<section >
				<label>通道类型：&nbsp;</label>
				<select  id="type" name="type"  onchange="typeChange()">
					<option value="0" <c:if test="${sgeForm.type==0 }">selected</c:if>>普通</option>
		            <option value="1" <c:if test="${sgeForm.type==1 }">selected</c:if>>专属</option>
				</select>
				<input  id="addCps" onclick="CpOrder()" type="button" value="分配该通道2应用"  style="margin: 0px;width: 150px">
			</section>
			<section>
				<label>通道类型：&nbsp;</label> <input type="text" readonly="readonly"
					value="单通道" /> <label> <span>*</span>&nbsp;价格：&nbsp;</label>
				<input type="text" name="price" readonly="readonly" value="${sgeForm.price }"/>
			</section>
			<section>
				<label><span>*</span>&nbsp;运营商：&nbsp;</label>
				<input type="text" name="operator" id="operator" readonly="readonly" value="<c:if test="${sgeForm.operator=='M' }">M</c:if><c:if test="${sgeForm.operator=='U' }">U</c:if><c:if test="${sgeForm.operator=='T' }">T</c:if>"readonly="readonly" />
				<label>&nbsp;用户日限：&nbsp;</label>
				<input type="text" name="customDayLimit" id="customDayLimit"  value="${sgeForm.customDayLimit }"class="easyui-validatebox" data-options="required:true,validType:'length[0,10]'"/>
			</section>
			<section>
				<label><span>*</span>&nbsp;提供者：&nbsp;</label>
				<input type="text" name="spInfoForm.name" readonly="readonly" value="${sgeForm.spInfoForm.name }"/>
				<label>通道日限：&nbsp;</label>
				<input type="text" name="spDayLimit" id="spDayLimit"   value="${sgeForm.spDayLimit }" class="easyui-validatebox" data-options="required:true,validType:'length[0,10]'"/>
			</section>
			<section>
				<label><span>*</span>&nbsp;通道名称：&nbsp;</label>
				<input type="text" name="name" id="name" readonly="readonly" value="${sgeForm.name }"/>
				<label>用户月限：&nbsp;</label>
				<input type="text" name="customMonLimit" id="customMonLimit"  value="${sgeForm.customMonLimit }" class="easyui-validatebox" data-options="required:true,validType:'length[0,10]'"/>
			</section>
			<section>
				<label><span>*</span>&nbsp;通道编号：&nbsp;</label>
				<input type="text" name="serialNo" id="serialNo" readonly="readonly" value="${sgeForm.serialNo }"/>
				<label> 通道月限：&nbsp;</label>
				<input type="text" name="spMonLimit" id="spMonLimit" value="${sgeForm.spMonLimit }" class="easyui-validatebox" data-options="required:true,validType:'length[0,10]'"/>
			</section>
			<section>
			<label>类型：&nbsp;</label>
			            <input id="cc" class="easyui-combobox" style="width: 155px;" name="doType" data-options="
						required:true,
						url:'spType/getAll?defaultValues=${sgeForm.doType}',
						method:'get',
						valueField:'id',
						textField:'name',
						panelHeight:'auto' " />
				<label>状态：&nbsp;</label>
				<select name="status" >
					<option value="1" <c:if test="${sgeForm.status==1 }">selected</c:if>>disabled</option>
		            <option value="0" <c:if test="${sgeForm.status==0 }">selected</c:if>>enabled</option>
				</select>
			</section>
			<section>
				<label>间隔时间：&nbsp;</label>
				<input class="easyui-numberbox" name="interval" id="interval"   maxlength="3"  value="${sgeForm.interval }" data-options="min:0,precision:0,suffix:'秒'" />
				<label>分成比例：&nbsp;</label>
				<input class="easyui-numberbox" name="scale" id="scale"     value="${sgeForm.scale }" data-options="min:0,precision:2,min:0,max:0.99" />
			</section>
			<section>
				<label>屏蔽时间段：&nbsp;</label>
				<input class="easyui-validatebox" name="timeQuantum" id="timeQuantum" style="width:155px;" maxlength="100" value="${sgeForm.timeQuantum }" validtype='timeQuan'>
				<label>状态：&nbsp;</label>
				<select name="level" >
					<option value="0" <c:if test="${sgeForm.level==0 }">selected</c:if>>优</option>
		            <option value="1" <c:if test="${sgeForm.level==1 }">selected</c:if>>良</option>
		            <option value="2" <c:if test="${sgeForm.level==2 }">selected</c:if>>中</option>
		            <option value="3" <c:if test="${sgeForm.level==3 }">selected</c:if>>差</option>
				</select>
			</section>
			<section>
				<label>上行端口号：&nbsp;</label>
				<input class="easyui-numberbox"  name="moPort" id="moPort" style="width:560px"  maxlength="20"  data-options="required:true" value="${sgeForm.moPort }"/>
			</section>
			<section>
				<label>屏蔽端口号：&nbsp;</label>
				<input class="easyui-validatebox"  name="mrPort" id="mrPort" style="width:560px"  maxlength="100"  data-options="required:true" value="${sgeForm.mrPort }"/>
				
				<select  id="downStatus" name="downStatus">
					<option value="1" <c:if test="${sgeForm.downStatus==1 }">selected</c:if>>OFF</option>
		            <option value="0" <c:if test="${sgeForm.downStatus==0 }">selected</c:if>>ON</option>
				</select>
			</section>
			<section>
				<label>拦截信息：&nbsp;</label>
				<input class="easyui-validatebox" name="cutSms" id="cutSms" style="width:560px;" maxlength="200" value="${sgeForm.cutSms }"/>
				<select  id="cutStatus" name="cutStatus" >
					<option value="1" <c:if test="${sgeForm.cutStatus==1 }">selected</c:if>>OFF</option>
		            <option value="0" <c:if test="${sgeForm.cutStatus==0 }">selected</c:if>>ON</option>
				</select>
			</section>
			<section>
				<label>扣费指令：&nbsp;</label>
				<input class="easyui-validatebox" name="moCmd" id="moCmd" style="width:560px;" maxlength="200" value="${sgeForm.moCmd }" data-options="required:true"/>
			</section>
			<section style="height:80px;">
				<label>备忘：<br />&nbsp;</label>
				<textarea rows="2" cols="20"  wrap="hard" name="remark" id="remark" style="width:560px;height:50px" maxlength="200" value="${sgeForm.remark }" >${sgeForm.remark }</textarea>
			</section>
			<section>
				<label style="width:180px">开通的省份或城市：&nbsp;</label>
				<input name="Allselected" id="Allselected" type="checkbox"
					style="margin-right:0px;" /> <label
					style="width:40px; margin:0px; text-align:left;font-weight:bold;">全选</label>
			</section>
			<section
				style="margin-left:60px;width:720px;font-size:14px; height:180px;">
				<input id="checkboxcity1" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(1);" /> <label
					class="city_label" onClick="javascript:checkCity(1);">上海市</label> <input
					id="checkboxcity2" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(2);" /> <label
					class="city_label" onClick="javascript:checkCity(2);">云南省</label> <input
					id="checkboxcity3" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(3);" /> <label
					class="city_label" onClick="javascript:checkCity(3);">内蒙古</label> <input
					id="checkboxcity4" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(4);" /> <label
					class="city_label" onClick="javascript:checkCity(4);">北京市</label> <input
					id="checkboxcity5" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(5);" /> <label
					class="city_label" onClick="javascript:checkCity(5);">吉林省</label> <input
					id="checkboxcity6" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(6);" /> <label
					class="city_label" onClick="javascript:checkCity(6);">四川省</label> <input
					id="checkboxcity7" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(7);" /> <label
					class="city_label" onClick="javascript:checkCity(7);">天津市</label> <input
					id="checkboxcity8" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(8);" /> <label
					class="city_label" onClick="javascript:checkCity(8);">宁夏</label> <input
					id="checkboxcity9" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(9);" /> <label
					class="city_label" onClick="javascript:checkCity(9);">安徽省</label> <input
					id="checkboxcity10" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(10);" /> <label
					class="city_label" onClick="javascript:checkCity(10);">山东省</label>
				<input id="checkboxcity11" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(11);" /> <label
					class="city_label" onClick="javascript:checkCity(11);">山西省</label>
				<input id="checkboxcity12" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(12);" /> <label
					class="city_label" onClick="javascript:checkCity(12);">广东省</label>
				<input id="checkboxcity13" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(13);" /> <label
					class="city_label" onClick="javascript:checkCity(13);">广西</label> <input
					id="checkboxcity14" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(14);" /> <label
					class="city_label" onClick="javascript:checkCity(14);">新疆</label> <input
					id="checkboxcity15" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(15);" /> <label
					class="city_label" onClick="javascript:checkCity(15);">江苏省</label>
				<input id="checkboxcity16" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(16);" /> <label
					class="city_label" onClick="javascript:checkCity(16);">江西省</label>
				<input id="checkboxcity17" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(17);" /> <label
					class="city_label" onClick="javascript:checkCity(17);">河北省</label>
				<input id="checkboxcity18" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(18);" /> <label
					class="city_label" onClick="javascript:checkCity(18);">河南省</label>
				<input id="checkboxcity19" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(19);" /> <label
					class="city_label" onClick="javascript:checkCity(19);">浙江省</label>
				<input id="checkboxcity20" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(20);" /> <label
					class="city_label" onClick="javascript:checkCity(20);">海南省</label>
				<input id="checkboxcity21" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(21);" /> <label
					class="city_label" onClick="javascript:checkCity(21);">湖北省</label>
				<input id="checkboxcity22" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(22);" /> <label
					class="city_label" onClick="javascript:checkCity(22);">湖南省</label>
				<input id="checkboxcity23" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(23);" /> <label
					class="city_label" onClick="javascript:checkCity(23);">甘肃省</label>
				<input id="checkboxcity24" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(24);" /> <label
					class="city_label" onClick="javascript:checkCity(24);">福建省</label>
				<input id="checkboxcity25" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(25);" /> <label
					class="city_label" onClick="javascript:checkCity(25);">西藏</label> <input
					id="checkboxcity26" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(26);" /> <label
					class="city_label" onClick="javascript:checkCity(26);">贵州省</label>
				<input id="checkboxcity27" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(27);" /> <label
					class="city_label" onClick="javascript:checkCity(27);">辽宁省</label>
				<input id="checkboxcity28" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(28);" onchange=""/> <label
					class="city_label" onClick="javascript:checkCity(28);">重庆市</label>
				<input id="checkboxcity29" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(29);" /> <label
					class="city_label" onClick="javascript:checkCity(29);">陕西省</label>
				<input id="checkboxcity30" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(30);" /> <label
					class="city_label" onClick="javascript:checkCity(30);">青海省</label>
				<input id="checkboxcity31" type="checkbox" style="margin-right:0px;"
					onClick="javascript:SelectAllCity(31);" /> <label
					class="city_label" onClick="javascript:checkCity(31);">黑龙江</label>
			</section>
			<div  border="false" style="margin-left:20%; padding: 5px 5px 5px 0;">
				 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm1('sge/save');">提交</a>
			</div>
	</form>
	</div>
	<div id="CpOrder">
	<form id="conditionForm" class="niceform">
    	<div class="provinces_title"><span>应用顺序</span></span> 
    		<input type="hidden" name="selectedChanel" id="selectedChanel">
    		&nbsp;&nbsp;<input type="text" id="cpChoice" style="width: 20%" onkeyup="changeChoice()" />
    	</div>
        <div style="position:relative;width:100%;height:75%;">
            <div style="display:inline-block;margin:1% 2%;width:35%;height:90%" >
                <select id="total" name="choices" multiple="multiple" style="width:100%;height:100%" size="25" class="NFMultiSelect">
                </select>
            </div>
            <div style="width:9%; display:inline-block; height:200px;text-align:center;">
                <input name="but_l" onclick="chooseItems(conditionForm.selectcolumns, conditionForm.choices)" type="button" value="左" class="">
                <input name="but_r" type="button" value="右" onclick="chooseItems(conditionForm.choices, conditionForm.selectcolumns)" class="">
            </div>
            <div style="display:inline-block;;margin:1% 2%;width:35%;height:90%">
                <select id="avail" name="selectcolumns" multiple="multiple" style="width:100%;height:100%" size="25" class="NFMultiSelect">
                </select>
            </div>
        </div>
        <button type="button" id="clicksaveDate" class="save" style="width:100px">保存修改</button>
        <div>  <button type="button" id="chanceDate" class="save" style="width:100px">返回</button></div>
      
    </form>
	<script>
		var city1 = "[{'cityName':'上海市'}]";
		var city2 = "[{'cityName':'昆明市'},{'cityName':'红河哈尼族彝族自治州'},{'cityName':'玉溪市'},{'cityName':'曲靖市'},{'cityName':'昭通市'},{'cityName':'文山壮族苗族自治州'},{'cityName':'思茅市'},{'cityName':'西双版纳傣族自治州'},{'cityName':'大理白族自治州'},{'cityName':'怒江傈僳族自治州'},{'cityName':'丽江市'},{'cityName':'迪庆藏族自治州'},{'cityName':'楚雄彝族自治州'},{'cityName':'临沧市'},{'cityName':'保山市'},{'cityName':'德宏傣族景颇族自治州'}]";
		var city3 = "[{'cityName':'呼和浩特市'},{'cityName':'乌兰察布市'},{'cityName':'包头市'},{'cityName':'巴彦淖尔市'},{'cityName':'乌海市'},{'cityName':'鄂尔多斯市'},{'cityName':'呼伦贝尔市'},{'cityName':'赤峰市'},{'cityName':'锡林郭勒盟'},{'cityName':'通辽市'},{'cityName':'兴安盟'},{'cityName':'阿拉善盟'}]";
		var city4 = "[{'cityName':'北京市'}]";
		var city5 = "[{'cityName':'长春市'},{'cityName':'吉林市'},{'cityName':'凉山彝族自治州'},{'cityName':'通化市'},{'cityName':'白山市'},{'cityName':'四平市'},{'cityName':'辽源市'},{'cityName':'白城市'},{'cityName':'松原市'}]";
		var city6 = "[{'cityName':'成都市'},{'cityName':'乐山市'},{'cityName':'凉山彝族自治州'},{'cityName':'攀枝花市'},{'cityName':'德阳市'},{'cityName':'眉山市'},{'cityName':'绵阳市'},{'cityName':'阿坝藏族羌族自治州'},{'cityName':'雅安市'},{'cityName':'甘孜藏族自治州'},{'cityName':'广元市'},{'cityName':'遂宁市'},{'cityName':'达州市'},{'cityName':'巴中市'},{'cityName':'南充市'},{'cityName':'广安市'},{'cityName':'内江市'},{'cityName':'资阳市'},{'cityName':'自贡市'},{'cityName':'宜宾市'},{'cityName':'泸州市'}]";
		var city7 = "[{'cityName':'天津市'}]";
		var city8 = "[{'cityName':'银川市'},{'cityName':'吴忠市'},{'cityName':'石嘴山市'},{'cityName':'中卫市'},{'cityName':'固原市'}]";
		var city9 = "[{'cityName':'合肥市'},{'cityName':'淮南市'},{'cityName':'蚌埠市'},{'cityName':'宿州市'},{'cityName':'淮北市'},{'cityName':'阜阳市'},{'cityName':'亳州市'},{'cityName':'六安市'},{'cityName':'巢湖市'},{'cityName':'滁州市'},{'cityName':'芜湖市'},{'cityName':'宣城市'},{'cityName':'马鞍山市'},{'cityName':'铜陵市'},{'cityName':'黄山市'},{'cityName':'安庆市'},{'cityName':'池州市'}]";
		var city10 = "[{'cityName':'济南市'},{'cityName':'聊城市'},{'cityName':'德州市'},{'cityName':'淄博市'},{'cityName':'滨州市'},{'cityName':'东营市'},{'cityName':'潍坊市'},{'cityName':'烟台市'},{'cityName':'威海市'},{'cityName':'青岛市'},{'cityName':'泰安市'},{'cityName':'莱芜市'},{'cityName':'济宁市'},{'cityName':'荷泽市'},{'cityName':'临沂市'},{'cityName':'日照市'},{'cityName':'枣庄市'}]";
		var city11 = "[{'cityName':'太原市'},{'cityName':'晋中市'},{'cityName':'吕梁市'},{'cityName':'忻州市'},{'cityName':'朔州市'},{'cityName':'大同市'},{'cityName':'临汾市'},{'cityName':'运城市'},{'cityName':'阳泉市'},{'cityName':'长治市'},{'cityName':'晋城市'}]";
		var city12 = "[{'cityName':'广州市'},{'cityName':'清远市'},{'cityName':'韶关市'},{'cityName':'梅州市'},{'cityName':'汕头市'},{'cityName':'惠州市'},{'cityName':'汕尾市'},{'cityName':'河源市'},{'cityName':'深圳市'},{'cityName':'珠海市'},{'cityName':'潮州市'},{'cityName':'揭阳市'},{'cityName':'湛江市'},{'cityName':'茂名市'},{'cityName':'肇庆市'},{'cityName':'云浮市'},{'cityName':'佛山市'},{'cityName':'江门市'},{'cityName':'阳江市'}, {'cityName':'中山市'}, {'cityName':'东莞市'}]";
		var city13 = "[{'cityName':'南宁市'},{'cityName':'崇左市'},{'cityName':'百色市'},{'cityName':'钦州市'},{'cityName':'北海市'},{'cityName':'贵港市'},{'cityName':'玉林市'},{'cityName':'防城港市'},{'cityName':'桂林市'},{'cityName':'贺州市'},{'cityName':'梧州市'},{'cityName':'柳州市'},{'cityName':'来宾市'},{'cityName':'河池市'}]";
		var city14 = "[{'cityName':'乌鲁木齐市'},{'cityName':'昌吉回族自治州'},{'cityName':'石河子市'},{'cityName':'博尔塔拉蒙古自治州'},{'cityName':'克拉玛依市'},{'cityName':'塔城地区'},{'cityName':'伊犁哈萨克自治州'},{'cityName':'阿勒泰地区'},{'cityName':'吐鲁番地区'},{'cityName':'哈密地区'},{'cityName':'巴音郭楞蒙古自治州'},{'cityName':'阿克苏地区'},{'cityName':'阿拉尔市'},{'cityName':'喀什地区'},{'cityName':'克孜勒苏柯尔克孜自治州'},{'cityName':'和田地区'}]";
		var city15 = "[{'cityName':'南京市'},{'cityName':'镇江市'},{'cityName':'常州市'},{'cityName':'无锡市'},{'cityName':'苏州市'},{'cityName':'泰州市'},{'cityName':'徐州市'},{'cityName':'连云港市'},{'cityName':'淮安市'},{'cityName':'宿迁市'},{'cityName':'盐城市'},{'cityName':'扬州市'},{'cityName':'南通市'}]";
		var city16 = "[{'cityName':'南昌市'},{'cityName':'九江市'},{'cityName':'景德镇市'},{'cityName':'上饶市'},{'cityName':'鹰潭市'},{'cityName':'宜春市'},{'cityName':'萍乡市'},{'cityName':'新余市'},{'cityName':'赣州市'},{'cityName':'吉安市'},{'cityName':'抚州市'}]";
		var city17 = "[{'cityName':'石家庄市'},{'cityName':'衡水市'},{'cityName':'邢台市'},{'cityName':'邯郸市'},{'cityName':'沧州市'},{'cityName':'唐山市'},{'cityName':'廊坊市'},{'cityName':'秦皇岛市'},{'cityName':'承德市'},{'cityName':'保定市'},{'cityName':'张家口市'}]";
		var city18 = "[{'cityName':'郑州市'},{'cityName':'新乡市'},{'cityName':'焦作市'},{'cityName':'济源市'},{'cityName':'安阳市'},{'cityName':'濮阳市'},{'cityName':'鹤壁市'},{'cityName':'许昌市'},{'cityName':'漯河市'},{'cityName':'驻马店市'},{'cityName':'信阳市'},{'cityName':'周口市'},{'cityName':'平顶山市'},{'cityName':'洛阳市'},{'cityName':'三门峡市'},{'cityName':'南阳市'},{'cityName':'开封市'},{'cityName':'商丘市'}]";
		var city19 = "[{'cityName':'杭州市'},{'cityName':'绍兴市'},{'cityName':'湖州市'},{'cityName':'嘉兴市'},{'cityName':'宁波市'},{'cityName':'舟山市'},{'cityName':'台州市'},{'cityName':'金华市'},{'cityName':'丽水市'},{'cityName':'衢州市'},{'cityName':'温州市'}]";
		var city20 = "[{'cityName':'海口市'},{'cityName':'三亚市'}]";
		var city21 = "[{'cityName':'武汉市'},{'cityName':'天门市'},{'cityName':'孝感市'},{'cityName':'仙桃市'},{'cityName':'潜江市'},{'cityName':'荆州市'},{'cityName':'黄石市'},{'cityName':'鄂州市'},{'cityName':'咸宁市'},{'cityName':'黄冈市'},{'cityName':'襄樊市'},{'cityName':'随州市'},{'cityName':'十堰市'},{'cityName':'神农架林区'},{'cityName':'宜昌市'},{'cityName':'恩施土家族苗族自治州'},{'cityName':'荆门市'}]";
		var city22 = "[{'cityName':'长沙市'},{'cityName':'湘潭市&nbspZ;&nbsp;'},{'cityName':'株洲市'},{'cityName':'益阳市'},{'cityName':'岳阳市'},{'cityName':'常德市'},{'cityName':'湘西土家族苗族自治州'},{'cityName':'娄底市'},{'cityName':'怀化市'},{'cityName':'衡阳市'},{'cityName':'邵阳市'},{'cityName':'郴州市'},{'cityName':'永州市'},{'cityName':'张家界市'}]";
		var city23 = "[{'cityName':'兰州市'},{'cityName':'白银市'},{'cityName':'临夏回族自治州'},{'cityName':'武威市'},{'cityName':'张掖市'},{'cityName':'酒泉市'},{'cityName':'金昌市'},{'cityName':'天水市'},{'cityName':'陇南市'},{'cityName':'定西市'},{'cityName':'平凉市'},{'cityName':'庆阳市'},{'cityName':'甘南藏族自治州'}]";
		var city24 = "[{'cityName':'福州市'},{'cityName':'莆田市'},{'cityName':'宁德市'},{'cityName':'南平市'},{'cityName':'三明市'},{'cityName':'龙岩市'},{'cityName':'厦门市'},{'cityName':'泉州市'},{'cityName':'漳州市'}]";
		var city25 = "[{'cityName':'拉萨市'},{'cityName':'那曲地区'},{'cityName':'昌都地区'},{'cityName':'山南地区'},{'cityName':'日喀则地区'},{'cityName':'阿里地区'},{'cityName':'林芝地区'}]";
		var city26 = "[{'cityName':'贵阳市'},{'cityName':'毕节地区'},{'cityName':'六盘水市'},{'cityName':'铜仁地区'},{'cityName':'黔东南苗族侗族自治州'},{'cityName':'黔南布依族苗族自治州'},{'cityName':'安顺市'},{'cityName':'黔西南布依族苗族自治州'},{'cityName':'遵义市'}]";
		var city27 = "[{'cityName':'沈阳市'},{'cityName':'辽阳市'},{'cityName':'铁岭市'},{'cityName':'抚顺市'},{'cityName':'鞍山市'},{'cityName':'营口市'},{'cityName':'大连市'},{'cityName':'本溪市'},{'cityName':'丹东市'},{'cityName':'锦州市'},{'cityName':'朝阳市'},{'cityName':'阜新市'},{'cityName':'盘锦市'},{'cityName':'葫芦岛市'}]";
		var city28 = "[{'cityName':'重庆市'}]";
		var city29 = "[{'cityName':'西安市'},{'cityName':'咸阳市'},{'cityName':'渭南市'},{'cityName':'延安市'},{'cityName':'榆林市'},{'cityName':'宝鸡市'},{'cityName':'汉中市'},{'cityName':'安康市'},{'cityName':'商洛市'},{'cityName':'铜川市'}]";
		var city30 = "[{'cityName':'西宁市'},{'cityName':'海东地区'},{'cityName':'黄南藏族自治州'},{'cityName':'海北藏族自治州'},{'cityName':'海南藏族自治州'},{'cityName':'果洛藏族自治州'},{'cityName':'玉树藏族自治州'},{'cityName':'海西蒙古族藏族自治州'}]";
		var city31 = "[{'cityName':'哈尔滨市'},{'cityName':'绥化市'},{'cityName':'伊春市'},{'cityName':'佳木斯市'},{'cityName':'鹤岗市'},{'cityName':'七台河市'},{'cityName':'双鸭山市'},{'cityName':'牡丹江市'},{'cityName':'鸡西市'},{'cityName':'齐齐哈尔市'},{'cityName':'大庆市'},{'cityName':'黑河市'},{'cityName':'大兴安岭地区'}]";

		var cities = [ city1, city2, city3, city4, city5, city6, city7, city8,
				city9, city10, city11, city12, city13, city14, city15, city16,
				city17, city18, city19, city20, city21, city22, city23, city24,
				city25, city26, city27, city28, city29, city30, city31 ];
		//	var provincesID = [ 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
		//	var citiesID={"1":[1,1,1,1],"2":[1,1,0,1],"3":[1,1,0,1],"4":[1,1,0,1],"5":[1,1,0,1],"6":[1,1,0,1],"7":[1,1,0,1],"8":[1,1,0,1],"9":[1,1,0,1],"10":[1,1,0,1],"11":[1,1,0,1],"12":[1,1,0,1],"13":[1,1,0,1],"14":[1,1,0,1],"15":[1,1,0,1],"16":[1,1,0,1],"17":[1,1,0,1],"18":[1,1,0,1],"19":[1,1,0,1],"20":[1,1,0,1],"21":[1,1,0,1],"22":[1,1,0,1],"23":[1,1,0,1],"24":[1,1,0,1],"25":[1,1,0,1],"26":[1,1,0,1],"27":[1,1,0,1],"28":[1,1,0,1],"29":[1,1,0,1],"30":[1,1,0,1],"31":[1,1,0,1]};
		eval("citiesID = " + $("#citiesID").val());
		eval("provincesID = " + $("#provincesID").val());
		eval("mlimitsID = " + $("#mlimitsID").val());
		eval("tlimitsID = " + $("#tlimitsID").val());
		var cps = ${allCps};
		var avacps = ${sgeForm.availCps};
		var totalsize = ${length};
		var avalength=0;
		var citiesIDflag;
		var provincesflag = 0;//标记是哪个省
		
		
		$(document).ready(function(e) {
			$("#addCps").attr('title',
					function(){
						var str="";
						for(key in avacps){
							str+=avacps[key]+" ";
							avalength++;
						}
					 return str;
			});
			checkProvinces();
		});
		
		function CpOrder(){
			document.getElementById("CpOrder").style.display = 'block';
			createOption();
			$("#total option").bind('dblclick', function(){	
				chooseItems(conditionForm.choices, conditionForm.selectcolumns);
			});	
			$("#avail option").bind('dblclick', function(){	
				chooseItems(conditionForm.selectcolumns, conditionForm.choices);
			});	
		}
		$("#chanceDate").on('click', function(){
			document.getElementById("CpOrder").style.display = 'none';
			$("#total").empty(); 
			 $("#avail").empty();
			
		});
		$("#clicksaveDate").on('click', function(){
			document.getElementById("CpOrder").style.display = 'none';
			var arrNo =[]; 
		    var xxx = document.getElementById('avail').options;
		    avalength=xxx.length;
		     if(xxx.length<=0){
		    	$("#type").val("0");
		    	$("#addCps").hide();
		    }
			for(var i=0;i<document.getElementById('avail').options.length;i++) {
				//arrId[i] = apps[xxx[i].value].id;
				arrNo[i]= xxx[i].value;
			}
			$("#total").empty(); 
			$("#avail").empty(); 
			/* sendAjax(1,arrId,arrNo); */
			avacps=[];
			for(var i=0;i<arrNo.length;i++) {
				avacps[arrNo[i]]=cps[arrNo[i]].name;
			}
		});
		/* function sendAjax( isDeployed,arr,arrNo){
			$.ajax({
						   	type:'post',         
						   	dataType:'json',  
						   	url: "mj/appsGateway-setup.do",
						   	data: {"gateId": $("#gateId").val(),"checkedAppIDS": JSON.stringify(arr),"isDeployed": isDeployed }, 
						   	success: function(message) {
								if(message == true)	{
									avapps=[];
									for(var i=0;i<arr.length;i++) {
										avapps[arrNo[i]]=apps[arrNo[i]].name;
									}
									$("#addApps").attr('title',
											function(){
												var str="";
												for(key in avapps){
													str+=avapps[key]+" "
												}
											 return str;
									});
								}else{
									alert(message.responseText);
								}
							 }, 
							 error : function() { 
								alert("服务器无响应.");
							}
			 	});
		} */
		function getCpIds(){
			var str="";
				for(keysm in avacps){
					str+=cps[keysm].id+",";
					}
					str = str.substring(0, str.length-1);
					return str;
		}
		//初始化城市
		function checkProvinces() {
			if (provincesID[0] == 1) {
				document.getElementById("Allselected").checked = true;
				for (var i = 1; i <= 31; i++) {
					document.getElementById("checkboxcity" + i).checked = true;
					createCity(i);
					if(mlimitsID[i]==0)
						document.getElementById("LimitProM" + i).value="";
					else
						document.getElementById("LimitProM" + i).value=mlimitsID[i];
					if(tlimitsID[i]==0)
						document.getElementById("LimitProT" + i).value="";
					else
						document.getElementById("LimitProT" + i).value=tlimitsID[i];
					var city = eval(cities[i - 1]);
					for ( var j = 1; j <= city.length; j++) {
						if (citiesID[i][j] == 1)
							document
									.getElementById("checkCityId" + i + "_" + j).checked = true;
					}
					document.getElementById("inputSelect" + i).checked = true;
				}
			} else {
				for (var i = 1; i <= 31; i++) {
					if (provincesID[i] == 1) {
						document.getElementById("checkboxcity" + i).checked = true;
						createCity(i);
						if(mlimitsID[i]==0)
							document.getElementById("LimitProM" + i).value="";
						else
							document.getElementById("LimitProM" + i).value=mlimitsID[i];
						if(tlimitsID[i]==0)
							document.getElementById("LimitProT" + i).value="";
						else
							document.getElementById("LimitProT" + i).value=tlimitsID[i];
						var city = eval(cities[i - 1]);
						for ( var j = 1; j <= city.length; j++) {
							if (citiesID[i][j] == 1)
								document.getElementById("checkCityId" + i + "_"
										+ j).checked = true;
						}
					}
				}
			}
		}

		//选择单个省打开城市
		function checkCity(i) {
			var Provinces_city = document.getElementById("Provinces_" + i);
			if (Provinces_city == null){
				createCity(i);
				if(mlimitsID[i]==0)
					document.getElementById("LimitProM" + i).value="";
				else
					document.getElementById("LimitProM" + i).value=mlimitsID[i];
				if(tlimitsID[i]==0)
					document.getElementById("LimitProT" + i).value="";
				else
					document.getElementById("LimitProT" + i).value=tlimitsID[i];
				}
				
			console.log(Provinces_city);
			document.getElementById("Provinces_" + i).style.display = "block";
			citiesIDflag = citiesID;
			$(".cancleCity")
					.bind(
							'click',
							function() {
								document.getElementById("Provinces_" + i).style.display = "none";
								citiesID = citiesIDflag;

							});
			$(".saveCity")
					.bind(
							'click',
							function() {
								var city = eval(cities[i - 1]);
								var flag = 0;
								for (var j = 1; j <= city.length; j++) {
									if (document.getElementById("checkCityId"
											+ i + "_" + j).checked == true) {
										document.getElementById("checkboxcity"
												+ i).checked = true;
										console.log("1");
										flag = 1;
										provincesID[i] = 1;
										citiesID[i][j] = 1;
										for ( var z = 1; z <= 31; z++) {
											if (document
													.getElementById("checkboxcity"
															+ z).checked == false) {
												document
														.getElementById("Allselected").checked = false;
												break;
											} else {
												provincesID[i] = 1;
												document
														.getElementById("Allselected").checked = true;
											}
										}
									} else {
										citiesID[i][j] = 0;
									}
								}
								if (flag == 0) {
									document.getElementById("checkboxcity" + i).checked = false;
									document.getElementById("Allselected").checked = false;
									provincesID[i] = 0;
								}
								if(document.getElementById("LimitProM" + i).value!=""){
									mlimitsID[i]=document.getElementById("LimitProM" + i).value;
								}else{
									mlimitsID[i]=0;
								}
								if(document.getElementById("LimitProT" + i).value!=""){
									tlimitsID[i]=document.getElementById("LimitProT" + i).value;
								}else{
									tlimitsID[i]=0;
								}
								document.getElementById("Provinces_" + i).style.display = "none";
							});
			$(".inputSelect")
					.bind(
							'click',
							function() {
								var selectAllCity = document
										.getElementById("inputSelect" + i);
								if (selectAllCity.checked == false) {
									selectAllCity.checked = false;
									var city = eval(cities[i - 1]);
									for (var j = 1; j <= city.length; j++) {
										document.getElementById("checkCityId"
												+ i + "_" + j).checked = false;
										citiesID[i][j] = 0;
									}
									document.getElementById("inputSelect" + i).checked = false;

								} else {
									selectAllCity.checked = true;
									var city = eval(cities[i - 1]);
									for (var j = 1; j <= city.length; j++) {
										document.getElementById("checkCityId"
												+ i + "_" + j).checked = true;
										citiesID[i][j] = 1;
									}
									document.getElementById("inputSelect" + i).checked = true;

								}

							});

			provincesflag = i;
		}

		//选择单个省
		function SelectAllCity(i) {
			var Provinces_city = document.getElementById("Provinces_" + i);
			if (Provinces_city == null){
				createCity(i);
				if(mlimitsID[i]==0)
					document.getElementById("LimitProM" + i).value="";
				else
					document.getElementById("LimitProM" + i).value=mlimitsID[i];
				if(tlimitsID[i]==0)
					document.getElementById("LimitProT" + i).value="";
				else
					document.getElementById("LimitProT" + i).value=tlimitsID[i];
			}
			var selectCity = document.getElementById("checkboxcity" + i);
			if (selectCity.checked == false) {
				selectCity.checked = false;
				provincesID[i] = 0;
				var city = eval(cities[i - 1]);
				for ( var j = 1; j <= city.length; j++) {
					document.getElementById("checkCityId" + i + "_" + j).checked = false;
					citiesID[i][j] = 0;
				}
				document.getElementById("inputSelect" + i).checked = false;
				document.getElementById("Allselected").checked = false;
				provincesID[0] = 0;
			} else {
				selectCity.checked = true;
				provincesID[i] = 1;
				var city = eval(cities[i - 1]);
				for ( var j = 1; j <= city.length; j++) {
					document.getElementById("checkCityId" + i + "_" + j).checked = true;
					citiesID[i][j] = 1;
				}
				document.getElementById("inputSelect" + i).checked = true;
				for ( var z = 1; z < provincesID.length; z++) {
					if (document.getElementById("checkboxcity" + z).checked == false) {
						document.getElementById("Allselected").checked = false;
						provincesID[0] = 0;
						break;
					} else {
						provincesID[0] = 1;
						document.getElementById("Allselected").checked = true;
					}
				}

			}

		}

		//全选
		$("#Allselected")
				.on(
						'click',
						function() {
							var check_p = document
									.getElementById("Allselected");
							provincesID[0] = 0;
							if (check_p.checked == false) {
								check_p.checked = false;
								for (var i = 1; i <= 31; i++) {
									document.getElementById("checkboxcity" + i).checked = false;
									var city = eval(cities[i - 1]);
									for (var j = 1; j <= city.length; j++) {
										document.getElementById("checkCityId"
												+ i + "_" + j).checked = false;
									}
									document.getElementById("inputSelect" + i).checked = false;
									provincesID[i] = 0;
									for (var z = 0; z <= 55; z++) {
										citiesID[i][z] = 0;
									}
								}

							} else {
								check_p.checked = true;
								provincesID[0] = 1;
								for (i = 1; i <= 31; i++) {
									document.getElementById("checkboxcity" + i).checked = true;
									var Provinces_city = document
											.getElementById("Provinces_" + i);
									if (Provinces_city == null)
										createCity(i);
									var city = eval(cities[i - 1]);
									for (j = 1; j <= city.length; j++) {
										document.getElementById("checkCityId"
												+ i + "_" + j).checked = true;
									}
									document.getElementById("inputSelect" + i).checked = true;
									provincesID[i] = 1;
									for (z = 0; z <= 55; z++) {
										citiesID[i][z] = 1;
									}
								}

							}

						});

		//选择单个城市	
		function selectSingleCity(i) {
			var city = eval(cities[provincesflag - 1]);
			if (document
					.getElementById("checkCityId" + provincesflag + "_" + i).checked == false)
				document.getElementById("inputSelect" + provincesflag).checked = false;
			else {
				var city = eval(cities[provincesflag - 1]);
				for ( var j = 1; j <= city.length; j++) {
					if (document.getElementById("checkCityId" + provincesflag
							+ "_" + j).checked == false) {
						document.getElementById("inputSelect" + provincesflag).checked = false;
						break;
					} else
						document.getElementById("inputSelect" + provincesflag).checked = true;
				}
			}

		}

		//保存表单	
		$("#saveData").on('click', function() {
			var prov = "[" + provincesID + "]";
			var mlimit = "["+mlimitsID+"]";
			var tlimit = "["+tlimitsID+"]";
			var city = JSON.stringify(citiesID);
			$("#provincesID").val(prov);
			$("#citiesID").val(city);
			$("#mlimitsID").val(mlimit);
			$("#tlimitsID").val(tlimit);
		});

		//创建城市	
		function createCity(i) {

			var CityName = {
				'0' : "",
				'1' : "上海市",
				'2' : "云南省",
				'3' : "内蒙古",
				'4' : "北京市",
				'5' : "吉林省",
				'6' : "四川省",
				'7' : "天津市",
				'8' : "宁夏",
				'9' : "安徽省",
				'10' : "山东省",
				'11' : "山西省",
				'12' : "广东省",
				'13' : "广西",
				'14' : "新疆",
				'15' : "江苏省",
				'16' : "江西省",
				'17' : "河北省",
				'18' : "河南省",
				'19' : "浙江省",
				'20' : "海南省",
				'21' : "湖北省",
				'22' : "湖南省",
				'23' : "甘肃省",
				'24' : "福建省",
				'25' : "西藏",
				'26' : "贵州省",
				'27' : "辽宁省",
				'28' : "重庆市",
				'29' : "陕西省",
				'30' : "青海省",
				'31' : "黑龙江"
			};
			var vProvincesBg = document.createElement("div");
			var vProvinces = document.createElement("div");
			var vPtitle = document.createElement("div");
			var vPname1 = document.createElement("span");
			var vPname2 = document.createElement("span");
			var vOpenProvinces = document.createElement("form");
			var vSection = document.createElement("section");
			var vOpencity = document.createElement("section");
			var vInputSelectAll = document.createElement("input");
			var vLabelSelectAll = document.createElement("label");
			var vLabelLimitM = document.createElement("span");
			var vLimitProM = document.createElement("input");
			var vLabelLimitT = document.createElement("span");
			var vLimitProT = document.createElement("input");
			var vSaveCity = document.createElement("button");
			var vCancleCity = document.createElement("button");
			var vdiv = document.createElement("div");
			vProvincesBg.setAttribute("class", "provinces_bg");
			vProvincesBg.setAttribute("id", "Provinces_" + i);
			vProvinces.setAttribute("class", "provinces");
			vPtitle.setAttribute("class", "title");
			vPtitle.setAttribute("class", "provinces_title");
			vPname1.innerHTML = '选择开启的城市>>';
			vPname2.innerHTML = CityName[i];
			vOpenProvinces.setAttribute("class", "openProvinces");
			vInputSelectAll.setAttribute("type", "checkbox");
			vInputSelectAll.setAttribute("class", "inputSelect");
			vInputSelectAll.setAttribute("id", "inputSelect" + i);
			vLabelSelectAll.innerHTML = '全选';
			vOpencity.setAttribute("id", "Opencity" + i);
			vOpencity.setAttribute("class", "openCity");
			
			vLimitProT.setAttribute("id", "LimitProT"+i);
			vLimitProT.setAttribute("class", "limitPro");
			vLimitProT.setAttribute("type", "text");
			
			vLabelLimitT.innerHTML=':省份日上限';
			vLabelLimitT.setAttribute("class","lableLimit");
			
			vLimitProM.setAttribute("id", "LimitProM"+i);
			vLimitProM.setAttribute("class", "limitPro");
			vLimitProM.setAttribute("type", "text");
			
			vLabelLimitM.innerHTML=':省份月上限';
			vLabelLimitM.setAttribute("class","lableLimit");
			
			vSaveCity.setAttribute("class", "saveCity");
			vSaveCity.innerHTML = '确定';
			vCancleCity.setAttribute("class", "cancleCity");
			vCancleCity.innerHTML = '返回';
			vSection.appendChild(vInputSelectAll);
			vSection.appendChild(vLabelSelectAll);
			
			vOpenProvinces.appendChild(vSection);
			vOpenProvinces.appendChild(vOpencity);

			vPtitle.appendChild(vPname1);
			vPtitle.appendChild(vPname2);

			vProvinces.appendChild(vPtitle);
			vProvinces.appendChild(vOpenProvinces);
			vProvinces.appendChild(vLimitProT);
			vProvinces.appendChild(vLabelLimitT);
			vProvinces.appendChild(vdiv);
			vProvinces.appendChild(vLimitProM);
			vProvinces.appendChild(vLabelLimitM);
			vProvinces.appendChild(vdiv);
			vProvinces.appendChild(vSaveCity);
			vProvinces.appendChild(vCancleCity);

			vProvincesBg.appendChild(vProvinces);
			$("#inputForm").after(vProvincesBg);
			var channel = null;
			channel = eval(cities[i - 1]);
			for ( var j = 1; j <= channel.length; j++) {
				var cInput = document.createElement("input");
				cInput.setAttribute("type", "checkbox");
				cInput.setAttribute("class", "checkCity");
				cInput.setAttribute("id", "checkCityId" + i + "_" + j);
				cInput.setAttribute("onClick", "javascript:selectSingleCity("
						+ j + ");");
				var cOpenCity = document.getElementById("Opencity" + i);
				var name = channel[j - 1].cityName;
				cOpenCity.appendChild(cInput);
				$(cInput).after(name);
			}
		}
		function createOption(i) {
			var ii=0;
			for(key in avacps)
			{   ii++;
	   		 	var vTotalOption=document.createElement("option");
				vTotalOption.innerHTML = cps[key].name+"("+key+")";
				vTotalOption.value = key;
				document.getElementById('avail').appendChild(vTotalOption);   
			} 
			$("#cpChoice").val("");
			if(totalsize!=ii) {
				var left = new Array();
				for(key in cps){
					var flag = false;
					for(key1 in avacps){
						if(key==key1){
							flag = true;
							break;
						}
					}
					if(!flag) {
						left[left.length] = key;
					}
				}
				var map = {};
				left.sort();
				for(var j =0;j<left.length;j++){
					var key2 = left[j];
					var value = cps[key2].name;
					map[key2] = value;
				} 
				for(key in map)
				{   
		   		 	var vTotalOption=document.createElement("option");
					vTotalOption.innerHTML = map[key]+"("+key+")";
					vTotalOption.value = key;
					document.getElementById('total').appendChild(vTotalOption);   
				} 
				
				}
			}
			
	function submitForm1(url){
		var prov = "[" + provincesID + "]";
		var mlimit = "["+mlimitsID+"]";
		var tlimit = "["+tlimitsID+"]";
		var city = JSON.stringify(citiesID);
		$("#provincesID").val(prov);
		$("#citiesID").val(city);
		$("#mlimitsID").val(mlimit);
		$("#tlimitsID").val(tlimit);
		$('#inputForm').form(
		'submit',
		{
			url : url,
			onSubmit : function() {
				var flag = $(this).form('validate');
				if (flag) {
					if(avalength==0)
							$("#avaLength").val("0");
						else
							$("#avaLength").val("1");
						$("#cpIds").val(getCpIds());
						if($('#type option:selected') .val()==0)
							$("#cpIds").val("");
						else if($('#type option:selected') .val()==1){
							if(getCpIds()==""){
								alert("未分配任何应用");
								return false;
							}
						}
					showProcess(true, market.content.title,	market.content.submitting);
				}
				return flag;
			},
			success : function(data) {
				showProcess(false);
				var data = eval('(' + data + ')');
				if (data.return_code == '1') {
					top.showMsg(market.content.title, data.return_msg, alert);
					if (parent !== undefined) {
						if ($.isFunction(parent.reloadParent)) {
							parent.reloadParent.call();
							parent.closeMyWindow();
						} else {
							parent.$("#serach").click();
							parent.closeMyWindow();
						}
					}
					//window.parent.$('#tabs').tabs('close',"通道修改-"+$('#name').val());
				}else{
					$.messager.alert('Waring',data.return_msg,"warning", null);
				}
				
			},
			onLoadError : function() {
				showProcess(false);
				$.messager.alert('Error',"服务器异常","error", null);
			}
		});
	}
	</script>
</body>
</html>


