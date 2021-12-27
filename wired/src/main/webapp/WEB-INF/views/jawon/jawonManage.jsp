<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/jawon/jawonManage -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

</style>
<!-- javaScript영역 -->
<script type="text/javascript">


</script>
                        
      <!-- defaultPage -->
    <div class="container-fluid font">
		<div id="topTitle">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800 h1-style">자원관리</h1>
		</div>
        <!-- title1 -->
           
         <div class="card shadow mb-4">
            
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary p-absolute">자원리스트</h6><!-- 게시판 이름 -->
  						<button class="listAdd" onclick="location.href='#'">리스트 추가</button>
             <!-- 게시판 검색 -->      
             <!-- Topbar Search -->
         <!-- <form
             class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search f-right">
             <div class="input-group">
                 <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                     aria-label="Search" aria-describedby="basic-addon2">
                 <div class="input-group-append">
                     <button class="btn btn-primary" type="button">
                         <i class="fas fa-search fa-sm"></i>
                     </button>
                 </div>
             </div>
         </form> -->
         
   		
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
                <c:forEach var="i" begin="1" end="3">  
               <div class="card-body p-bottom-0">
                   <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th>자원명
                                   	<button class="jawonAdd" onclick="location.href='#'">추가</button></th>
                                   <th>자원정보</th>
                                   <th>자원위치</th>
                                   <th>예약시간</th>
                                   <th>상태</th>
                                   <th></th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>차량</td>
                                   <td>아반떼</td>
                                   <td>본관 지하주차장</td>
                                   <td>2021-12-21 17:00 ~ 2021-12-21 18:00</td>
                                   <td>사용/미사용</td>
                                   <td><a href="#" id="a-hover">수정</a>&nbsp;
                                   		<a href="#" id="a-hover">삭제</a></td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
    			</c:forEach>  
                </div>

    </div>
    <!-- /.container-fluid -->
     </div>
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

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp" %>
         
			