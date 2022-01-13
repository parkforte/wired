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
.m-set{
	background: grey;
	color: white;
}
.listSet{
    float: right;
    margin-right: -140px;
    background: grey;
    border: 1px solid;
    border-radius: 5px;
    color: #fff;
    display: block;
    font-size: 0.9em;
    font-weight: 500;
    padding: 0.5em 0.5em;
    position: relative;
}

.listSet:hover {
  color: grey;
  background:#fff;
  border: 1px solid grey;
}

</style>
<!-- javaScript영역 -->
<script type="text/javascript">
$(function() {
	$('.jawonDel').each(function(index,item) {
		$(this).click(function() {
			var res=$(this).val();
			$('#m_btn').click(function(){
		        location.href="<c:url value='/jawon/listdelete?typeNo='/>"+res;
		    });
		});

	});

});


// function windowonload(){

// 	location.href="<c:url value='/jawon/jawonManage2?typeNo='/>"+$('input[name=]');
// }
// window.onload = windowonload;

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
  						<button type="button" class="btn btn-secondary listSet" data-toggle="modal" data-target="#exampleSetting">설정</button>


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
               </ul>
               </div>
               <div class="card-body p-bottom-0">
                   <div class="table-responsive">
                   <c:forEach var="jawonAllVo" items="${tList}">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명 [${jawonAllVo.resTypeVo.typeName }]<input type="text" value="${jawonAllVo.resTypeVo.typeNo }"></th>
                                   <th>자원위치</th>
                                   <th>예약시간</th>
                                   <th>상태</th>
                                   <th>
                                   	<button type="button" class="btn btn-light jawonAdd" value="${jawonAllVo.resTypeVo.typeNo }"
                                   		data-toggle="modal" data-target="#exampleAdd">추가</button>
                                   </th>
                               </tr>
                           </thead>
                           <tbody>
                            <c:if test="${!empty tList }">
                             <c:forEach var="map" items="${jawonAllVo.typeDetailsList }">
	                            <c:if test="${empty jawonAllVo.typeDetailsList }">
	                            	<tr>
	                            		<td colspan="5">데이터가 없습니다.</td>
	                            	</tr>
	                            </c:if>
                               <tr>
                                   <td>${map['RES_NAME'] }</td>
                                   <td>${map['RES_LOCATION'] }</td>
                                   <td>
                                   <fmt:formatDate value="${map['USE_REGDATE'] }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${map['RETURN_REGDATE'] }" pattern="yyyy-MM-dd"/></td>
                                   <td><button type="button" class="btn btn-warning">사용중</button></td>
                                   <td><a href="#" id="a-hover" data-toggle="modal" data-target="#exampleEdit">수정</a>&nbsp;
                                   		<a href="#" id="a-hover" data-toggle="modal" data-target="#exampleDelete">삭제</a></td>
                               </tr>
                               </c:forEach>
                               </c:if>
                           </tbody>
                       </table>
                  </c:forEach>
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
			        <form name="frm2" action="<c:url value='/jawon/listAdd'/>">
			      <div class="modal-body">
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원명</label>
					    <input type="text" class="form-control" id="jawonListAdd" aria-describedby="emailHelp"
					    	name="typeName">
					  </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
			        <button type="submit" class="btn btn-success" id="list-add">추가</button>
			      </div>
					</form>
			    </div>
			  </div>
			</div>
                <!-- 리스트설정 Modal -->
                <div class="modal fade" id="exampleSetting" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header m-set">
			      	<h5 class="modal-title" id="exampleModalLabel">자원리스트 설정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
					  <div class="form-group">
			      <c:forEach var="jawonAllVo" items="${tList}">
					    <label for="exampleInputEmail1">자원명</label>
					    <div>
					    <input type="text" class="form-control" value="${jawonAllVo.resTypeVo.typeName }"
					    	style="width: 250px;" readonly>
					    <button type="button" class="btn btn-danger jawonDel" data-toggle="modal" data-target="#typeDel"
					    	 value="${jawonAllVo.resTypeVo.typeNo }">삭제</button>
					    </div>
			      </c:forEach>
					  </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="typeDel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title" id="exampleModalLabel"></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        삭제 하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" >취소</button>
			        <button type="submit" id="m_btn" class="btn btn-danger" >확인</button>
			        <!-- <input type="text" id="modal_btn" value=""> -->
			      </div>
			    </div>
			  </div>
			</div>
                <!-- 자원추가 Modal -->
                <div class="modal fade" id="exampleAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header back-color">
			      	<h5 class="modal-title" id="exampleModalLabel">자원정보 추가</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form name="frmRes" action="<c:url value='/jawon/jawon'/>">
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원명</label>
					    <input type="email" class="form-control" id="exampleInputEmail1"  name="typeNo"
					    	aria-describedby="emailHelp" value="" ><span></span>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">자원정보</label>
					    <input type="password" class="form-control" id="exampleInputPassword1" name="resName">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">자원위치</label>
					    <input type="email" class="form-control" id="exampleInputEmail1"
					    	aria-describedby="emailHelp" name="resLocation">
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
    </div>
    <!-- /.container-fluid -->
     </div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>

