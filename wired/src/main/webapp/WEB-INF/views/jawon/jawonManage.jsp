<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/jawon/jawonManage -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

.btn-waiting{
	background-color: #cccccc;
}
.listAdd {
    float: right;
    margin-right: 78px;
}
a{
	color: grey;
}
.back-color{
	background: #6868AC;
	color: white;
}
.jawonAddBig{
	background: #6868AC;
	border: 1px solid;
}
.jawonAddBig:hover {
  color: white;
  background:#6868AC;
  border: 1px solid #6868AC;
}
.m-list{
	background: #1CC88A;
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
        <h1 class="h3 mb-2 text-gray-800 h1-style">자원관리</h1>
        <p class="mb-4">Resource Management</p>
		</div>
        <!-- title1 -->
           
         <div class="card shadow mb-4">
            
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary p-absolute">자원리스트</h6><!-- 게시판 이름 -->
  						<button type="button" class="btn btn-success listAdd" data-toggle="modal" data-target="#exampleList">리스트추가</button>
         
   		
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
                <c:forEach var="i" begin="1" end="2">  
               <div class="card-body p-bottom-0">
                   <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명</th>
                                   <th>자원정보</th>
                                   <th>자원위치</th>
                                   <th>예약시간</th>
                                   <th>상태</th>
                                   <th>
                                   	<button type="button" class="btn btn-light jawonAdd" data-toggle="modal" data-target="#exampleAdd">추가</button>
                                   </th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>차량</td>
                                   <td>아반떼</td>
                                   <td>본관 지하주차장</td>
                                   <td>2021-12-21 17:00 ~ 2021-12-21 18:00</td>
                                   <td><button type="button" class="btn btn-warning">사용중</button></td>
                                   <td><a href="#" id="a-hover" data-toggle="modal" data-target="#exampleEdit">수정</a>&nbsp;
                                   		<a href="#" id="a-hover" data-toggle="modal" data-target="#exampleDelete">삭제</a></td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
    			</c:forEach> 
    			<div class="card-body p-bottom-0">
                   <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명</th>
                                   <th>자원정보</th>
                                   <th>자원위치</th>
                                   <th>예약시간</th>
                                   <th>상태</th>
                                   <th>
                                   	<button type="button" class="btn btn-light jawonAdd" data-toggle="modal" data-target="#exampleAdd">추가</button>
                                   </th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>차량</td>
                                   <td>아반떼</td>
                                   <td>본관 지하주차장</td>
                                   <td>2021-12-21 17:00 ~ 2021-12-21 18:00</td>
                                   <td>
                                   <button type="button" class="btn btn-waiting">미사용</button></td>
                                   <td><a href="#" id="a-hover" data-toggle="modal" data-target="#exampleEdit">수정</a>&nbsp;
                                   		<a href="#" id="a-hover" data-toggle="modal" data-target="#exampleDelete">삭제</a></td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div> 
                </div>
                <!-- 리스트추가 Modal -->
                <div class="modal fade" id="exampleList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header m-list">
			      	<h5 class="modal-title" id="exampleModalLabel">자원리스트 추가</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원명</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">자원정보</label>
					    <input type="password" class="form-control" id="exampleInputPassword1">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원위치</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <small id="emailHelp" class="form-text text-muted">위치를 지정해주세요.</small>
					  </div>
					</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
			        <button type="submit" class="btn btn-success">추가</button>
			      </div>
			    </div>
			  </div>
			</div>
                <!-- 자원추가 Modal -->
                <div class="modal fade" id="exampleAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header back-color">
			      	<h5 class="modal-title" id="exampleModalLabel">자원(종류이름) 추가</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원명</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="기존자원명고정" >
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">자원정보</label>
					    <input type="password" class="form-control" id="exampleInputPassword1">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원위치</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <small id="emailHelp" class="form-text text-muted">위치를 지정해주세요.</small>
					  </div>
					</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
			        <button type="submit" class="btn btn-primary jawonAddBig">추가</button>
			      </div>
			    </div>
			  </div>
			</div>
                <!-- 수정 Modal -->
                <div class="modal fade" id="exampleEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title" id="exampleModalLabel">자원(자원종류이름) 수정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원명</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">자원정보</label>
					    <input type="password" class="form-control" id="exampleInputPassword1">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원위치</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <small id="emailHelp" class="form-text text-muted">위치를 지정해주세요.</small>
					  </div>
					</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
			        <button type="submit" class="btn btn-success">수정</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 삭제 Modal -->
			<div class="modal fade" id="exampleDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title" id="exampleModalLabel">자원(자원종류이름) 삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        자원명, 자원정보 를 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
			        <button type="submit" class="btn btn-danger">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>

    </div>
    <!-- /.container-fluid -->
     </div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
         
			