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

.f-left.select {
    margin-right: 9px;
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
	        <h5 class="modal-title" id="exampleModalLabel">업로드할 파일을 선택하세요.</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		  <form name="frmfile" enctype="multipart/form-data" action="" >
	      <div class="modal-body">
			<!-- 파일첨부 -->
				<!-- 파일첨부 인풋 -->
				<input type="file" 
				       class="filepond"
				       name="filepond"
				       multiple
				       data-max-file-size="3MB"
				       data-max-files="3" />
				<!-- 파일첨부 스크립트 -->
				<script src='<c:url value="https://unpkg.com/filepond-plugin-file-encode/dist/filepond-plugin-file-encode.min.js"/>'></script>
				<script src='<c:url value="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.min.js"/>'></script>
				<script src='<c:url value="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.min.js"/>'></script>
				<script src='<c:url value="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"/>'></script>
				<script src='<c:url value="https://unpkg.com/filepond/dist/filepond.min.js"/>'></script><script src='${pageContext.request.contextPath}/resources/js/script.js'></script>
				<!-- 파일첨부 스크립트 -->
	      </div>
	      <div class="modal-footer">
	      	
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="submit" class="btn btn-primary">등록</button>
	      </div>
		</form>
	    </div>
	  </div>
	</div>
 
                        
     
    <form name="frmList" method="post" action="<c:url value=''/>">
   	<!-- defaultPage -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">웹하드</h1>
		<p class="mb-4">Company web hard.</p>
		
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
                   <h6 class="m-0 font-weight-bold text-primary f-left">웹하드</h6><!-- 게시판 이름 -->
	             	<div class="bdListBtDiv f-right">
	             		<div class="f-left select">
					    <select class="form-control form-control-sm" id="inlineFormCustomSelect">
					        <option selected>선택</option>
					        <option value="1">개인 웹하드</option>
					        <option value="2">사내 웹하드</option>
					    </select>
	             		</div>
	                    <button type="button" class="btn btn-primary f-left detailbt" data-toggle="modal" data-target="#exampleModal">업로드</button>
	                    <button type="button" class="btn btn-primary f-left detailbt">다운로드</button>
	                    <!-- 관리자만, 본인 페이지만 삭제 -->
						<button type="button" class="btn btn-danger f-left detailbt">삭제</button>
	               	</div>
                 
            
			
	
			
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
                               	   <th style="width: 120px">업로더</th>
                                   <th>파일이름</th>
                                   <th style="width: 150px">파일크기</th>
                                   <th style="width: 150px">등록일</th>
                                   <th style="width: 120px">다운로드수</th>
                                   <!-- 사내 웹하드에서만 보이기 -->
                                   
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
                                   <td></td>
                                   <td>2021/12/26</td>
                                   <td>
                                   	
                                   		
	                                   	
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
			