<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<!-- http://localhost:9091/wired/board/boardList -->

<!-- javaScript영역 -->
<script type="text/javascript">


</script>

 
                        
                        
   	<!-- defaultPage -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">게시판</h1>
		<p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="h.ttps://datatablesnet">official DataTables documentation</a>.</p>
		
        <!-- title1 -->
        <div class="card shadow mb-4">
            
                	
           <!-- DataTales Example -->
           <div class="card shadow mb-4">
               <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary">게시판이름</h6><!-- 게시판 이름 -->
             
             <!-- 게시판 검색 -->  
                 
            
			
	
			
               </div>
               <div class="card-body">
            	
                   <div class="table-responsive">
                   <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                   <div class="row" style="text-align: right">
                   
                   <!-- 이거안함 -->
                   		<div class="col-sm-12 col-md-6">
  							<!-- <div class="dataTables_length" id="dataTable_length" style="float: left">
  								<label>
  									Show
  									<select name="" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
  										<option value="10">10</option>
  										<option value="20">20</option>
  										<option value="50">50</option>
  									</select>
  									entries
  								</label>
  							</div>   -->               		
                   		</div>
                   		<div class="col-sm-12 col-md-6" align="right">
                   			<div id="dataTable_filter" class="dataTables_filter">
                   				<div class="bdListSearch">
	                   				<label class="f-right">Search:</label>
                   				</div>
                   				<div class="bdListSearchText">
                   				
    	               				<input type="search" class="form-control form-control-sm" placeholder aria-controls="dataTable"/>
                   				</div>
                   			</div>
                   		</div>
                   </div>
              
              
              
              
              
              
              		<div class="row">
              		
              		
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                           <thead>
                               <tr>
                                   <th style="width: 151px">Name</th>
                                   <th>title</th>
                                   <th style="width: 90px">등록일</th>
                                   <th style="width: 90px">조회수</th>
                                   <th style="width: 160px">추천</th>
                                  <!-- 관리자 모드일때만 보이게 if처리 -->
                                   <th style="width: 151px">관리</th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>Tiger Nixon</td>
                                   <td>
                                   		
                                   		<i class="bi bi-folder"></i><!-- 첨부파일 있는 게시물의 경우if처리 -->
                                   		게시글 제목
                                   </td>
                                   <td>2021/12/26</td>
                                   <td>128</td>
                                   <td>
              							추천수
                                   		<button type="button" class="btn btn-primary" style="font-size: 0.7em","margin" >
                                   			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
	  											<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
											</svg>
                                   			추천
                                   		</button>
                                   	</td>
                                   	<!-- 관리자 모드일때만 보이게 if처리 게시글 번호로 수정 페이지이동, 삭제 메시지이용-->
                                   <td>
                                   		<div class="bdListBtDiv">
				                            <button type="button" class="btn btn-primary f-left detailbt">글수정</button>
											<button type="button" class="btn btn-danger f-left detailbt">글삭제</button>
			                            </div>
	                                   	
                                   </td>
                               </tr>
                               <tr>
                                   <td>Garrett Winters</td>
                                   <td>Accountant</td>
                                   <td>Tokyo</td>
                                   <td>63</td>
                                   <td>2011/07/25</td>
                                   <td>$170,750</td>
                               </tr>
                               <tr>
                                   <td>Ashton Cox</td>
                                   <td>Junior Technical Author</td>
                                   <td>San Francisco</td>
                                   <td>66</td>
                                   <td>2009/01/12</td>
                                   <td>$86,000</td>
                               </tr>
                               <tr>
                                   <td>Cedric Kelly</td>
                                   <td>Senior Javascript Developer</td>
                                   <td>Edinburgh</td>
                                   <td>22</td>
                                   <td>2012/03/29</td>
                                   <td>$433,060</td>
                               </tr>
                               <tr>
                                   <td>Airi Satou</td>
                                   <td>Accountant</td>
                                   <td>Tokyo</td>
                                   <td>33</td>
                                   <td>2008/11/28</td>
                                   <td>$162,700</td>
                               </tr>
                               <tr>
                                   <td>Brielle Williamson</td>
                                   <td>Integration Specialist</td>
                                   <td>New York</td>
                                   <td>61</td>
                                   <td>2012/12/02</td>
                                   <td>$372,000</td>
                               </tr>
                               <tr>
                                   <td>Herrod Chandler</td>
                                   <td>Sales Assistant</td>
                                   <td>San Francisco</td>
                                   <td>59</td>
                                   <td>2012/08/06</td>
                                   <td>$137,500</td>
                               </tr>
                               <tr>
                                   <td>Rhona Davidson</td>
                                   <td>Integration Specialist</td>
                                   <td>Tokyo</td>
                                   <td>55</td>
                                   <td>2010/10/14</td>
                                   <td>$327,900</td>
                               </tr>
                               <tr>
                                   <td>Colleen Hurst</td>
                                   <td>Javascript Developer</td>
                                   <td>San Francisco</td>
                                   <td>39</td>
                                   <td>2009/09/15</td>
                                   <td>$205,500</td>
                               </tr>
                               <tr>
                                   <td>Sonya Frost</td>
                                   <td>Software Engineer</td>
                                   <td>Edinburgh</td>
                                   <td>23</td>
                                   <td>2008/12/13</td>
                                   <td>$103,600</td>
                               </tr>
                               <tr>
                                   <td>Jena Gaines</td>
                                   <td>Office Manager</td>
                                   <td>London</td>
                                   <td>30</td>
                                   <td>2008/12/19</td>
                                   <td>$90,560</td>
                               </tr>
                               <tr>
                                   <td>Quinn Flynn</td>
                                   <td>Support Lead</td>
                                   <td>Edinburgh</td>
                                   <td>22</td>
                                   <td>2013/03/03</td>
                                   <td>$342,000</td>
                               </tr>
                               <tr>
                                   <td>Charde Marshall</td>
                                   <td>Regional Director</td>
                                   <td>San Francisco</td>
                                   <td>36</td>
                                   <td>2008/10/16</td>
                                   <td>$470,600</td>
                               </tr>
                               <tr>
                                   <td>Haley Kennedy</td>
                                   <td>Senior Marketing Designer</td>
                                   <td>London</td>
                                   <td>43</td>
                                   <td>2012/12/18</td>
                                   <td>$313,500</td>
                               </tr>
                               <tr>
                                   <td>Tatyana Fitzpatrick</td>
                                   <td>Regional Director</td>
                                   <td>London</td>
                                   <td>19</td>
                                   <td>2010/03/17</td>
                                   <td>$385,750</td>
                               </tr>
                               <tr>
                                   <td>Michael Silva</td>
                                   <td>Marketing Designer</td>
                                   <td>London</td>
                                   <td>66</td>
                                   <td>2012/11/27</td>
                                   <td>$198,500</td>
                               </tr>
                               <tr>
                                   <td>Paul Byrd</td>
                                   <td>Chief Financial Officer (CFO)</td>
                                   <td>New York</td>
                                   <td>64</td>
                                   <td>2010/06/09</td>
                                   <td>$725,000</td>
                               </tr>
                               <tr>
                                   <td>Gloria Little</td>
                                   <td>Systems Administrator</td>
                                   <td>New York</td>
                                   <td>59</td>
                                   <td>2009/04/10</td>
                                   <td>$237,500</td>
                               </tr>
                               <tr>
                                   <td>Bradley Greer</td>
                                   <td>Software Engineer</td>
                                   <td>London</td>
                                   <td>41</td>
                                   <td>2012/10/13</td>
                                   <td>$132,000</td>
                               </tr>
                               <tr>
                                   <td>Dai Rios</td>
                                   <td>Personnel Lead</td>
                                   <td>Edinburgh</td>
                                   <td>35</td>
                                   <td>2012/09/26</td>
                                   <td>$217,500</td>
                               </tr>
                               <tr>
                                   <td>Jenette Caldwell</td>
                                   <td>Development Lead</td>
                                   <td>New York</td>
                                   <td>30</td>
                                   <td>2011/09/03</td>
                                   <td>$345,000</td>
                               </tr>
                               <tr>
                                   <td>Yuri Berry</td>
                                   <td>Chief Marketing Officer (CMO)</td>
                                   <td>New York</td>
                                   <td>40</td>
                                   <td>2009/06/25</td>
                                   <td>$675,000</td>
                               </tr>
                               <tr>
                                   <td>Caesar Vance</td>
                                   <td>Pre-Sales Support</td>
                                   <td>New York</td>
                                   <td>21</td>
                                   <td>2011/12/12</td>
                                   <td>$106,450</td>
                               </tr>
                               <tr>
                                   <td>Doris Wilder</td>
                                   <td>Sales Assistant</td>
                                   <td>Sidney</td>
                                   <td>23</td>
                                   <td>2010/09/20</td>
                                   <td>$85,600</td>
                               </tr>
                               <tr>
                                   <td>Angelica Ramos</td>
                                   <td>Chief Executive Officer (CEO)</td>
                                   <td>London</td>
                                   <td>47</td>
                                   <td>2009/10/09</td>
                                   <td>$1,200,000</td>
                               </tr>
                               <tr>
                                   <td>Gavin Joyce</td>
                                   <td>Developer</td>
                                   <td>Edinburgh</td>
                                   <td>42</td>
                                   <td>2010/12/22</td>
                                   <td>$92,575</td>
                               </tr>
                               <tr>
                                   <td>Jennifer Chang</td>
                                   <td>Regional Director</td>
                                   <td>Singapore</td>
                                   <td>28</td>
                                   <td>2010/11/14</td>
                                   <td>$357,650</td>
                               </tr>
                               <tr>
                                   <td>Brenden Wagner</td>
                                   <td>Software Engineer</td>
                                   <td>San Francisco</td>
                                   <td>28</td>
                                   <td>2011/06/07</td>
                                   <td>$206,850</td>
                               </tr>
                               <tr>
                                   <td>Fiona Green</td>
                                   <td>Chief Operating Officer (COO)</td>
                                   <td>San Francisco</td>
                                   <td>48</td>
                                   <td>2010/03/11</td>
                                   <td>$850,000</td>
                               </tr>
                               <tr>
                                   <td>Shou Itou</td>
                                   <td>Regional Marketing</td>
                                   <td>Tokyo</td>
                                   <td>20</td>
                                   <td>2011/08/14</td>
                                   <td>$163,000</td>
                               </tr>
                               <tr>
                                   <td>Michelle House</td>
                                   <td>Integration Specialist</td>
                                   <td>Sidney</td>
                                   <td>37</td>
                                   <td>2011/06/02</td>
                                   <td>$95,400</td>
                               </tr>
                               <tr>
                                   <td>Suki Burks</td>
                                   <td>Developer</td>
                                   <td>London</td>
                                   <td>53</td>
                                   <td>2009/10/22</td>
                                   <td>$114,500</td>
                               </tr>
                               <tr>
                                   <td>Prescott Bartlett</td>
                                   <td>Technical Author</td>
                                   <td>London</td>
                                   <td>27</td>
                                   <td>2011/05/07</td>
                                   <td>$145,000</td>
                               </tr>
                               <tr>
                                   <td>Gavin Cortez</td>
                                   <td>Team Leader</td>
                                   <td>San Francisco</td>
                                   <td>22</td>
                                   <td>2008/10/26</td>
                                   <td>$235,500</td>
                               </tr>
                               <tr>
                                   <td>Martena Mccray</td>
                                   <td>Post-Sales support</td>
                                   <td>Edinburgh</td>
                                   <td>46</td>
                                   <td>2011/03/09</td>
                                   <td>$324,050</td>
                               </tr>
                               <tr>
                                   <td>Unity Butler</td>
                                   <td>Marketing Designer</td>
                                   <td>San Francisco</td>
                                   <td>47</td>
                                   <td>2009/12/09</td>
                                   <td>$85,675</td>
                               </tr>
                               <tr>
                                   <td>Howard Hatfield</td>
                                   <td>Office Manager</td>
                                   <td>San Francisco</td>
                                   <td>51</td>
                                   <td>2008/12/16</td>
                                   <td>$164,500</td>
                               </tr>
                               <tr>
                                   <td>Hope Fuentes</td>
                                   <td>Secretary</td>
                                   <td>San Francisco</td>
                                   <td>41</td>
                                   <td>2010/02/12</td>
                                   <td>$109,850</td>
                               </tr>
                               <tr>
                                   <td>Vivian Harrell</td>
                                   <td>Financial Controller</td>
                                   <td>San Francisco</td>
                                   <td>62</td>
                                   <td>2009/02/14</td>
                                   <td>$452,500</td>
                               </tr>
                               <tr>
                                   <td>Timothy Mooney</td>
                                   <td>Office Manager</td>
                                   <td>London</td>
                                   <td>37</td>
                                   <td>2008/12/11</td>
                                   <td>$136,200</td>
                               </tr>
                               <tr>
                                   <td>Jackson Bradshaw</td>
                                   <td>Director</td>
                                   <td>New York</td>
                                   <td>65</td>
                                   <td>2008/09/26</td>
                                   <td>$645,750</td>
                               </tr>
                               <tr>
                                   <td>Olivia Liang</td>
                                   <td>Support Engineer</td>
                                   <td>Singapore</td>
                                   <td>64</td>
                                   <td>2011/02/03</td>
                                   <td>$234,500</td>
                               </tr>
                               <tr>
                                   <td>Bruno Nash</td>
                                   <td>Software Engineer</td>
                                   <td>London</td>
                                   <td>38</td>
                                   <td>2011/05/03</td>
                                   <td>$163,500</td>
                               </tr>
                               <tr>
                                   <td>Sakura Yamamoto</td>
                                   <td>Support Engineer</td>
                                   <td>Tokyo</td>
                                   <td>37</td>
                                   <td>2009/08/19</td>
                                   <td>$139,575</td>
                               </tr>
                               <tr>
                                   <td>Thor Walton</td>
                                   <td>Developer</td>
                                   <td>New York</td>
                                   <td>61</td>
                                   <td>2013/08/11</td>
                                   <td>$98,540</td>
                               </tr>
                               <tr>
                                   <td>Finn Camacho</td>
                                   <td>Support Engineer</td>
                                   <td>San Francisco</td>
                                   <td>47</td>
                                   <td>2009/07/07</td>
                                   <td>$87,500</td>
                               </tr>
                               <tr>
                                   <td>Serge Baldwin</td>
                                   <td>Data Coordinator</td>
                                   <td>Singapore</td>
                                   <td>64</td>
                                   <td>2012/04/09</td>
                                   <td>$138,575</td>
                               </tr>
                               <tr>
                                   <td>Zenaida Frank</td>
                                   <td>Software Engineer</td>
                                   <td>New York</td>
                                   <td>63</td>
                                   <td>2010/01/04</td>
                                   <td>$125,250</td>
                               </tr>
                               <tr>
                                   <td>Zorita Serrano</td>
                                   <td>Software Engineer</td>
                                   <td>San Francisco</td>
                                   <td>56</td>
                                   <td>2012/06/01</td>
                                   <td>$115,000</td>
                               </tr>
                               <tr>
                                   <td>Jennifer Acosta</td>
                                   <td>Junior Javascript Developer</td>
                                   <td>Edinburgh</td>
                                   <td>43</td>
                                   <td>2013/02/01</td>
                                   <td>$75,650</td>
                               </tr>
                               <tr>
                                   <td>Cara Stevens</td>
                                   <td>Sales Assistant</td>
                                   <td>New York</td>
                                   <td>46</td>
                                   <td>2011/12/06</td>
                                   <td>$145,600</td>
                               </tr>
                               <tr>
                                   <td>Hermione Butler</td>
                                   <td>Regional Director</td>
                                   <td>London</td>
                                   <td>47</td>
                                   <td>2011/03/21</td>
                                   <td>$356,250</td>
                               </tr>
                               <tr>
                                   <td>Lael Greer</td>
                                   <td>Systems Administrator</td>
                                   <td>London</td>
                                   <td>21</td>
                                   <td>2009/02/27</td>
                                   <td>$103,500</td>
                               </tr>
                               <tr>
                                   <td>Jonas Alexander</td>
                                   <td>Developer</td>
                                   <td>San Francisco</td>
                                   <td>30</td>
                                   <td>2010/07/14</td>
                                   <td>$86,500</td>
                               </tr>
                               <tr>
                                   <td>Shad Decker</td>
                                   <td>Regional Director</td>
                                   <td>Edinburgh</td>
                                   <td>51</td>
                                   <td>2008/11/13</td>
                                   <td>$183,000</td>
                               </tr>
                               <tr>
                                   <td>Michael Bruce</td>
                                   <td>Javascript Developer</td>
                                   <td>Singapore</td>
                                   <td>29</td>
                                   <td>2011/06/27</td>
                                   <td>$183,000</td>
                               </tr>
                               <tr>
                                   <td>Donna Snider</td>
                                   <td>Customer Support</td>
                                   <td>New York</td>
                                   <td>27</td>
                                   <td>2011/01/25</td>
                                   <td>$112,000</td>
                               </tr>
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
			