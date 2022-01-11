<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->

<!-- javaScript영역 -->
<link href='<c:url value='/resources/api/fullcalendar/main.css'/>' rel='stylesheet' />
<script src='<c:url value='/resources/api/fullcalendar/main.js'/>'></script>
<script src='<c:url value='/resources/api/fullcalendar/locales/ko.js'/>'></script>
<script type="text/javascript">

	$(document).ready(function(){
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
		  initialView: 'dayGridMonth',
		  locale: 'ko'
		});
		
		calendar.render();
		
	});

</script>

<!-- 팀스케쥴러 -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Page Heading</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">팀스케쥴러</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div id='calendar'></div>

			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
