<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/jawon/jawonReserve -->

<!-- css -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
.jawonNav{
	width: 10%;
	text-align: center;
}
#useRegdate{
	float: left;
	width: 10%;
}
#returnRegdate{
	width: 10%;
}
#jawonTextarea{
	width: 40%;
}
</style>

<!-- javaScript영역 -->
<script type="text/javascript">
$(function () {
	$('#selRes').css('overflow','hidden');
});

</script>
               <!-- defaultPage -->
                <div class="container-fluid font">
				<form name="frm1" class="user" method="post" action="">
				<input type="hidden" name="memNo" value="${sessionScope.memNo }">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800 h1-style">자원예약</h1>
					<p class="mb-4">Resources Reserve</p>

                    <!-- nav -->
                    <ul class="nav">
                    <c:forEach var="vo" items="${typeList }" >
					  <li class="nav-item">
					    <a class="nav-link active" id="a-hover" data-value="1" href="<c:url value='/jawon/jawonReserve?typeNo=${vo.typeNo }'/>">${vo.typeName }</a>
					  </li>
					  </c:forEach>
<!-- 					  <li class="nav-item"> -->
<%-- 					    <a class="nav-link" data-value="2" id="a-hover" href="<c:url value='/jawon/jawonReserve?typeNo=2'/>">차량</a> --%>
<!-- 					  </li> -->
<!-- 					  <li class="nav-item"> -->
<%-- 					    <a class="nav-link" data-value="3" id="a-hover" href="<c:url value='/jawon/jawonReserve?typeNo=3'/>">리조트</a> --%>
<!-- 					  </li> -->
					</ul>

					<!-- reserve -->
                    <div class="card shadow mb-4">
                        <div class="card-body" >
                            <div class="table-responsive" >
									<select class="form-control" multiple="multiple" id="selRes" name="resNo">
		                            	<c:forEach var="map" items="${rList }">
												<option value="${map['RES_NO'] }">${map['RES_NAME'] }</option>
										</c:forEach>
									</select>
								<div>
								<%@ include file="../inc/dateTerm.jsp" %>
							    </div>
                            	<div class="form-group">
								    <textarea class="form-control" id="jawonTextarea" rows="3" name="reservContent" placeholder="예약내용"></textarea>
								</div>
								<button type="submit" class="btn btn-warning">예약</button>
                            </div>
                        </div>
                    </div>

				</form>
                </div>

                <!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp" %>
