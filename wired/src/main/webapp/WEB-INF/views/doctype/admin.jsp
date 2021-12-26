<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- javaScript영역 -->
<script type="text/javascript">
	$(function(){
		$('.your-checkbox').prop('indeterminate', true);
	});

	
</script>


<!-- defaultPage -->
<div class="container-fluid font">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">문서관리</h1>
	<p class="mb-4">전자결재 문서의 종류와 양식을 관리할 수 있습니다.</p>
	<div class="row">
		<div class="col-lg-6">
			<!-- 문서종류관리 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">문서종류관리</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">

						<div class="card" style="width: 18rem;">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck1"> <label
											class="custom-control-label" for="customCheck1"><i
											class="bi bi-clipboard"></i> 문서1</label>
									</div>
								</li>
								<li class="list-group-item">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck2"> <label
											class="custom-control-label" for="customCheck2"><i
											class="bi bi-clipboard"></i> 문서2</label>
									</div>
								</li>
								<li class="list-group-item">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="customCheck3"> <label
											class="custom-control-label" for="customCheck3"><i
											class="bi bi-clipboard"></i> 문서3</label>
									</div>
								</li>
							</ul>
						</div>
						<!-- 종류추가 -->
						<br>
						<div>
							<button type="button" class="btn btn-primary f-left" data-toggle="modal"
								data-target="#exampleModal" data-whatever="@mdo">추가</button>
								<!-- 종류삭제 -->
							<button type="button" class="btn btn-danger f-left"
								data-toggle="modal" data-target="#exampleModa2">삭제</button>
						</div>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">문서종류추가</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<input type="text" class="form-control" id="recipient-name"
													placeholder="문서 종류의 이름을 입력하세요.">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 종류삭제 -->
					<!-- Modal -->
					<div class="modal fade" id="exampleModa2" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">문서종류삭제</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">선택하신 문서종류를 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">삭제</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="col-lg-6">

			<!-- 전체문서목록 -->
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">전체문서목록</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">정렬 :</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- 본문 -->
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Tiger Nixon</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
									<td>2011/04/25</td>
								</tr>
							</tbody>
						</table>
						<!-- 종류추가 -->
						<br>
						<div>
							<button type="button" class="btn btn-primary f-left" data-toggle="modal"
								data-target="#exampleModa3" data-whatever="@mdo">추가</button>
								<!-- 종류삭제 -->
							<button type="button" class="btn btn-danger f-left"
								data-toggle="modal" data-target="#exampleModa4">삭제</button>
						</div>
						
						<div class="modal fade" id="exampleModa3" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">문서양식추가</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<input type="text" class="form-control" id="recipient-name"
													placeholder="문서 종류의 이름을 입력하세요.">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="recipient-name"
													placeholder="문서 종류의 이름을 입력하세요.">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="recipient-name"
													placeholder="문서 종류의 이름을 입력하세요.">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="exampleModa4" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">문서종류삭제</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">선택하신 문서양식을 삭제하시겠습니까?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary">삭제</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
