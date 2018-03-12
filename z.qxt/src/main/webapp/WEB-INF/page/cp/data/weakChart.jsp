<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<script type="text/javascript">
var chart;
var chartData = ${cpTotalForms};
$(document).ready(function() {
         chart = new AmCharts.AmSerialChart();
         chart.dataProvider = chartData;
         chart.categoryField = "date";
         chart.startDuration = 0.1;
         chart.balloon.color = "#000000";
		 chart.fontSize = 18;
		 chart.fontFamily = 'Covered By Your Grace';
		 chart.marginLeft = 117;
         var categoryAxis = chart.categoryAxis;
         categoryAxis.fillAlpha = 1;
         categoryAxis.fillColor = "#FAFAFA";
         categoryAxis.gridAlpha = 0.5;
         categoryAxis.axisAlpha = 0.5;
         categoryAxis.gridPosition = "start";
	     categoryAxis.labelRotation = 45;
           // value
           var valueAxis1 = new AmCharts.ValueAxis();
		   valueAxis1.axisColor = "#FCD202";
           valueAxis1.axisThickness = 2;
           valueAxis1.gridAlpha = 0;
           chart.addValueAxis(valueAxis1);
           
           var valueAxis2 = new AmCharts.ValueAxis();
		   valueAxis2.position = "right"; 
           valueAxis2.axisColor = "#FF6600";
           valueAxis2.gridAlpha = 0;
           chart.addValueAxis(valueAxis2);
       
           // GRAPHS
           // Italy graph						            		
           var graph = new AmCharts.AmGraph();
           graph.valueAxis = valueAxis2; 
           graph.title = "新增用户";
           graph.valueField = "newUsers";
           graph.hidden = true;        
           graph.balloonText = "新增用户 [[category]]: [[value]]";
           graph.lineAlpha = 1;
           graph.bullet = "round"; 
           chart.addGraph(graph);
       
           // Germany graph
           var graph = new AmCharts.AmGraph();
           graph.valueAxis = valueAxis1; 
           graph.title = "信息费";
           graph.valueField = "mrTotal";
           graph.balloonText = "信息费 [[category]]: [[value]]";
           graph.bullet = "round";
           chart.addGraph(graph);
       
           // United Kingdom graph
           var graph = new AmCharts.AmGraph();
           graph.valueAxis = valueAxis1; 
           graph.title = "收入";
           graph.valueField = "finalSumTotal";
           graph.balloonText = "收入 [[category]]: [[value]]";
           graph.bullet = "round";
           chart.addGraph(graph);
           
           // CURSOR
           var chartCursor = new AmCharts.ChartCursor();
           chartCursor.cursorPosition = "mouse";
           chartCursor.zoomable = false;
           chartCursor.cursorAlpha = 0;
           chart.addChartCursor(chartCursor);                
       
           // LEGEND
           var legend = new AmCharts.AmLegend();
           legend.useGraphSettings = true;
           chart.addLegend(legend);
       
           // WRITE
           chart.write("homeDataSummaryChartDiv");
            
         });

</script>
</head>
<body>
	<div id="homeDataSummaryChartDiv" class="data-show" style="height: 400px; overflow: hidden; text-align: left;">
	</div>
</body>
</html>
