<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />

<html>
<head>
<title>订单详情</title>
<link rel="stylesheet" href="resources/plugs/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="resources/plugs/bootstrap-select.css" />
<script src="resources/plugs/bootstrap-select.js"></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="resources/js/amcharts/amcharts.js"></script>
<script src="resources/js/amcharts/pie.js"></script>
<script>
</script>
</head>

<body>
						
	<div class="page-content">
			<div class="page-content-area">
					<div class="row">
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header">
									<h5 class="widget-title">
											<i class="ace-icon fa fa-signal"></i>
											数据图表分析(不包括卡片推广数据)
									</h5> 
									<div class="widget-toolbar no-border">
											<div class="inline dropdown-hover">
												<button class="btn btn-minier btn-primary">
													<span>近一周</span>
													<i class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
												</button>
												<ul class="channelPie dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
													<li class="active">
														<a href="javascript:void(0);" class="blue" onclick="drawRange(1,this)">
															<i class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>
															<span>近一周</span>
														</a>
													</li>
													<li>
														<a href="javascript:void(0);"onclick="drawRange(15,this)">
															<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
															<span>近半月</span>
														</a>
													</li>
													<li>
														<a href="javascript:void(0);"onclick="drawRange(30,this)">
															<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
															<span>近一月</span>
														</a>
													</li>
												</ul>
											</div>
									</div>
								</div>
								<div class="widget-body">
									<div class="widget-main">
									<div class="row">
										<div class="col-sm-6">
											<div id="scanCountCharts" style="width: 100%; height: 300px;"></div>
										</div>
										<div class="col-sm-6">
											<div id="activatedCountCharts" style="width: 100%; height: 300px;"></div>
										</div>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					    <div class="col-xs-12">
						    <div class="widget-box">
							    <div class="widget-header">
									<h4 class="smaller">
										推广数据清单
									</h4>
								</div>
								<div class="widget-body">
									<div class="widget-main">
										<div id="toolbar" class="btn-group">
							                <div class="input-group date  col-md-12"  style="margin-top:0px positon:relative">
							                	<span class="input-group-addon" style="width: 120px">开始时间：</span> 
							                    <input class="form-control form_datetime_start" size="16" type="text" value=""  id="start">
							                    <span class="input-group-addon" style="width: 120px">结束时间：</span> 
							                    <input class="form-control form_datetime_end" id ="end"size="16" type="text" value="" >
							                	<span class="input-group-addon" style="width: 120px">渠道ID：</span> 
									            <input type="text" class="form-control" id="qudaoIdSearch" placeholder="请输入字段名"/> 
												 <span class="input-group-btn">  
									               <button class="btn btn-info btn-search" id="search">查找</button>  
									            </span>  
									            <span class="input-group-btn" style="padding-left: 20px">  
									               <button class="btn btn-info btn-search"  onclick="exportChannelData()">导出</button>  
									            </span> 
							                </div>
										</div>
										<table id="table" >
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
</body>
<script type="text/javascript">
$('.form_datetime_start').datetimepicker({	
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
        format: 'yyyy-mm-dd'
    });
    $('.form_datetime_end').datetimepicker({	
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
        format: 'yyyy-mm-dd'
    });
    function exportChannelData(){
        var url="channelCount/export?limit=10000&filter_EQS_qudaoId="+$("#qudaoIdSearch").val()+
        "&filter_EQS_agentId=${param['agentId']}&filter_GED_date="+$("#start").val()+"&filter_LTD_date="+$("#end").val();
        //window.open(url);
        location.href=url;
    }
 //得到查询的参数
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_EQS_qudaoId:$("#qudaoIdSearch").val(),
		/* agentId:$("#agentIdSearch").val(), */
		filter_EQS_agentId:"${param['agentId']}",
		filter_GED_date:$("#start").val(),
		filter_LTD_date:$("#end").val(),
		order: params.order,//排序
        sort:params.sort//排序字段
  };
  return temp;
};
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table.bootstrapTable({
    url: "channelCount/list?json", 
    dataType: "json",
    queryParams:getParams,
    showFooter:true,
    pagination: true, //分页
    pageSize: 15,      //每页的记录行数（*）
    pageList: [15, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
                {
                    title: '渠道ID',
                    field: 'qudaoId',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(){
                  		return "总计";
                  	}
                },
                {
                    title: '扫码数',
                    field: 'scanNum',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].scanNum;
				        }
				        return count;
                 	}
                },
                {
                    title: '激活数(扫码)',
                    field: 'scanActivateNum',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                 		var count = 0;
				        for (var i in value) {
				            count += value[i].scanActivateNum;
				        }
				        return count;
                 	}
                },
                /* {
                    title: '活跃数(扫码)',
                    field: 'scanActiveNum',
                    align: 'center',
                   	halign:'center',
                   	sortable : true
                }, */
                {
                    title: '推广成功总用户',
                    field: 'activatedNum',
                    align: 'center',
                   	halign:'center',
                  	footerFormatter: function(value){
                		 var count = 0;
				        for (var i in value) {
				            count += value[i].activatedNum;
				        }
				        return count;
	                 }
                },
                {
                    title: '流水',
                    field: 'price',
                    align: 'center',
                   	halign:'center',
                   footerFormatter: function(value){
                		var count = 0;
				        for (var i in value) {
				            count += value[i].price;
				        }
				        return count;
	                 }
                },
                {
                    title: '时间',
                    field: 'dateStr',
                    align: 'center',
                   	halign:'center'
                }
    	 ]
});
}
var scanChart;
var activatedChart;
 function createScanChart (data) {
 	if(scanChart=="undefined"||scanChart==null){
	  var legend;
      // PIE CHART
      scanChart = new AmCharts.AmPieChart();
      scanChart.dataProvider = data;
      scanChart.addTitle("扫码数", 16);
      scanChart.titleField = "name";
      scanChart.valueField = "scanCount";
 	  scanChart.outlineColor = "#FFFFFF";
      scanChart.outlineAlpha = 0.8;
      scanChart.outlineThickness = 2;
      scanChart.depth3D = 10;
      scanChart.angle = 25;
      scanChart.minRadius = 90;
      // LEGEND
      legend = new AmCharts.AmLegend();
      legend.align = "center";
      legend.markerType = "circle";
      scanChart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
      scanChart.addLegend(legend);

      // WRITE
      scanChart.write("scanCountCharts");
      }else{
      		scanChart.dataProvider = data;
			scanChart.validateNow();
			scanChart.validateData();
      }
  };
 function createActivatedChart (data) {
 if(activatedChart=="undefined"||activatedChart==null){
	  var legend;
      // PIE CHART
      activatedChart = new AmCharts.AmPieChart();
      activatedChart.dataProvider = data;
      activatedChart.addTitle("激活数", 16);
      activatedChart.titleField = "name";
      activatedChart.valueField = "activatedCount";
 	  activatedChart.outlineColor = "#FFFFFF";
      activatedChart.outlineAlpha = 0.8;
      activatedChart.outlineThickness = 2;
      activatedChart.depth3D = 10;
      activatedChart.angle = 25;
      activatedChart.minRadius = 90;
      // LEGEND
      legend = new AmCharts.AmLegend();
      legend.align = "center";
      legend.markerType = "circle";
      activatedChart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
      activatedChart.addLegend(legend);
      // WRITE
      activatedChart.write("activatedCountCharts");
       }else{
      		activatedChart.dataProvider = data;
			activatedChart.validateNow();
			activatedChart.validateData();
      }
  };
$(document).ready(function () {          
      initTable();  
      $("#search").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });  
      activatedChart=null;
      scanChart = null;
      drowCharts(7);
     
});  

function drowCharts(day){
	 $.ajax({
              url: "channelCount/pieData?day="+day,
              type: "get",
              dataType: "json",
              success: function (result){
              	 var json = eval(result);
             	 createScanChart(json);
   				 createActivatedChart(json);
              }
	     });
}
function drawRange(day,obj){
	var button = $(".channelPie").prev();
	var active = $(".channelPie").find(".active");
	active.removeClass("active");
	active.find("a").removeClass("blue")
	active.find("i").addClass("invisible");
	
	$(obj).parent("li").addClass("active");
	$(obj).addClass("blue")
	$(obj).find("i").removeClass("invisible");
  	button.find("span").html($(obj).find("span").html());
	drowCharts(day);
}
</script>
</html>
