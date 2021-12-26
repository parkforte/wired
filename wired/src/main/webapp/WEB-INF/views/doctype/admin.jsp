<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- http://localhost:9091/wired/default/defaultPage -->


<!-- javaScript영역 -->
<script type="text/javascript">


</script>

<!-- defaultPage -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">문서관리</h1>
	<p class="mb-4">전자결재 문서의 종류와 양식을 관리할 수 있습니다.</p>

	<!-- title1 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">문서종류관리</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">
							<i class="bi bi-clipboard"></i> 일반문서
						</h5>
						<button type="button" class="btn btn-danger f-right">삭제</button>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">
							<i class="bi bi-clipboard"></i> 일반문서
						</h5>
						<button type="button" class="btn btn-danger f-right">삭제</button>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">
							<i class="bi bi-clipboard"></i> 일반문서
						</h5>
						<button type="button" class="btn btn-danger f-right">삭제</button>
					</div>
				</div>

				<!-- 종류추가 -->
				<br>
				<div>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal" data-whatever="@mdo">추가</button>
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
										<label for="recipient-name" class="col-form-label">이름
											:</label> <input type="text" class="form-control" id="recipient-name">
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
		</div>
	</div>
	<!-- title1 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">문서양식관리</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">
							<i class="bi bi-clipboard"></i> 일반문서
						</h5>
						<button type="button" class="btn btn-danger f-right">삭제</button>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">
							<i class="bi bi-clipboard"></i> 일반문서
						</h5>
						<button type="button" class="btn btn-danger f-right">삭제</button>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">
							<i class="bi bi-clipboard"></i> 일반문서
						</h5>
						<button type="button" class="btn btn-danger f-right">삭제</button>
					</div>
				</div>

				<!-- 종류추가 -->
				<br>
				<div>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal" data-whatever="@mdo">추가</button>
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
										<label for="recipient-name" class="col-form-label">이름
											:</label> <input type="text" class="form-control" id="recipient-name">
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
		</div>
	</div>

 <div class="row">

                        <div class="col-lg-6">


                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">문서종류관리</h6>
                                </div>
                                <div class="card-body">
                                    The styling for this basic card example is created by using default Bootstrap
                                    utility classes. By using utility classes, the style of the card component can be
                                    easily modified with no need for any custom CSS!
                                </div>
                            </div>
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">문서양식관리</h6>
                                </div>
                                <div class="card-body">
                                    The styling for this basic card example is created by using default Bootstrap
                                    utility classes. By using utility classes, the style of the card component can be
                                    easily modified with no need for any custom CSS!
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6">

                            <!-- Dropdown Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Dropdown Card Example</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    Dropdown menus can be placed in the card header in order to extend the functionality
                                    of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis
                                    icon in the card header can be clicked on in order to toggle a dropdown menu.
                                </div>
                            </div>


                        </div>

                    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
