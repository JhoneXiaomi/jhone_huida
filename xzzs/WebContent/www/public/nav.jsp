<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<script type="text/javascript" src="${ctx }/www/js/navjs.js"></script>

<div id="index_nav">
    <div class='menu_nav'>
      <div class='menu_content'>
         <ul class="nav" style='width: auto;margin: auto;'>
				<li class="nav-green-title"><a href="${ctx }/orderLine" style="color:#fff;">免 费 预 约 设 计</a><!-- <span class="iconfont" style="-moz-transform:rotate(270deg);-webkit-transform:rotate(270deg);transform: rotate(270deg);display: inline-block;margin-left: 10px;font-weight: normal;font-size: 13px;"><</span> --></li>
	    
				<li><h3><a href="${ctx }/" target="_blank">首页</a></h3>
				<ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=348" target="_blank">348套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=418" target="_blank">418套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=518" target="_blank">518套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=618" target="_blank">618套餐</a></h3></li>
		              </ul>
				</li>
				
	            <li>
		           <c:if test="${branchCompany == 'bjxz'  }">
					
					 <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'bdxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=468" target="_blank">468套餐</a></h3></li>
		              </ul>
					</c:if>
		            <c:if test="${branchCompany == 'sjzxz'  }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
		               <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=278" target="_blank">278套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'tyxz'  }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=298" target="_blank">298套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=398" target="_blank">398套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=555" target="_blank">555套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=598" target="_blank">598套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'tjxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'lfxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'tsxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=348" target="_blank">348套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=418" target="_blank">418套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=518" target="_blank">518套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=618" target="_blank">618套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'czxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'xzxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'jnxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'hfxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'cqxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'zzxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
	            </li>
	            
	            <li>
	            	<h3><a href="${ctx }/orderLine" target="_blank">拎包装</a></h3>
	            </li>
	            <li><h3><a href="${ctx }/designer/p1" target="_blank">设计师</a></h3></li>
	            <li><h3><a href="${ctx }/cases/p1" target="_blank">装修案例</a></h3></li>
	            <li><h3><a href="${ctx }/workBuilding/p1" target="_blank">在建工地</a></h3></li>
	            <li><h3><a href="${ctx }/community/p1" target="_blank">团装小区</a></h3></li>
	            <li><h3><a href="${ctx }/news/p1" target="_blank">装修新闻</a></h3></li>
	            <li><h3><a href="${ctx }/about" target="_blank">关于我们</a></h3>
	            
	            <c:if test="${sessionScope.branchCompany == 'tsxz' }">
	            	<ul>
		                <li><h3><a href="${ctx}/businessLicense.jsp" target="_blank">营业执照</a></h3></li>
		            </ul>
	            </c:if>
	            </li>
			</ul>
      </div>
    </div>
</div>

<div class="index_content">
        <!--banner左边信息栏-->
         <%--  <div class="left_info">
	            <ul class="li_hover">
		                <li  class="border_B">
		                    <div class="border_gray">
		                        <div>
		                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
		                            <span class="left_info_title">
										个性化整装
		                            </span>
		                        </div>
		                        <div class="menu-item" style="margin-top: 10px">
		                        	<p> 
		                        	<c:if test="${branchCompany =='sjzxz' }">
		                        
		                        		<a href="${ctx}/IntegratedPackageNew?key=278" target="_blank">278整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378整装</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='tyxz' }">
		                        
		                        		<a href="${ctx}/IntegratedPackageNew?key=298" target="_blank">298整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=398" target="_blank">398整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=555" target="_blank">555整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=598" target="_blank">598整装</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='bjxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">爆款全屋整装</a>
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">传统家装套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='bdxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=468" target="_blank">468套餐</a>
		                       			
		                       		</c:if>
		                       		<c:if test="${branchCompany =='tjxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">新房套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='lfxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">新房套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='tsxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew?key=348" target="_blank">348套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=418" target="_blank">418套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=518" target="_blank">518套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=618" target="_blank">618套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='hfxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">爆款全屋整装</a>
		                       		</c:if>
	                       		</p>  
		                        </div>
		                    </div>
		                </li>        
					
	                
                <li data-submenu="0" class="border_B">
                    <div class="border_gray">
                        <div>
                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
                            <span class="left_info_title">
								面积范围
                            </span>
                        </div>
                        <div class="menu-item" style="margin-top: 10px">
                        	<p>
							  <a target="_blank" href="${ctx}/cases/p1?caseAcreage=40㎡以内">40㎡以内</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=40-60㎡">40-60㎡</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=60-70㎡">60-70㎡</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=70-100㎡">70-100㎡</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=100㎡以外">100㎡以外</a>
                        	</p>
                        </div>
                    </div>
                </li>

				
					
		                <li  class="border_B">
		                    <div class="border_gray">
		                        <div>
		                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
		                            <span class="left_info_title">
										户型
		                            </span>
		                        </div>
		                        <div class="menu-item" style="margin-top: 10px">
		                        	<p>
                                      <a href="${ctx}/cases/p1?casesType=一居" target="_blank">一居</a>
		                              <a href="${ctx}/cases/p1?casesType=两居" target="_blank">两居</a>
		                              <a href="${ctx}/cases/p1?casesType=多居" target="_blank">多居</a>
		                              <a href="${ctx}/cases/p1?casesType=复式" target="_blank">复式</a>
		                              <a href="${ctx}/cases/p1?casesType=洋房" target="_blank">洋房</a>
		                              <a href="${ctx}/cases/p1?casesType=别墅" target="_blank">别墅</a>
		                        	</p>
		                        </div>
		                    </div>
		                </li>
	                
                
					
		                <li  class="border_B">
		                    <div class="border_gray">
		                        <div>
		                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
		                            <span class="left_info_title">装修风格</span>
		                        </div>
		                        <div class="menu-item" style="margin-top: 10px">
		                        	<p>
									  <a href="${ctx}/cases/p1?caseStyle=现代简约" target="_blank">现代简约</a>
		                              <a href="${ctx}/cases/p1?caseStyle=中式风格" target="_blank">中式风格</a>
		                              <a href="${ctx}/cases/p1?caseStyle=经典欧式" target="_blank">经典欧式</a>
		                              <a href="${ctx}/cases/p1?caseStyle=乡村田园" target="_blank">乡村田园</a>										
		                              <a href="${ctx}/cases/p1?caseStyle=地中海" target="_blank">地中海</a>									
		                              <a href="${ctx}/cases/p1?caseStyle=淡雅时光" target="_blank">淡雅时光</a>									
		                              <a href="${ctx}/cases/p1?caseStyle=美式乡村" target="_blank">美式乡村</a>									
		                            </p>
		                        </div>
		                    </div>
		                </li>
		                
	                
	            </ul>
					
	            <div  id="SubMenu_0" class='SubMenu'>
	               
	                <div style="clear: both"></div>
	            </div>
	            	
	        </div> --%>
        <div style="clear: both"></div>
    </div>
	
</body>
</html>