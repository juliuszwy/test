<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<script type="text/javascript">
var chart;
var chartData1 = ${cpAppTotalForms};
var chartData2 = ${cpDitchTotalForms};
$(document).ready(function() {
         chart = new AmCharts.AmPieChart();
                chart.dataProvider = chartData1;
                chart.addTitle("游戏占比(新增用户)", 16);
                chart.titleField = "appName";
                chart.valueField = "newUsers";
                chart.outlineColor = "#FFFFFF";
                chart.outlineAlpha = 0.8;
                chart.outlineThickness = 2;
                chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // this makes the chart 3D
                chart.depth3D = 10;
                chart.angle = 25;
                chart.minRadius = 100;
                chart.write("newAddChartDiv");
                
                
                
                chart = new AmCharts.AmPieChart();
                chart.dataProvider = chartData1;
                chart.addTitle("游戏占比(信息费)", 16);
                chart.titleField = "appName";
                chart.valueField = "mrTotal";
                chart.outlineColor = "#FFFFFF";
                chart.outlineAlpha = 0.8;
                chart.outlineThickness = 2;
                chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // this makes the chart 3D
                chart.depth3D = 10;
                chart.angle = 25;
                chart.minRadius = 100;

                chart.write("mrNewAddChartDiv");
                
                
                chart = new AmCharts.AmPieChart();
                chart.dataProvider = chartData2;
                chart.addTitle("渠道占比(新增用户)", 16);
                chart.titleField = "ditch";
                chart.valueField = "mrTotal";
                chart.outlineColor = "#FFFFFF";
                chart.outlineAlpha = 0.8;
                chart.outlineThickness = 2;
                chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // this makes the chart 3D
                chart.depth3D = 10;
                chart.angle = 25;
                chart.minRadius = 100;

                chart.write("chCompanyNewAddChartDiv");
                
                
                
                chart = new AmCharts.AmPieChart();
                chart.dataProvider = chartData2;
                chart.addTitle("渠道占比(信息费)", 16);
                chart.titleField = "ditch";
                chart.valueField = "mrTotal";
                chart.outlineColor = "#FFFFFF";
                chart.outlineAlpha = 0.8;
                chart.outlineThickness = 2;
                chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
                // this makes the chart 3D
                chart.depth3D = 10;
                chart.angle = 25;
                chart.minRadius = 100;

                chart.write("chCompanyMrChartDiv");
                
         });

</script>
</head>
<body>
<div id="newAddChartDiv" style="margin-top: 0px; margin-left: 0px; width: 491px; height: 350px; border: 10px; float: left; overflow: hidden; text-align: left;"></div>
<div id="mrNewAddChartDiv" style="margin-top: 0px; margin-right: 0px; width: 491px; height: 350px; border: 10px; float: right; overflow: hidden; text-align: left;"></div>
<div id="chCompanyNewAddChartDiv" style="margin-top: 4px; margin-left: 0px; width: 491px; height: 350px; border: 10px; float: left; overflow: hidden; text-align: left;"></div>
<div id="chCompanyMrChartDiv" style="margin-top: 4px; margin-left: 0px; width: 491px; height: 350px; border: 10px; float: right; overflow: hidden; text-align: left;"></div>
</body>
</html>
