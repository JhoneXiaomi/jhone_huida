<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>
<html>
<body>
	<div class=" nav01">
		<div class="w1180">
			<div class="subMenu">
				<div class="inner Nav iNav" id="navONload">
					<ul class="Column">
						<li class="end"><a target="_blank"
							href="${pageContext.request.contextPath}/" id="sTop"
							class="subNavBtn current">网站首页</a></li>
						<c:if test="${currentBCompany== 'bjsc'}">
							<li><a target="_blank"
								href="${pageContext.request.contextPath}/IntegratedPackage?key=588"
								id="s1" class="subNavBtn">整装套餐</a>
								<div class="subNav">
									<%--   <a href="${pageContext.request.contextPath}/IntegratedPackage?key=288">288装修套餐</a>
            <a href="${pageContext.request.contextPath}/IntegratedPackage?key=358">358装修套餐</a>
            <a href="${pageContext.request.contextPath}/IntegratedPackage?key=458">458装修套餐</a> --%>
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=588">588装修套餐</a>
									<%-- <a href="${pageContext.request.contextPath}/IntegratedPackage">整装套餐</a> --%>
								</div></li>
						</c:if>
						<c:if test="${currentBCompany == 'tysc'}">
							<li><a target="_blank"
								href="${pageContext.request.contextPath}/package588" id="s1"
								class="subNavBtn">整装套餐</a></li>
						</c:if>
						<c:if test="${currentBCompany == 'tjsc'}">
							<li><a
								href="${pageContext.request.contextPath}/IntegratedPackage"
								id="s1" class="subNavBtn">整装套餐</a></li>
						</c:if>
						<c:if test="${currentBCompany == 'hssc'}">
							<li><a
								href="${pageContext.request.contextPath}/IntegratedPackage"
								id="s1" class="subNavBtn">整装套餐</a></li>
						</c:if>
						<c:if test="${currentBCompany == 'bdsc'}">
							<li><a
								href="${pageContext.request.contextPath}/IntegratedPackage"
								id="s1" class="subNavBtn">整装套餐</a>
								<div class="subNav">
									<!--<a href="${pageContext.request.contextPath}/IntegratedPackage?key=278">278装修套餐</a>-->
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=288">288精装小户型</a>
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=358">358装修套餐</a>
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=588">588装修套餐</a>
								</div></li>
						</c:if>
						<c:if test="${sessionScope.branchCompany == 'lfsc'}">
							<li><a
								href="${pageContext.request.contextPath}/IntegratedPackage"
								id="s1" class="subNavBtn">整装套餐</a></li>
						</c:if>
						<c:if test="${sessionScope.branchCompany == 'sjzsc'}">
							<li><a
								href="${pageContext.request.contextPath}/IntegratedPackage?key=358"
								id="s1" class="subNavBtn">358装修套餐</a>
								<div class="subNav">
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=358">358装修套餐</a>
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=458">458装修套餐</a>
									<!-- <a href="${pageContext.request.contextPath}/IntegratedPackage?key=278">278装修套餐</a>
          <a href="${pageContext.request.contextPath}/IntegratedPackage?key=378">378装修套餐</a> -->
								</div></li>
						</c:if>
						<c:if test="${sessionScope.branchCompany == 'tssc'}">
							<li><a
								href="${pageContext.request.contextPath}/IntegratedPackage"
								id="s1" class="subNavBtn">整装套餐</a>

								<div class="subNav">
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=268">268装修套餐</a>
									<a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=298"
										id="s1" class="subNavBtn">298装修套餐</a> <a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=398"
										id="s1" class="subNavBtn">398装修套餐</a> <a
										href="${pageContext.request.contextPath}/IntegratedPackage?key=598"
										id="s1" class="subNavBtn">598装修套餐</a> <a
										href="${pageContext.request.contextPath}/IntegratedPackage">整装套餐</a>
								</div></li>
						</c:if>
						<li><a target="_blank"
							href="${pageContext.request.contextPath }/cases/p1" id="s2"
							class="subNavBtn">设计案例</a> <%--  <div class="subNav">
                  <a href="${pageContext.request.contextPath}/house/p1">楼盘信息</a>
                   <a href="javascript:void(0)">在建工地</a>
                  <a href="javascript:void(0)">户型点评</a>
               </div> --%></li>
						<li><a target="_blank"
							href="${pageContext.request.contextPath}/spec/p1?type=热门活动"
							id="s3" class="subNavBtn">热门活动</a>
							<div class="subNav">
								<a href="${pageContext.request.contextPath}/hotBuilding/p1">热装楼盘</a>
								<a href="${pageContext.request.contextPath}/spec/p1?type=装修活动">装修活动</a>
							</div></li>
						<li><a target="_blank"
							href="${pageContext.request.contextPath}/designer/p1" id="s4"
							class="subNavBtn">设计团队</a></li>
						<li><a target="_blank"
							href="${pageContext.request.contextPath}/specase/p1?type=说装修"
							id="s5" class="subNavBtn">说装修</a>
							<div class="subNav">
								<a
									href="${pageContext.request.contextPath}/specase/p1?type=行业资讯">行业资讯</a>
								<a
									href="${pageContext.request.contextPath}/specase/p1?type=装修攻略">装修攻略</a>
								<a
									href="${pageContext.request.contextPath}/specase/p1?type=家装日记">家装日记</a>
							</div></li>
						<li><a target="_blank"
							href="${pageContext.request.contextPath}/blueDiamondProcess"
							id="s6" class="subNavBtn">蓝钻工艺</a></li>
						<li><a target="_blank" href="javascript:void(0)" id="s7"
							class="subNavBtn">三创服务</a>
							<div class="subNav">
								<a href="${pageContext.request.contextPath}/commen/p1">常见问题</a>
								<a href="${pageContext.request.contextPath}/orderLine">在线订单</a>
							</div></li>
						<li><a target="_blank"
							href="${pageContext.request.contextPath}/about" id="s8"
							class="subNavBtn end">关于三创</a>
							<c:if test="${sessionScope.branchCompany == 'tssc' }">
							<div class="subNav">
								<a href="${pageContext.request.contextPath}/www/businessLicense.jsp">常见问题</a>
							</div>
							</c:if>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
</body>
</html>