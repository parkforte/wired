<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/jawon/jawonAllList -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.btn-waiting{
	background-color: #cccccc;
}
.c-both{
	clear: both;
}
.jawonSel{
	margin-bottom: 12px;
	margin-top: -12px;
}
.btn-loc{
	margin-left: 20px;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">
$(function() {
	$('.jawonSelRes').change(function(){
		location.href=($(this).val());
	});
	$('.btn-loc').each(function(index,item){
		$(this).click(function(){
			var res=$(this).val();
			window.open("/wired/jawon/reserveLocation?resNo="+res,"/", "left=50, top=20, width=800, height=400, scrollbars=yes,resizable=yes");
		});
	});
});

</script>

      <!-- defaultPage -->
    <div class="container-fluid font">
		<div id="topTitle">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 h1-style">자원예약현황</h1>
		<h5 class="m-0 font-weight-bold text-primary h5-style f-left">전체예약현황</h5><!-- 부제 -->
		<!-- select -->
		<div class=" d-flex f-right jawonSel">
			<select class="form-control jawonSelRes">
				<option>자원예약현황</option>
				<option value="<c:url value='/jawon/jawonAllList'/>">전체예약현황</option>
				<option value="<c:url value='/jawon/jawonMyList'/>">내 예약현황</option>
			</select>
		</div>
		</div>
        <!-- title1 -->
         <div class="card shadow mb-4 c-both">
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">



         <!-- Topbar Navbar -->
           <ul class="navbar-nav ml-auto">

               <!-- Nav Item - Search Dropdown (Visible Only XS) -->
               <li class="nav-item dropdown no-arrow d-sm-none">
                   <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <i class="fas fa-search fa-fw"></i>
                   </a>
                   <!-- Dropdown - Messages -->
                   <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                       aria-labelledby="searchDropdown">
                       <form class="form-inline mr-auto w-100 navbar-search">
                           <div class="input-group">
                               <input type="text" class="form-control bg-light border-0 small"
                                   placeholder="Search for..." aria-label="Search"
                                   aria-describedby="basic-addon2">
                               <div class="input-group-append">
                                   <button class="btn btn-primary" type="button">
                                       <i class="fas fa-search fa-sm"></i>
                                   </button>
                               </div>
                           </div>
                       </form>
                   </div>
               </li>
               </div>
               <form name="frm">
               <div class="card-body">
                   <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명</th>
                                   <th>자원정보</th>
                                   <th>기간</th>
                                   <th>예약정보</th>
                                   <th>예약위치</th>
                                   <th>부서</th>
                               </tr>
                           </thead>
                           <tbody>
                           <c:if test="${empty aList }">
                            	<tr>
                            		<td colspan="5">데이터가 없습니다.</td>
                            	</tr>
                            </c:if>
                            <c:if test="${!empty aList }">
                        	<c:forEach var="map" items="${aList }">
                               <tr>
                                   <td>${map['TYPE_NAME'] }</td>
                                   <td>${map['RES_NAME'] }</td>
                                   <td>
                                   <fmt:formatDate value="${map['USE_REGDATE'] }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${map['RETURN_REGDATE'] }" pattern="yyyy-MM-dd"/></td>
                                   <td>${map['RESERV_CONTENT'] }</td>
                                   <td>
                                   <input type="hidden" value="${map['RES_NO'] }">
                                   ${map['RES_LOCATION'] }<button type="button" class="btn btn-outline-info btn-loc"
                                   		value="${map['RES_NO'] }" >위치보기</button>
                                   </td>
                                   <td>${map['DEPT_NAME'] }</td>
                               </tr>
                        </c:forEach>
                        </c:if>
                           </tbody>
                       </table>
                   </div>
               </div>
                </form>
                </div>

    </div>
    <!-- /.container-fluid -->
     </div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>

