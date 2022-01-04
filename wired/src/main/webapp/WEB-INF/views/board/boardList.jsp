<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/board/boardList -->
<style>
/* 제목 */
p.mb-4 {
    float: left;
}

/* 서치바 */
div#boardListSc {
    float: right;
}
input.form-control.mr-2 {
    float: left;
    width: 188px;
}
button.btn.btn-outline-success {
    float: left;
}

/* 게시판 */
.card.shadow.mb-4 {
    clear: both;
}

/* 체크박스 */
input#exampleCheck1\ chkAll {
    position: relative;
    margin-left: 7px;
}

input#exampleCheck1\ chkbox {
    margin-left: 7px;
    margin-top: 10px;
}
</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">관리자 글삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        게시글을 정말 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	      	
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
 
                        
     
    <form name="frmList" method="post" action="<c:url value=''/>">
   	<!-- defaultPage -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">게시판</h1>
		<p class="mb-4">Company bulletin board list.</p>
		
		<!-- 게시판 검색 -->  
		<div id='boardListSc'>
			<input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</div>
        <!-- title1 -->
        <div class="card shadow mb-4">
            
                	
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary">게시판이름</h6><!-- 게시판 이름 -->
             
                 
            
			
	
			
               </div>
               <div class="card-body">
            	
                   <div class="table-responsive">
                   <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                   <div class="row" style="text-align: right">
                   
                   <!-- 이거안함 -->
                   		<div class="col-sm-12 col-md-6">
  							         		
                   		</div>
                   		<div class="col-sm-12 col-md-6" align="right">
                   			<div id="dataTable_filter" class="dataTables_filter">
                   				
                   				
                   			</div>
                   		</div>
                  	 	</div>
              
              
              
              
              
              
              		<div class="row">
              		
              		
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                               	   <th style="width:50px"><input type="checkbox" class="form-check-input" id="exampleCheck1 chkAll"></th>
                                   <th style="width: 151px">Name</th>
                                   <th>title</th>
                                   <th style="width: 90px">등록일</th>
                                   <th style="width: 80px">조회수</th>
                                   <th style="width: 100px">추천</th>
                                  <!-- 관리자 모드일때만 보이게 if처리 -->
                                   <th style="width: 151px">관리</th>
                               </tr>
                           </thead>
                           <tbody>
                           
                           <!-- 반복문 시작 -->
                           <c:forEach var="i" begin="0" end="10">
                               <tr>
                                   <td>
                                   		<input type="checkbox" class="form-check-input" id="exampleCheck1 chkbox">
                                   </td>
                                   <td>Tiger Nixon${i }</td>
                                   <td>
                                   		
                                   		<i class="bi bi-folder"></i><!-- 첨부파일 있는 게시물의 경우if처리 -->
                                   		게시글 제목
                                   </td>
                                   <td>2021/12/26</td>
                                   <td>128</td>
                                   <td>
              							추천수
                                   </td>
                                   	<!-- 관리자 모드일때만 보이게 if처리 게시글 번호로 수정 페이지이동, 삭제 메시지이용-->
                                   <td>
                                   		<div class="bdListBtDiv">
				                            <button type="button" class="btn btn-primary f-left detailbt">글수정</button>
											<button type="button" class="btn btn-danger f-left detailbt" data-toggle="modal" data-target="#exampleModal">글삭제</button>
			                            </div>
	                                   	
                                   </td>
                               </tr>
                           </c:forEach>
                           <!-- 반복 끝 -->
                             
                           </tbody>
                       </table>
              		</div>
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
                   </div>
            
               </div>
            </div>
	    </div>
	    <!-- /.container-fluid -->
     </div>
      </form>        
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
<%@ include file="../inc/bottom.jsp" %>
			