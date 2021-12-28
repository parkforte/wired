<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/employee/emplResign -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.wi-color{
	background-color: #6868AC; 
	border-color: #6868AC;
	color: white;
}
.wi-color:hover{
	opacity:0.6;
	color: white;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>
                        
      <!-- defaultPage -->
    <div class="container-fluid font">
		<div id="topTitle">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 h1-style">퇴사자 목록</h1>
        <p class="mb-4">resignation List</p>
		</div>
        <!-- title1 -->
         <div class="card shadow mb-4">
            
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
             이름 직급 부서로 검색/ 페이징처리
         
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
                                   <th>사원번호</th>
                                   <th>이름</th>
                                   <th>부서</th>
                                   <th>직급</th>
                                   <th>연락처</th>
                                   <th>복직</th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>1</td>
                                   <td>송지효</td>
                                   <td>총무부</td>
                                   <td>과장</td>
                                   <td>010-1234-5678</td>
                                   <td>
									<button type="button" class="btn wi-color" 
										data-toggle="modal" data-target="#exampleModal" onclick="location.href=''">복직</button>
									</td>
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
			      	<h5 class="modal-title" id="exampleModalLabel">복직</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        복직 처리 하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >취소</button>
			        <button type="submit" class="btn btn-primary">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
    <!-- /.container-fluid -->
     </div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
         
			