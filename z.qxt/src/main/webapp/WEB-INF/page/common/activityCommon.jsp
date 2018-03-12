<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title></title>
<base href="${contextPath }/" />
<link rel="stylesheet" href="resources/plugs/bootstrap-datetimepicker.min.css"/>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" href="resources/plugs/bootstrap-select.css" />
<script src="resources/plugs/bootstrap-select.js"></script>
</head>
<body>
  <div class="form-group">
       <label class="col-lg-3 control-label">活动开始时间：</label>
       <div class="col-lg-5">
          <input class="form-control activity_datetime_start"  type="text" name="startDateStr" id="start"／>
       </div>
   </div>
    <div class="form-group bootstrap-timepicker" >
       <label class="col-lg-3 control-label">活动结束时间(不填代表不限时)：</label>
       <div class="col-lg-5">
          <input class="form-control activity_datetime_end"  type="text" name="endDateStr" id="end"／>
       </div>
   </div>
      <script type="text/javascript">
      $('.activity_datetime_start').datetimepicker({	
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        format: 'yyyy-mm-dd hh:ii:ss'
    }).on('changeDate',function(ev){
    	var startTime = $("#start").val();
    	$('.activity_datetime_end').datetimepicker('setStartDate',startTime);
    });
      
    $('.activity_datetime_end').datetimepicker({	
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        format: 'yyyy-mm-dd hh:ii:ss'
    }).on('changeDate',function(ev){
    	var startTime = $("#start").val();
    	var endTime = $("#end").val();
    	if(startTime ==""){
    		$("#end").val("");
    		alert("请先选择开始时间");
    	}else{
    		/* if(startTime>endTime){
    			$("#end").val("");
    			alert("结束时间应该要大于开始时间");
    		}else{
    			$('.activity_datetime_start').datetimepicker('setEndDate',endTime);
    		} */
    		$('.activity_datetime_start').datetimepicker('setEndDate',endTime);
    	}
    });
</script>
</body>