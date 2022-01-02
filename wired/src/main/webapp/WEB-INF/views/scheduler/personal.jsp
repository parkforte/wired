<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->

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
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	        
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


</style>

<!-- 개인스케쥴러 -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">개인스케줄러</h1>
	<p class="mb-4">
		Personal Scheduler
	</p>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">개인스케줄러</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				 <div class="external-box" id='external-events'>
				    <p>
				      <strong>일정종류</strong>
				    </p>
				
				    <div class='dragbox fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>개인일정(일반)</div>
				    </div>
				    <div class='dragbox fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>개인일정(중요)</div>
				    </div>
				    <div class='dragbox fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>연차휴가</div>
				    </div>
				    <div class='dragbox fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>전사일정</div>
				    </div>
				    <div class='dragbox fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>부서일정</div>
				    </div>
				
				    <p>
				      <input type='checkbox' id='drop-remove' />
				      <label for='drop-remove'>드래그&드롭 제거</label>
				    </p>
				    <form method="post" id="saveBtn" >
				    <!-- <a href="#" type="submit" class="btn btn-success btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-check"></i>
                        </span>
                        <span class="text">전체저장하기</span>
                    </a> -->
                    <input type="submit" value="전체저장">
                    </form>
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
