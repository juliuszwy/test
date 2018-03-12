<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<base href="${contextPath }/" />
<body>
<div class="panel-body" >
	<form id="spAdd_form" method="post" class="registerform">
		<div class="tableWarp">
		    <table>
		    	<tbody>
			        <tr>
			            <td><label for="time" class="label">屏蔽时间(例：02-11|20-24):</label></td>
			            <td><input id="time"  type="text"  class="inputxt" value="${param['value'] }"></input></td>
			        </tr>
			    </tbody>
		    </table>
		    <div style="margin-left:150px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="确认" onclick="timeSave()"></input>
		        <input id="btn_reset" type="button"class="btn W80" value="重置"></input>
		    </div>
	    </div>
	</form>
</div>
<script type="text/javascript">
function timeSave(){
	var  spProCommon = $("#spProCommon");
	spProCommon.jrDialog("close");
	var pro = "${param['pro'] }";
	spPros[pro].timeQuantum = $("#time").val();
	if($("#time").val()!='')
		$("#time_"+pro).attr("class","city_A red");
	else{$("#time_"+pro).attr("class","city_A blueSmall");}
};
$(document).ready(function() {
});
 
</script>
</body>
</html>