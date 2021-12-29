<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/employee/emplList -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.btn-waiting{
	background-color: #cccccc;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>
                        
      <!-- defaultPage -->
    <div class="container-fluid font">
		<div id="topTitle">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 h1-style">사원목록</h1>
        <p class="mb-4">Employee List</p>
		</div>
        <!-- title1 -->
         <div class="card shadow mb-4">
            
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
               <!-- search -->
             <div class="col-sm-12 col-md-6 f-right" align="right">
                   			<div id="dataTable_filter" class="dataTables_filter">
                   				<div class="bdListSearch">
	                   				<label class="f-right">Search:</label>
                   				</div>
                   				<div class="bdListSearchText">
                   				
    	               				<input type="search" class="form-control form-control-sm" placeholder aria-controls="dataTable"/>
                   				</div>
                   			</div>
                   		</div>
         
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
                                   <th>수정/삭제</th>
                               </tr>
                           </thead>
               <c:forEach var="i" begin="1" end="10">
                           <tbody>
                               <tr>
                                   <td>1</td>
                                   <td>송지효</td>
                                   <td>총무부</td>
                                   <td>과장</td>
                                   <td>010-1234-5678</td>
                                   <td><button type="button" class="btn btn-success" onclick="location.href='/wired/employee/emplEdit'">수정</button>
										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">퇴사</button></td>
                               </tr>
                           </tbody>
               </c:forEach>
                       </table>
                   </div>
               </div>
                
    </div>
    		<!-- paging -->
    				<div class="row">
              			<div class="col-sm-12 col-md-5">
              				<div class="dataTables_info" id="dataTables_info" role="status">
              					Showing 1 to 10 of 57 entries
              				</div>
              			
              			</div>
              			
              			<!-- 페이징 1,2,3,4,5, -->
              			<div class="col-sm-12 col-md-7">
              				<nav aria-label="...">
							  <ul class="pagination ">
							    <li class="page-item disabled">
							      <span class="page-link">Previous</span>
							    </li>
							    <li class="page-item"><a class="page-link" href="#">1</a></li>
							    <li class="page-item active" aria-current="page">
							      <span class="page-link">2</span>
							    </li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item">
							      <a class="page-link" href="#">Next</a>
							    </li>
							  </ul>
							</nav>
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
			        퇴사 처리 하시겠습니까?
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
         
			