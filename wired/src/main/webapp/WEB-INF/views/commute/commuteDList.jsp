<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/commute/commuteList -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="<c:url value='/resources/api/jsTree/dist/themes/proton/style.min.css' />" />

<style>
.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}

.setMR10 {
	margin-right: 10px;
}

.btn-primary {
	font-size: 0.7em;
	margin-left: 2px;
}

/* date search */
#navVar{
	float: left;
}

#selBox{
	float: right;
	display: inline-flex;
}
#selBox input{
	height: 30px;
}
#mainDiv{
	clear: both;
}
#selBox button{
	font-size: 0.7em;
	margin-left: 2px;
}

</style>
<!-- javaScript영역 -->
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<%-- <form name="frmPage" method="post" action="<c:url value='/commute/commuteDList'/>"> --%>
<!-- 	<input type="hidden" name="currentPage" id="currentPage"> -->
<%-- 	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }"> --%>
<!-- </form> -->

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post"
	action="<c:url value='/commute/commuteDList'/>">
	<input type="hidden" name="startDay" value="${dateSearchVO.startDay}">
	<input type="hidden" name="endDay" value="${dateSearchVO.endDay}">
	<input type="hidden" name="currentPage">
</form>

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">근태관리</h1>
	<p class="mb-4">Attendance management.</p>
	<div>
		  <!-- nav -->
		 <div id="navVar">
         <ul class="nav">
          <li class="nav-item">
            <a class="nav-link active" id="a-hover" data-value="1" href="<c:url value='/commute/commuteList'/>">개인근태조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-value="3" id="a-hover" href="<c:url value='/commute/commuteDList'/>">부서근태조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-value="3" id="a-hover" href="<c:url value='/commute/commuteGraph'/>">부서근태통계</a>
          </li>
        </ul>
		 </div>
        <form name="frm1" method="post" action="<c:url value='/commute/commuteDList'/>" >
	        <div id="selBox">
				<!-- 조회기간 include -->
				<%@ include file="../inc/dateTerm2.jsp" %>
				<button class="btn btn-outline-success" type="submit">Search</button>
	        </div>
		</form>
		<!-- title1 -->
		<div class="card shadow mb-4" id="mainDiv">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary f-left">
            		부서근태조회
				</h6>
				<div id="se2_sample"  class="f-right">
					<button type="button" class="btn btn-primary f-left" id="btIn"
						onclick="location.href='<c:url value="/commute/commuteIn"/>'">출근</button>
					<button type="button" class="btn btn-primary f-left"  id="btOut"
						onclick="location.href='<c:url value="/commute/commuteOut"/>'">퇴근</button>
	    		</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th width="30%">남은연차</th>
								<th width="20%">15</th>
								<th width="30%">사용연차</th>
								<th width="20%">1</th>
							</tr>
					</table>
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>사원이름</th>
								<th>부서</th>
								<th>직급</th>
								<!-- if문으로 출퇴근시간에 값이있으면 -->
								<th width="25%">출근시간</th>
								<th width="25%">퇴근시간</th>
								<th>근무상태</th>
							</tr>
<!-- 							<tr> -->
<!-- 								<th>사원이름</th> -->
<!-- 								<th>부서</th> -->
<!-- 								<th>직급</th> -->
<!-- 								if문으로 연차에 값이 있으면 -->
<!-- 								<th>총연차</th> -->
<!-- 								<th>사용연차</th> -->
<!-- 							</tr> -->
						</thead>
						<tbody>
							<c:forEach var="map" items="${clist }">
								<tr>
									<td>${map['MEM_NAME'] }</td>
									<td>${map['DEPT_NAME'] }</td>
									<td>${map['POS_NAME'] }</td>
									<!-- if문으로 출퇴근시간, else if연차 -->
									<td><fmt:formatDate value="${map['COM_INDATE'] }" type="both"/></td>
									<td><fmt:formatDate value="${map['COM_OUTDATE'] }" type="both"/></td>
									<td>
										<input type="hidden" value="${map['COM_STATUS']}">
										<c:if test="${map['COM_STATUS'] == 'Y'}">
											<span>출근</span>
										</c:if>
										<c:if test="${map['COM_STATUS'] == 'N'}">
											<span>퇴근</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 시작 -->
					<div class="row">
              			<div class="col-sm-12 col-md-5">
              				<div class="dataTables_info" id="dataTables_info" role="status">
              					Showing ${pagingInfo.firstPage } to ${pagingInfo.currentPage } of ${pagingInfo.totalPage } entries
              				</div>

              			</div>

              			<!-- 페이징 1,2,3,4,5, -->
              			<div class="col-sm-12 col-md-7">
              				<nav class="f-right" aria-label="...">
	                       		<!-- 페이지 번호추가 -->
								<ul class="pagination">

										<li class="page-item
										<c:if test="${pagingInfo.firstPage==1 }">
											disabled
										</c:if>
										"><a class="page-link" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">Previous</a></li>

									<!-- [1][2][3][4][5][6][7][8][9][10] -->
									<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">


										<li
											<c:if test="${i==pagingInfo.currentPage }">
												class="page-item active" aria-current="page"
											</c:if>
											<c:if test="${i!=pagingInfo.currentPage }">
												class="page-item"
											</c:if>
										><a class="page-link" href="#" onclick="pageFunc(${i })">${i }</a></li>
									</c:forEach>

										<li class="page-item
										<c:if test="${pagingInfo.lastPage==pagingInfo.totalPage }">
											disabled
										</c:if>
										"><a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">Next</a></li>
									<!-- 페이지 번호끝 -->
								</ul>
							</nav>
              			</div>
              			<input type="hidden" value="${pagingInfo.lastPage }"/>

              		</div>
				</div>
			</div>
			<!-- 페이징 끝 -->

		</div>

	</div>
</div>
<!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp"%>
