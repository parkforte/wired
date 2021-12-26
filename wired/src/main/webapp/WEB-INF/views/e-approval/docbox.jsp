<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- javaScript영역 -->
<script type="text/javascript">


</script>
<style>
.setW20 {
	width: 20%;
}

.setW75 {
	width: 75%;
}
</style>

<!-- defaultPage -->
<div class="container-fluid font">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">전자결재</h1>
	<p class="mb-4">DataTables is a third party plugin that is used to
		generate the demo table below. For more information about DataTable</p>

	<!-- title1 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 ">
			<h6 class="m-0 font-weight-bold text-primary">문서함</h6>
		</div>
		<div class="card-body ">
			<div class="table-responsive setW20 f-left">

				<div class="card text-center" style="width: 18rem;">
					<div class="card-header">문서상태</div>
					<ul class="list-group list-group-flush nav flex-column">
						<li class="list-group-item nav-item"><i class="bi bi-clipboard"></i> 결재대기</li>
						<li class="list-group-item nav-item"><i class="bi bi-clipboard"></i> 결재완료</li>
						<li class="list-group-item nav-item"><i class="bi bi-clipboard"></i> 결재반려</li>
						<li class="list-group-item nav-item"><i class="bi bi-clipboard"></i> 임시저장</li>
					</ul>
				</div>

			</div>
			<div class="table-responsive f-left setW75">
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
				<nav class="f-right"aria-label="...">
				  <ul class="pagination">
				    <li class="page-item disabled">
				      <a class="page-link">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="#">2</a>
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
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
