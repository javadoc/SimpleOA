<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.sun.entity.PageUser" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String uid = request.getParameter("uid");
	PageUser pageUser = (PageUser)request.getSession().getAttribute("pageUser");
 %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>Html日历插件</title>

<style type="text/css">
/*第一种，左侧可以调节，右侧固定。   ====该种适合用于消息查看，联系人信息查看。*/
/*.right{position: absolute;left: 70%;top: 5px;}*/
/*第二种，普通的中分布局，类似百度那种*/
.left {	float: left;width: 70%;}
.right {margin-left: 70%;}
.right .notice {width: 80%;margin-top: 20px;margin-left: 10%;border-color: #58ACED;}
.calenderDiv {position: absolute;top: 5px;left: 3px;right: 30%;float: left;}
.one-mission{margin-left:10px;}
#content{}
</style>


<style type="text/css">
	.index-content{width:99%;height: 99%;border: none;}
	#body{background-color:#efefef}#CalendarMain{width:85%;height:440px;border:1px solid #ccc;margin-top:10px;margin-left:10px}#title{width:100%;height:30px;background-color:#0085B5}.selectBtn{font-weight:900;font-size:15px;color:#fff;cursor:pointer;text-decoration:none;padding:7px 10px 6px 10px}.selectBtn:hover{background-color:#12a663}.selectYear{float:left;margin-left:50px;position:absolute}.selectMonth{float:left;margin-left:120px;position:absolute}.month{float:left;position:absolute}.nextMonth{float:right}.currentDay{float:right}#context{background-color:#fff;width:100%}.week{width:100%;height:30px}.week>h3{float:left;color:#808080;text-align:center;margin:0;padding:0;margin-top:5px;font-size:16px}.dayItem{float:left}.lastItem a{color:#d1c7b7!important;}.item{color:#333;float:left;text-align:center;cursor:pointer;margin:0;font-family:"微软雅黑";font-size:13px}.item:hover{color:#b9121b}.currentItem>a{background-color:#b9121b;width:25px;line-height:25px;float:left;-webkit-border-radius:50%;-moz-border-radius:50%;border-radius:50%;color:#fff}#foots{width:100%;height:35px;background-color:#fff;border-top:1px solid #ccc;margin-top:-1px}#footNow{float:left;margin:6px 0 0 5px;color:#009ad6;font-family:"微软雅黑"}#Container{overflow:hidden;float:left}#center{width:100%;overflow:hidden}#centerMain{width:300%;margin-left:-100%}#selectYearDiv{float:left;background-color:#fff}#selectYearDiv>div{float:left;text-align:center;font-family:"微软雅黑";font-size:16px;border:1px solid #ccc;margin-left:-1px;margin-top:-1px;cursor:pointer;color:#909090}.currentYearSd,.currentMontSd{color:#f40!important}#selectMonthDiv{float:left;background-color:#fff}#selectMonthDiv>div{color:#909090;float:left;text-align:center;font-family:"微软雅黑";font-size:16px;border:1px solid #ccc;margin-left:-1px;margin-top:-1px;cursor:pointer}#selectYearDiv>div:hover,#selectMonthDiv>div:hover{background-color:#efefef}#centerCalendarMain{float:left}
	.onwork{background:url(<%=path%>/jics/images/right.png) no-repeat;background-position: center;}
	.onabsent{background:url(<%=path%>/jics/images/wrong.png) no-repeat;background-position: center;}
	.workdays{float:right}
	.m-layer{}
	.hidden{display:none;visibility:hidden}
</style>



</head>
<body id="body">
<!-- 	.showDateDetail{z-index:9999999;position:relative;top:20%;left:10%;right:50%;background:rgba(111,111,111,0.5)} -->
<div class="index-content">
	<div class="left">
		<div class="calenderDiv">
			<div id="CalendarMain">
				<div id="title">
					<a class="selectBtn month" href="javascript:"
						onclick="CalendarHandler.CalculateLastMonthDays();"><</a><a
						class="selectBtn selectYear" href="javascript:"
						onClick="CalendarHandler.CreateSelectYear(CalendarHandler.showYearStart);">2014年</a><a
						class="selectBtn selectMonth"
						onClick="CalendarHandler.CreateSelectMonth()">6月</a> <a
						class="selectBtn nextMonth" href="javascript:"
						onClick="CalendarHandler.CalculateNextMonthDays();">></a><a
						class="selectBtn currentDay" href="javascript:"
						onClick="CalendarHandler.CreateCurrentCalendar(0,0,0);">今天</a>
				</div>
				<div id="context">
					<div class="week">
						<h3>一</h3>
						<h3>二</h3>
						<h3>三</h3>
						<h3>四</h3>
						<h3>五</h3>
						<h3>六</h3>
						<h3>日</h3>
					</div>
					<div id="center">
						<div id="centerMain">
							<div id="selectYearDiv"></div>
							<div id="centerCalendarMain">
								<div id="Container"></div>
							</div>
							<div id="selectMonthDiv"></div>
						</div>
					</div>
					<div id="foots">
						<a id="footNow">00:00:00</a>
					</div>
					<!-- 工作统计 -->
					<div id="workdays">&nbsp本月已工作：<span></span></div>
					<div id="restdays">&nbsp本月请假共计：<span></span></div>
					<div id="absentdays">&nbsp本月旷工共计：<span></span></div>
				</div>
			</div>

		</div>
	</div>
	<div class="right">
		<div class="split"></div>
		公告
		<div class="notice-announcement">
			<div class="annoucement notice clearfix">
				--&nbsp 
				<div>&nbsp</div>
			</div>
		</div>
		<div class="split"></div>
		新闻
		<div class="notice-new">
			<div class="news notice clearfix">
				--&nbsp
				<div>&nbsp</div>
			</div>
		</div>
	</div>
<!-- 	<div class="showDateDetail"> -->
<!-- 		<div class="permision datedetail"> -->
<!-- 			<div>任务：</div> -->
<!-- 			<div> -->
<!-- 				<div>1</div> -->
<!-- 				<div>2</div> -->
<!-- 				<div>3</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="plan datedetail"> -->
<!-- 			<div>计划安排：</div> -->
<!-- 			<div> -->
<!-- 				<div>1</div> -->
<!-- 				<div>2</div> -->
<!-- 				<div>3</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

		<div class="m-layer" id="showDetail">
		    <table class="lytable"><tbody><tr><td class="lytd">
		    <div class="lywrap">
			    <div class="lytt"><h2 class="u-tt">今日安排</h2><span class="lyclose" onclick="hiddenWindow()">×</span></div>
			    <div class="lyct">
			        <div class="dataWindow">
						<div class="data-mission">
							<div>任务：</div>
						</div>
						<div class="data-calendar">
							<div>安排：</div>
						</div>
			        </div>
			    </div>
			    <div class="lybt">
			        <div class="lyother">
			            <p></p>
			        </div>
			        <div class="lybtns">
			            <button type="button" class="u-btn" onclick="hiddenWindow()">确定</button>
			        </div>
			    </div>
		    </div></td></tr></tbody></table>
		</div>
</div>
</body>
<script type="text/javascript" src="http://www.pengyaou.com/jquery-1.4.min.js"></script>
<script type="text/javascript">
	/* 显示今日细节 */
	function showDetail(node) {
		var oa_currDay = $(node).children("div").children("a").html();
		var oa_currMonth = $(".selectMonth").html().substring(0,$(".selectMonth").html().length-1);
		var oa_currYear = $(".selectYear").html().substring(0,$(".selectYear").html().length-1);
		var oa_date = oa_currYear+"-"+oa_currMonth+"-"+oa_currDay;
		$(".data-calendar").html("<div>安排：</div>");
		$(".data-mission").html("<div>任务：</div>");
		var inMessage_group = new Object();
		inMessage_group.date = new Date().getTime();
		inMessage_group.data = oa_date;
		inMessage_group.uid = <%=uid %>
		var json = JSON.stringify(inMessage_group);
		var url = '/m_index/getToday.do?date=' + new Date().getTime();
		//请求任务和安排数据
		$.ajax({
		   url: '<%=path %>'+url,
      	   type: 'post',
		   data:{data:json},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			data = JSON.parse(data);
				if(data.status=="success"){
					for(var i=0;i<data.data.length;i++){
						if(data.data[i].kind=="calendar"){
							$(".data-calendar").append("<div class='one-mission'>"+data.data[i].content+"</div>");
						}else if(data.data[i].kind=="mission"){
						
							$(".data-mission").append("<div class='one-mission'>"+data.data[i].content+"</div>");
						}
					}
				}else{
					alert("error");
				}
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				alert("error");
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
		$("#showDetail").addClass("m-layer-show");
	}
	$().ready(function(){
		getAnnouncement();
	});
	
	function getAnnouncement(){
		var url = '/m_index/getAnnouncement.do?date='+ new Date().getTime();
		//请求考勤数据
		$.ajax({
		    url: '<%=path %>'+url,
      	    type: 'get',
		    data:{uid:<%=uid %>},
		    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    //调小超时时间会引起异常
		    timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			data = JSON.parse(data);			
				var notices = data.data;
				var newHtml = "";
				var announcementHtml = "";
				for(var i=0;i<notices.length;i++){
					if(notices[i].kind=="new"){
		      			newHtml += "<a href='"+notices[i].href+"'><div class='news notice clearfix sun-border-elegance'><div>--"+notices[i].date+"<span class='float-right sun-border-elegance'>"+notices[i].department+"</span></div><div>"+notices[i].content+"</div></div></a>";
					}
					if(notices[i].kind=="announcement"){
		      			announcementHtml += "<a href='"+notices[i].href+"'><div class='announcement notice clearfix sun-border-elegance'><div>--"+notices[i].date+"<span class='float-right sun-border-elegance'>"+notices[i].department+"</span></div><div>"+notices[i].content+"</div></div></a>";
					}
				}
				$(".notice-new").html(newHtml);
				$(".notice-announcement").html(announcementHtml);
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
				alert("数据请求异常");
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
	}
	
	var CalendarHandler = {
		currentYear : 0,
		currentMonth : 0,
		isRunning : false,
		showYearStart : 2009,
		tag : 0,
		initialize : function() {
			$calendarItem = this.CreateCalendar(0, 0, 0);
			$("#Container").append($calendarItem);

			$("#context")
					.css("height", $("#CalendarMain").height() - 65 + "px");
			$("#center").css("height", $("#context").height() - 30 + "px");
			$("#selectYearDiv").css("height",
					$("#context").height() - 30 + "px").css("width",
					$("#context").width() + "px");
			$("#selectMonthDiv").css("height",
					$("#context").height() - 30 + "px").css("width",
					$("#context").width() + "px");
			$("#centerCalendarMain").css("height",
					$("#context").height() - 30 + "px").css("width",
					$("#context").width() + "px");

			$calendarItem.css("height", $("#context").height() - 30 + "px"); //.css("visibility","hidden");
			$("#Container").css("height", "0px").css("width", "0px").css(
					"margin-left", $("#context").width() / 2 + "px").css(
					"margin-top", ($("#context").height() - 30) / 2 + "px");
			$("#Container").animate({
				width : $("#context").width() + "px",
				height : ($("#context").height() - 30) * 2 + "px",
				marginLeft : "0px",
				marginTop : "0px"
			}, 300, function() {
				$calendarItem.css("visibility", "visible");
			});
			$(".dayItem").css("width", $("#context").width() + "px");
			var itemPaddintTop = $(".dayItem").height() / 6;
			$(".item").css({
				"width" : $(".week").width() / 7 + "px",
				"line-height" : itemPaddintTop + "px",
				"height" : itemPaddintTop + "px"
			});
			$(".currentItem>a").css("margin-left",
					($(".item").width() - 25) / 2 + "px").css("margin-top",
					($(".item").height() - 25) / 2 + "px");
			$(".week>h3").css("width", $(".week").width() / 7 + "px");
			this.RunningTime();
		},
		CreateSelectYear : function(showYearStart) {
			CalendarHandler.showYearStart = showYearStart;
			$(".currentDay").show();
			$("#selectYearDiv").children().remove();
			var yearindex = 0;
			for ( var i = showYearStart; i < showYearStart + 12; i++) {
				yearindex++;
				if (i == showYearStart) {
					$last = $("<div>往前</div>");
					$("#selectYearDiv").append($last);
					$last
							.click(function() {
								CalendarHandler
										.CreateSelectYear(CalendarHandler.showYearStart - 10);
							});
					continue;
				}
				if (i == showYearStart + 11) {
					$next = $("<div>往后</div>");
					$("#selectYearDiv").append($next);
					$next
							.click(function() {
								CalendarHandler
										.CreateSelectYear(CalendarHandler.showYearStart + 10);
							});
					continue;
				}

				if (i == this.currentYear) {
					$yearItem = $("<div class=\"currentYearSd\" id=\"" + yearindex + "\">"
							+ i + "</div>")

				} else {
					$yearItem = $("<div id=\"" + yearindex + "\">" + i
							+ "</div>");
				}
				$("#selectYearDiv").append($yearItem);
				$yearItem.click(function() {
					$calendarItem = CalendarHandler.CreateCalendar(Number($(
							this).html()), 1, 1);
					$("#Container").append($calendarItem);
					CalendarHandler.CSS()
					CalendarHandler.isRunning = true;
					$($("#Container").find(".dayItem")[0]).animate({
						height : "0px"
					}, 300, function() {
						$(this).remove();
						CalendarHandler.isRunning = false;
					});
					$("#centerMain").animate({
						marginLeft : -$("#center").width() + "px"
					}, 500);
				});
				if (yearindex == 1 || yearindex == 5 || yearindex == 9)
					$("#selectYearDiv").find("#" + yearindex).css(
							"border-left-color", "#fff");
				if (yearindex == 4 || yearindex == 8 || yearindex == 12)
					$("#selectYearDiv").find("#" + yearindex).css(
							"border-right-color", "#fff");

			}
			$("#selectYearDiv>div").css("width",
					($("#center").width() - 4) / 4 + "px").css("line-height",
					($("#center").height() - 4) / 3 + "px");
			$("#centerMain").animate({
				marginLeft : "0px"
			}, 300);
		},
		CreateSelectMonth : function() {
			$(".currentDay").show();
			$("#selectMonthDiv").children().remove();
			for ( var i = 1; i < 13; i++) {
				if (i == this.currentMonth)
					$monthItem = $("<div class=\"currentMontSd\" id=\"" + i + "\">"
							+ i + "月</div>");
				else
					$monthItem = $("<div id=\"" + i + "\">" + i + "月</div>");
				$("#selectMonthDiv").append($monthItem);
				$monthItem.click(function() {
					$calendarItem = CalendarHandler.CreateCalendar(
							CalendarHandler.currentYear, Number($(this).attr(
									"id")), 1);
					$("#Container").append($calendarItem);
					CalendarHandler.CSS()
					CalendarHandler.isRunning = true;
					$($("#Container").find(".dayItem")[0]).animate({
						height : "0px"
					}, 300, function() {
						$(this).remove();
						CalendarHandler.isRunning = false;
					});
					$("#centerMain").animate({
						marginLeft : -$("#center").width() + "px"
					}, 500);
				});
				if (i == 1 || i == 5 || i == 9)
					$("#selectMonthDiv").find("#" + i).css("border-left-color",
							"#fff");
				if (i == 4 || i == 8 || i == 12)
					$("#selectMonthDiv").find("#" + i).css(
							"border-right-color", "#fff");
			}
			$("#selectMonthDiv>div").css("width",
					($("#center").width() - 4) / 4 + "px").css("line-height",
					($("#center").height() - 4) / 3 + "px");
			$("#centerMain").animate({
				marginLeft : -$("#center").width() * 2 + "px"
			}, 300);
		},
		IsRuiYear : function(aDate) {
			return (0 == aDate % 4 && (aDate % 100 != 0 || aDate % 400 == 0));
		},
		CalculateWeek : function(y, m, d) {
			var arr = "7123456".split("");
			with (document.all) {
				var vYear = parseInt(y, 10);
				var vMonth = parseInt(m, 10);
				var vDay = parseInt(d, 10);
			}
			var week = arr[new Date(y, m - 1, vDay).getDay()];
			return week;
		},
		CalculateMonthDays : function(m, y) {
			var mDay = 0;
			if (m == 0 || m == 1 || m == 3 || m == 5 || m == 7 || m == 8
					|| m == 10 || m == 12) {
				mDay = 31;
			} else {
				if (m == 2) {
					//判断是否为芮年
					var isRn = this.IsRuiYear(y);
					if (isRn == true) {
						mDay = 29;
					} else {
						mDay = 28;
					}
				} else {
					mDay = 30;
				}
			}
			return mDay;
		},
		CreateCalendar : function(y, m, d) {
			$dayItem = $("<div class=\"dayItem\"></div>");
			//获取当前月份的天数
			var nowDate = new Date();
			if (y == nowDate.getFullYear() && m == nowDate.getMonth() + 1
					|| (y == 0 && m == 0))
				$(".currentDay").hide();
			var nowYear = y == 0 ? nowDate.getFullYear() : y;
			this.currentYear = nowYear;
			var nowMonth = m == 0 ? nowDate.getMonth() + 1 : m;
			this.currentMonth = nowMonth;
			var nowDay = d == 0 ? nowDate.getDate() : d;
			$(".selectYear").html(nowYear + "年");
			$(".selectMonth").html(nowMonth + "月");
			var nowDaysNub = this.CalculateMonthDays(nowMonth, nowYear);
			//获取当月第一天是星期几
			//var weekDate = new Date(nowYear+"-"+nowMonth+"-"+1);
			//alert(weekDate.getDay());
			var nowWeek = parseInt(this.CalculateWeek(nowYear, nowMonth, 1));
			//nowWeek=weekDate.getDay()==0?7:weekDate.getDay();
			//var nowWeek=weekDate.getDay();
			//获取上个月的天数
			var lastMonthDaysNub = this.CalculateMonthDays((nowMonth - 1),
					nowYear);

			if (nowWeek != 0) {
				//生成上月剩下的日期
				for ( var i = (lastMonthDaysNub - (nowWeek - 1)); i < lastMonthDaysNub; i++) {
					$dayItem.append("<div class=\"item lastItem\"><a>"
							+ (i + 1) + "</a></div>");
				}
			}

			//考勤信息，这里ajax请求考勤表，然后获取当月考勤信息，写入前端。
			//ajax请求本月上班日期，以及本月工作多少日。用于统计。
//=========================================================================================
			var inMessage_group = new Object();
			inMessage_group.date = new Date().getTime();
			inMessage_group.data = nowYear+"-"+nowMonth+"-"+nowDaysNub;
			inMessage_group.uid = <%=uid %>
			var json = JSON.stringify(inMessage_group);
			var url = '/m_index/getAttendance.do?date='+ new Date().getTime();
		//请求考勤数据
		$.ajax({
		   url: '<%=path %>'+url,
      	   type: 'get',
		   data:{data:json},
		   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		   //调小超时时间会引起异常
		   timeout: 3000,
      		//请求成功后触发
      		success: function (data) {
      			data = JSON.parse(data);			
				var workday =data.data.workday;
				if(workday.indexOf(",")>0){
					workday = data.data.workday.split(",");
					$("#workdays span").html(workday.length+"日");
				}else{
					workday = data.data.workday;
					if(workday==""){
						$("#workdays span").html("0日");
					}else{
						$("#workdays span").html("1日");
					}
				}
				
				var restday = data.data.restday;
				if(restday.indexOf(",")>0){
					restday = data.data.restday.split(",");
					$("#restdays span").html(restday.length+"日");
				}else{
					restday = data.data.restday;
					if(restday==""){
						$("#restdays span").html("0日");
					}else{
						$("#restdays span").html("1日");
					}
				}
				var absentday = data.data.absentday;
				if(absentday.indexOf(",")>0){
					absentday = data.data.absentday.split(",");
					$("#absentdays span").html(absentday.length+"日");
				}else{
					absentday = data.data.absentday;
					if(absentday==""){
						$("#absentdays span").html("0日");
					}else{
						$("#absentdays span").html("1日");
					}
				}
				
				var days = $(".currMon-day");//1,2,3,4,5,6,7,8
				for(var i=0;i<days.length;i++){
					var day = $(days[i]).children("a").html();
					if(day.length==1){
						day = "0" + day;
					}
					for(var j=0;j<workday.length;j++){
						if(workday[j]==day){
							$(days[i]).addClass("onwork");
						}
					}
					for(var k=0;k<restday.length;k++){
						if(restday==day || restday[k]==day){
							$(days[i]).addClass("onrest");
						}
					}							
					for(var m=0;m<absentday.length;m++){
						if(absentday==day || absentday[m]==day){
							$(days[i]).addClass("onabsent");
						}
					}
				}
			},
			//请求失败遇到异常触发
			error: function (xhr, errorInfo, ex) { 
			},
			beforeSend: function (xhr) {
				xhr.setRequestHeader('Content-Type', 'application/xml;charset=utf-8');
			},
			//是否异步发送
			async: true
		});
//=========================================================================================
			//生成当月的日期
			for ( var i = 0; i < nowDaysNub; i++) {
				var work = true;
				if (work) {
					if (i == (nowDay - 1)) {
						$dayItem
								.append("<div class=\"currMon item currentItem\" onClick=\"showDetail(this)\"><div class='currMon-day'><a>"
										+ (i + 1) + "</a></div></div>");
					} else {
						$dayItem
								.append("<div class=\"currMon item\" onClick=\"showDetail(this)\"><div class='currMon-day'><a>"
										+ (i + 1) + "</a></div></div>");
					}
				} else {
					if (i == (nowDay - 1)) {
						$dayItem
								.append("<div class=\"currMon item currentItem\" onClick=\"showDetail(this)\"><div class='currMon-day'><a>"
										+ (i + 1) + "</a></div></div>");
					} else {
						$dayItem
								.append("<div class=\"currMon item\" onClick=\"showDetail(this)\"><div class='currMon-day'><a>"
										+ (i + 1) + "</a></div></div>");
					}
				}
			}

			//获取总共已经生成的天数
			var hasCreateDaysNub = nowWeek + nowDaysNub;
			//如果小于42，往下个月推算
			if (hasCreateDaysNub < 42) {
				for ( var i = 0; i <= (42 - hasCreateDaysNub); i++) {
					$dayItem.append("<div class=\"item lastItem\"><a>"
							+ (i + 1) + "</a></div>");
				}
			}

			return $dayItem;
		},
		CSS : function() {
			var itemPaddintTop = $(".dayItem").height() / 6;
			$(".item").css({
				"width" : $(".week").width() / 7 + "px",
				"line-height" : itemPaddintTop + "px",
				"height" : itemPaddintTop + "px"
			});
			$(".currentItem>a").css("margin-left",
					($(".item").width() - 25) / 2 + "px").css("margin-top",
					($(".item").height() - 25) / 2 + "px");
		},
		CalculateNextMonthDays : function() {
			if (this.isRunning == false) {
				$(".currentDay").show();
				var m = this.currentMonth == 12 ? 1 : this.currentMonth + 1;
				var y = this.currentMonth == 12 ? (this.currentYear + 1)
						: this.currentYear;
				var d = 0;
				var nowDate = new Date();
				if (y == nowDate.getFullYear() && m == nowDate.getMonth() + 1)
					d = nowDate.getDate();
				else
					d = 1;
				$calendarItem = this.CreateCalendar(y, m, d);
				$("#Container").append($calendarItem);

				this.CSS();
				this.isRunning = true;
				$($("#Container").find(".dayItem")[0]).animate({
					height : "0px"
				}, 300, function() {
					$(this).remove();
					CalendarHandler.isRunning = false;
				});
			}
		},
		CalculateLastMonthDays : function() {
			if (this.isRunning == false) {
				$(".currentDay").show();
				var nowDate = new Date();
				var m = this.currentMonth == 1 ? 12 : this.currentMonth - 1;
				var y = this.currentMonth == 1 ? (this.currentYear - 1)
						: this.currentYear;
				var d = 0;

				if (y == nowDate.getFullYear() && m == nowDate.getMonth() + 1)
					d = nowDate.getDate();
				else
					d = 1;
				$calendarItem = this.CreateCalendar(y, m, d);
				$("#Container").append($calendarItem);
				var itemPaddintTop = $(".dayItem").height() / 6;
				this.CSS();
				this.isRunning = true;
				$($("#Container").find(".dayItem")[0]).animate({
					height : "0px"
				}, 300, function() {
					$(this).remove();
					CalendarHandler.isRunning = false;
				});
			}
		},
		CreateCurrentCalendar : function() {
			if (this.isRunning == false) {
				$(".currentDay").hide();
				$calendarItem = this.CreateCalendar(0, 0, 0);
				$("#Container").append($calendarItem);
				this.isRunning = true;
				$($("#Container").find(".dayItem")[0]).animate({
					height : "0px"
				}, 300, function() {
					$(this).remove();
					CalendarHandler.isRunning = false;
				});
				this.CSS();
				$("#centerMain").animate({
					marginLeft : -$("#center").width() + "px"
				}, 500);
			}
		},
		RunningTime : function() {
			var mTiming = setInterval(function() {
				var nowDate = new Date();
				var h = nowDate.getHours() < 10 ? "0" + nowDate.getHours()
						: nowDate.getHours();
				var m = nowDate.getMinutes() < 10 ? "0" + nowDate.getMinutes()
						: nowDate.getMinutes();
				var s = nowDate.getSeconds() < 10 ? "0" + nowDate.getSeconds()
						: nowDate.getSeconds();
				var nowTime = h + ":" + m + ":" + s;
				$("#footNow").html(nowTime);
			}, 1000);

		}

	}
</script>

<!--[if IE 7]>
					   <style type="text/css">
								.menuItem{ margin-left:-130px; } 
							</style>
					    <![endif]-->

</html>