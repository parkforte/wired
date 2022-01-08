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
    margin-left: 31.5%;
}
#content{
	background-color: #F2F2FC;
}
.form-control {
	width: 98%;
}
.c-size {
    margin-left: 5px;
}
.s-half-style{
	width: 30.8%;
}
.half-style{
	width: 47.5%;
}

span {
    padding-top: 11px;
    padding-left: 5px;
    margin-bottom: 10px;
}
.rank-margin {
    margin-top: 16px;
}
.form-group.row.rank-margin {
    margin-top: 16px;
}
label {
    display: inline-block;
    margin-bottom: 0.5rem;
    margin-left: 10px;
}
label#memHoliday{
    margin-left: 45%;
}
label#posNo{
	margin-left: 45%;
}
.payhol_m{
	margin-bottom: 2.5%;
}
.rank_m{
	margin-top: -3%;
}
.form-group.row.b-margin {
    margin-bottom: 3%;
}
</style>

<!-- javaScript영역 -->
<script type="text/javascript">


</script>
               <!-- emplRegister -->
	           <form name="frm" class="user" method="post" action="<c:url value='/employee/emplEdit'/>">
	           <input type="hidden" name="memNo" value="${param.memNo }">
                <div class="container-fluid font">
	                    <!-- Page Heading -->
	                    <!-- title1 -->
	                    <div class="card shadow mb-4 r-table">
	                        <div class="card-body">
	                            <div class="table-responsive">
				                    <div class="outer">
					                    <h1 class="h3 mb-2 text-gray-800 h1-style">사원수정</h1>
					                    <p class="mb-4">Employee Modify</p>
									</div>
	                            	<!-- 이름 -->
									<div class="form-group">
										<label for="name">이름</label>
										<input type="text"
											 class="form-control form-control-user c-size"
											id="memName" name="memName" value="${map['MEM_NAME'] }">
									</div>
                                	<!-- 연락처 -->
									<label for="hp">연락처</label>
		                           	<div class="form-group row">
		                               <select name="memHp1" class="form-control  c-size s-half-style" id="memHp1" title="휴대폰 앞자리">
							            <option value="010"
							            	<c:if test="${map['MEM_HP1']=='010' }">
							            		selected="selected"
							            	</c:if>
							            >010</option>
							            <option value="011"
							            	<c:if test="${map['MEM_HP1']=='011' }">
							            		selected="selected"
							            	</c:if>
							            >011</option>
							            <option value="016"
							            	<c:if test="${map['MEM_HP1']=='016' }">
							            		selected="selected"
							            	</c:if>
							            >016</option>
							            <option value="017"
							            	<c:if test="${map['MEM_HP1']=='017' }">
							            		selected="selected"
							            	</c:if>
							            >017</option>
							            <option value="018"
							            	<c:if test="${map['MEM_HP1']=='018' }">
							            		selected="selected"
							            	</c:if>
							            >018</option>
							            <option value="019"
							            	<c:if test="${map['MEM_HP1']=='019' }">
							            		selected="selected"
							            	</c:if>
							            >019</option>
							       	</select>
							        <span>-</span>
							        <input type="text" name="memHp2" id="memHp2" maxlength="4" title="휴대폰 가운데자리"
							        	class="form-control  c-size s-half-style" value="${map['MEM_HP2'] }">
							        <span>-</span>
							        <input type="text" name="memHp3" id="memHp3" maxlength="4" title="휴대폰 뒷자리"
							        	class="form-control  c-size s-half-style" value="${map['MEM_HP3'] }">
		                            </div>
                                	<hr>
                                	<!-- 연봉,연차 -->
									<label for="memPay" id="memPay">연봉</label><label for="memHoliday" id="memHoliday">연차</label>
	                            	<div class="form-group row payhol_m b-margin">
										<input type="text"
											 class="form-control form-control-user c-size half-style"
											id="memPay" name="memPay" value="${map['MEM_PAY'] }">
									<span></span>
										<input type="text"
											 class="form-control form-control-user c-size half-style"
											id="memHoliday" name="memHoliday" value="${map['MEM_HOLIDAY'] }">
									</div>
									<!-- 부서,직급 -->
									<label for="deptNo" id="deptNo">부서</label><label for="posNo" id="posNo">직급</label>
									<div class="form-group row b-margin">
										<select id="inputState deptNo" class="form-control  c-size half-style" name="deptNo" >
								        <option>부서</option>
								        <option value="1"
								        	<c:if test="${map['DEPT_NO']==1 }">
							            		selected="selected"
							            	</c:if>
								        >인사팀</option>
								        <option value="2"
								        	<c:if test="${map['DEPT_NO']==2 }">
							            		selected="selected"
							            	</c:if>
								        >재무팀</option>
								        <option value="3"
								        	<c:if test="${map['DEPT_NO']==3 }">
							            		selected="selected"
							            	</c:if>
								        >영업1팀</option>
								        <option value="4"
								        	<c:if test="${map['DEPT_NO']==4 }">
							            		selected="selected"
							            	</c:if>
								        >영업2팀</option>
								        <option value="5"
								        	<c:if test="${map['DEPT_NO']==5 }">
							            		selected="selected"
							            	</c:if>
								        >영업3팀</option>
								        <option value="6"
								        	<c:if test="${map['DEPT_NO']==6 }">
							            		selected="selected"
							            	</c:if>
								        >운영1팀</option>
								        <option value="7"
								        	<c:if test="${map['DEPT_NO']==7 }">
							            		selected="selected"
							            	</c:if>
								        >운영2팀</option>
								        <option value="8"
								        	<c:if test="${map['DEPT_NO']==8 }">
							            		selected="selected"
							            	</c:if>
								        >운영3팀</option>
								        <option value="9"
								        	<c:if test="${map['DEPT_NO']==9 }">
							            		selected="selected"
							            	</c:if>
								        >백앤드팀</option>
								        <option value="10"
								        	<c:if test="${map['DEPT_NO']==10 }">
							            		selected="selected"
							            	</c:if>
								        >프론트팀</option>
								        <option value="11"
								        	<c:if test="${map['DEPT_NO']==11 }">
							            		selected="selected"
							            	</c:if>
								        >디자인팀</option>
								    </select>
								    <span></span>
	                                <select id="inputState posNo" class="form-control  c-size half-style" name="posNo" >
								        <option>직급</option>
								        <option value="1"
								        	<c:if test="${map['POS_NO']==1 }">
							            		selected="selected"
							            	</c:if>
								        >사원</option>
								        <option value="2"
								        	<c:if test="${map['POS_NO']==2 }">
							            		selected="selected"
							            	</c:if>
								        >주임</option>
								        <option value="3"
								        	<c:if test="${map['POS_NO']==3 }">
							            		selected="selected"
							            	</c:if>
								        >대리</option>
								        <option value="4"
								        	<c:if test="${map['POS_NO']==4 }">
							            		selected="selected"
							            	</c:if>
								        >과장</option>
								        <option value="5"
								        	<c:if test="${map['POS_NO']==5 }">
							            		selected="selected"
							            	</c:if>
								        >부장</option>
								    </select>
									</div>
                                	<!-- 권한 -->
                                	<label for="ranksNo" id="ranksNo">권한</label>
	                            	<div class="form-group rank_m">
                                    <select id="inputState ranksNo" class="form-control c-size rank-margin" name="ranksNo">
								        <option>권한</option>
								        <option value="1"
								        	<c:if test="${map['RANKS_NO']==1 }">
							            		selected="selected"
							            	</c:if>
								        >일반</option>
								        <option value="2"
								        	<c:if test="${map['RANKS_NO']==2 }">
							            		selected="selected"
							            	</c:if>
								        >팀장이상</option>
								        <option value="3"
								        	<c:if test="${map['RANKS_NO']==3 }">
							            		selected="selected"
							            	</c:if>
								        >관리자</option>
								    </select>
                                	</div>
	                                <div class="form-group c-size" style="text-align: center;">
	                                <br>
	                                    <button type="button" class="btn btn-success b-radius" data-toggle="modal" data-target="#exampleModal">수정</button>
										<button type="button" class="btn btn-danger b-radius" onclick="location.href='<c:url value='/employee/emplList'/>'">취소</button>
                                	</div>
	                            </div>

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
			        <button type="submit" id="emplEdit_submit" class="btn btn-primary b-radius">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			</form>
                <!-- /.container-fluid -->

<%@ include file="../inc/bottom.jsp" %>
