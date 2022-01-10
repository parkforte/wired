<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/jawon/jawonReserve -->

<!-- javaScript영역 -->
<link href='<c:url value='/resources/api/fullcalendar/main.css'/>' rel='stylesheet' />
<script src='<c:url value='/resources/api/fullcalendar/main.js'/>'></script>
<script src='<c:url value='/resources/api/fullcalendar/locales/ko.js'/>'></script>
<script type="text/javascript">

	//전역변수 선언
	var Calendar = null;

	$(document).ready(function(){
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendar.Draggable;

	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');

	    // initialize the external events
	    // -----------------------------------------------------------------

	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });

	    // initialize the calendar
	    // -----------------------------------------------------------------

	    calendar = new Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'timeGridWeek'

	      },
	      editable: true,	//드래그박스 수정가능여부
	      droppable: true, // this allows things to be dropped onto the calendar
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      }
	      ,locale: 'ko'
	    });

	    calendar.render();
	  });

	//전체 이벤트 데이터를 추출

	function allSave(){
		var allEvent = calendar.getEvents();
		console.log(allEvent);

		var events= new Array();

		for(var i=0; i<allEvent.length; i++){
			var obj=new Object();
			obj.title = allEvent[i]._def.title;	//이벤트명칭
			obj.allDay = allEvent[i]._def.allDay;	//하루 종일의 이벤트인지 알려주는 boolean값
			obj.start = allEvent[i]._instance.range.start;
			obj.end = allEvent[i]._instance.range.end;
			//json 형태로 배열에 담는다
			events.push(obj);
		}
		var jsondata=JSON.stringify(events);
		console.log(jsondata);

		savedata(jsondata);
	}

	//ajax DB저장
	function savedata(jsondata){
		$.ajax({
			type:"POST",
			url:"<c:url value='/scheduler/ajaxPersonalSave'/>",
			data:JSON.stringify(jsondata),
			dataType:'text',
			success:function(result){
				console.log(result);
			},
			error:function(request, status, error){
				alert("error :"+error);
			}
		});
	}


	$(function(){
		$('#saveBtn').click(function(){
			allSave();

		});
	});

</script>
<style>
.external-box{
	float: left;
	width: 20%;
	padding-right: 30px;
	padding-left: 20px;
}

.dragbox{
	margin-top: 5px;
	cursor: move;
}
.setW20 {
	width: 25%;
}


.setMR10 {
	margin-right: 10px;
}

</style>

<!-- 개인스케쥴러 -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회의실</h1>
	<!-- title1 -->
		<div class="card shadow mb-4 setW20 setMR10 f-left">

			<div class="card-body">
				<!-- 근태관리 페이지 메뉴바 -->
				<div class="row">
				  <div class="col-12">
				    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">개인근태조회</a>
				      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">개인연차조회</a>
				      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">부서근태조회</a>
				      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">부서근태통계</a>
				    </div>
				  </div>
				</div>

			</div>
		</div>
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				 <div class="external-box" id='external-events'>
				  </div>
				  <div>
				<div id='calendar'></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
