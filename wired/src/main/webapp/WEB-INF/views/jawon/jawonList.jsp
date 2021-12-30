<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/jawon/jawonList -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.btn-waiting{
	background-color: #cccccc;
}
.c-both{
	clear: both;
}
.m-search{
	margin-bottom: 12px;
	margin-top: -12px;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>
                        
      <!-- defaultPage -->
    <div class="container-fluid font">
		<div id="topTitle">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 h1-style">자원예약현황</h1>
		<h5 class="m-0 font-weight-bold text-primary h5-style f-left">내 예약 현황</h5><!-- 부제 -->
		<!-- search -->
		<form class="d-flex f-right m-search">
			<input class="form-control mr-2" type="search" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		</div>
        <!-- title1 -->
       <c:forEach var="i" begin="1" end="3">       
         <div class="card shadow mb-4 c-both">
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary">내역이름</h6><!-- 게시판 이름 -->
                   
             
   
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
               <div class="card-body">
                   <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명</th>
                                   <th>자원정보</th>
                                   <th>기간</th>
                                   <th></th>
                                   <th></th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>회의실</td>
                                   <td>A회의실</td>
                                   <td>2021-12-21 17:00 ~ 2021-12-21 18:00</td>
                                   <td><button type="button" class="btn btn-danger b-radius" data-toggle="modal" data-target="#exampleModal" onclick="location.href='#'">신청취소</button></td>
                                   <td><button type="button" class="btn btn-success">검토중</button>
                                   <button type="button" class="btn btn-waiting">승인</button></td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
                </div>
                
    </div>
    <!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title" id="exampleModalLabel">신청취소</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        취소하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary b-radius" data-dismiss="modal" >닫기</button>
			        <button type="submit" class="btn btn-danger b-radius">신청취소</button>
			      </div>
			    </div>
			  </div>
			</div>
    <!-- /.container-fluid -->
    </c:forEach>  
     </div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
         
			