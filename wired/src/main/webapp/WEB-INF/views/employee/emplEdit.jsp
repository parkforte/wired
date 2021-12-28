<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/employee/emplEdit -->

<!-- css영역 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
.outer{
	text-align: center;
}
.r-table {
    width: 36%;
    margin-left: 32.5%;
}
#content{
	background-color: #6868AC;
}
.form-control {
	width: 98%;
}
.c-size {
    margin-left: 5px;
}
input#jumin1 {
    width: 47.5%;
}
span {
    padding-top: 11px;
    padding-left: 5px;
}
input#jumin2 {
    width: 47.5%;
}
</style>

<!-- javaScript영역 -->
<script type="text/javascript">


</script>
               <!-- emplRegister -->
                <div class="container-fluid font">
	                    <!-- Page Heading -->
	                    <!-- title1 -->
	                    <div class="card shadow mb-4 r-table">
	                        <div class="card-body">
	                        <form class="user">
	                            <div class="table-responsive">
				                    <div class="outer">
					                    <h1 class="h3 mb-2 text-gray-800 h1-style">사원수정</h1>
					                    <p class="mb-4">Employee Modify</p>
									</div>
	                            	<!-- 이름 -->
	                            	<div class="form-group">
                                    <input type="text" class="form-control form-control-user c-size" id="name"
                                        placeholder="이름">
                                	</div>
                                	<!-- 휴대폰 -->
	                            	<div class="form-group hp-margin">
                                    <input type="text" class="form-control form-control-user c-size" id="hp"
                                        placeholder="휴대폰번호">
                                	</div>
                                	<hr>
                                	<!-- 부서,직급 -->
	                            	<div class="form-group row">
	                                <input type="text" class="form-control form-control-user c-size" id="jumin1"
	                                    placeholder="부서">
	                                <span></span>
	                                <input type="text" class="form-control form-control-user c-size" id="jumin2"
	                                    placeholder="직급">
                                	</div>
	                                <div class="form-group c-size">
	                                <br>
	                                    <button type="button" class="btn btn-success b-radius" data-toggle="modal" data-target="#exampleModal">수정</button>
										<button type="button" class="btn btn-danger b-radius">취소</button>
                                	</div>
	                            </div>
	                            </form>
	                        </div>
						</div>

                </div>
                <!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title" id="exampleModalLabel">사원수정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        수정하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary b-radius" data-dismiss="modal" >취소</button>
			        <button type="submit" class="btn btn-primary b-radius">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
                <!-- /.container-fluid -->
				
<%@ include file="../inc/bottom.jsp" %>
			