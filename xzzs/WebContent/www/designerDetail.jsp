<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>    
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>${designer.designerName}设计师-${companyCity}新洲公司</title>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/component.css"/> 
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
</head>
<body>

	<!--头部 start-->
	<jsp:include page="public/header.jsp"/>
	<!--头部 end-->
	<div class="clear"></div>
	<!--nav start-->
	<jsp:include page="public/nav.jsp"/>
	<!--nav end-->
	
	
	<div class="clear"></div>
	 
	<!-- banner start-->
	<div class="ej_ban"><img src="${ctx }/www/images/recommendbg.jpg" width="100%"/></div>
	<!--banner end-->
	<div class="clear"></div>
	
	<div class="ej_main w1200">
	  <div class="ej_main_local sjs_local">您的当前位置：<a href="${ctx }">${companyCity}装修</a>><a href="${ctx }/designer/p1">设计团队</a></div>
	  
	  <div class="sjs_info">
	  
	    <div class="sjs_info_left fl">
	    <img src="${designer.designerPhotoImg }" width="220" height="264"/></div>
	    <div class="sjs_info_right fr">	
	       <p>姓名：${designer.designerName}</p>
	       <p>级别：${designer.designerTitle }</p>
	       <p>擅长风格：${designer.designerStyle }</p>
	       <a href="">Ta的案例</a>   <a href="">业主口碑</a>  <a href="">Ta的简介</a>
	    </div>
	  </div>
	  
	  <div class="sjs_anli w1200 clearfix">
	  <c:forEach items="${caseList }" var="cases" begin="0" end="5" varStatus="status">
	  
	  		<c:if test="${(status.index+1)%3 !=0 }">
	  		
		 		<dl>
			      <dt>
				      <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
				      	<img src="${cases.caseThumbImg }" width="380" height="315"/>
				      </a>
			      </dt>
			 	  <dd>
			        <p><span class="">【案例】</span>
			    		<c:choose>
			      	
			           		<c:when test="${fn:length(cases.caseTitle)>4 }">
			    		
			    				【${fn:substring(cases.caseTitle,0,4) }】
			    			</c:when>
			    			<c:otherwise>【${cases.caseTitle }】</c:otherwise>
			    	    </c:choose>	    
			            ${cases.caseStyle } ${cases.caseHouseType } ${cases.caseAcreage } ㎡</p>
			             <p class="detail">
			               <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}">
			              	 	<img class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/>
			               		<span class="m50">${cases.designerName }</span>
		                   </a>
			               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
			               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
			               <font><button class="md-trigger" data-modal="modal-1" > 这样装修得花多少钱？</button></font>
			             </p>
			      </dd>			      
			    </dl>	
			   <div class="md-modal md-effect-1" id="modal-1" >
					<div>
					<div class="md-content">
						<h3>立即预约设计师</h3>
						<div>
							<p>您的姓名：<input type="text" name="order_clientName"/></p>
							<p>您的手机：<input type="text" name="order_phone"/></p>
							<p>楼盘信息：<input type="text" name="order_address"/></p>							
							<p>房屋面积：<input type="text" name="order_acreage"/></p>
							<p>设&nbsp;计&nbsp;师&nbsp;:
							<select name="designerName" id="designerName" style="width:200px;font-size:12px">
								<c:forEach items="${designerList }" var="designer">
									<option value="${designer.designerName }">${designer.designerName } </option>
								</c:forEach>
							</select>
							</p>
							<div class="submit_btn" id="but_order">立即预约</div>
							<button class="md-close" style="left: 317px;"></button>	
						</div>
					</div>
					</div>
				</div>	  		
	  		</c:if>
	  		<c:if test="${(status.index+1)%3 ==0 }">
	  		
		 		<dl class="no_mar">
			      <dt>
				      <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
				      	<img src="${cases.caseThumbImg }" width="380" height="315"/>
				      </a>
			      </dt>
			 	  <dd>
			        <p><span class="">【案例】</span>
			    		<c:choose>
			      	
			           		<c:when test="${fn:length(cases.caseTitle)>4 }">
			    		
			    				【${fn:substring(cases.caseTitle,0,4) }】
			    			</c:when>
			    			<c:otherwise>【${cases.caseTitle }】</c:otherwise>
			    	    </c:choose>	    
			            ${cases.caseStyle } ${cases.caseHouseType } ${cases.caseAcreage } ㎡</p>
			             <p class="detail">
			               <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}">
			              	 	<img class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/>
			               		<span class="m50">${cases.designerName }</span>
		                   </a>
			               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
			               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
			                 <font><button class="md-trigger" data-modal="modal-1"> 这样装修得花多少钱？</button></font>
			             </p>
			      </dd>			      
			    </dl>	
			    <div class="md-modal md-effect-1" id="modal-1" >
					<div>
					<div class="md-content">
						<h3>立即预约设计师</h3>
						<div>
							<p>您的姓名：<input type="text" name="order_clientName"/></p>
							<p>您的手机：<input type="text" name="order_phone"/></p>
							<p>楼盘信息：<input type="text" name="order_address"/></p>							
							<p>房屋面积：<input type="text" name="order_acreage"/></p>
							<p>设&nbsp;计&nbsp;师&nbsp;：
							<select name="designerName" id="designerName" style="width:200px;font-size:12px">
								<c:forEach items="${designerList }" var="designer">
									<option value="${designer.designerName }">${designer.designerName } </option>
								</c:forEach>
							</select>
							</p>
							<div class="submit_btn" id="but_order">立即预约</div>
							<button class="md-close"></button>	
						</div>
					</div>
					</div>
				</div>	  	  		
	  		</c:if>
	  </c:forEach>
	   
	   
	   
	  </div>
	</div>

<!--底部流程 start-->
  
  <div class="point">
        <div class="wrap">
            <p class="l"><span class="i1"><b>免费</b><br>上门量房</span></p>
            <p><span class="i2"><b>免费</b><br>全屋家居定制</span></p>
            <p><span class="i3"><b>免费</b><br>3D效果预想</span></p>
            <p><span class="i4"><b>免费</b><br>产品上门安装</span></p>
            <p class="r"><span class="i5"><b>免费</b><br>保修，终身维护</span></p>
        </div>
    </div>

  <!--底部流程 end-->


	<div class="clear"></div>
	
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	 <!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
    
    <script src="${ctx }/www/js/classie.js"></script>
	<script src="${ctx }/www/js/modalEffects.js"></script>

	<script>
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="${ctx }/www/js/cssParser.js"></script>
	<script src="${ctx }/www/js/css-filters-polyfill.js"></script>
	<script type="text/javascript">
	
	
	$(".submit_btn").click(function(){
		
		var orderId =  getOrderId();
		var order_clientName = $("input[name='order_clientName']").val();
		var order_phone = $("input[name='order_phone']").val();
		var order_acreage = $("input[name='order_acreage']").val();
		var branchCompany= $("#branchCompany").val();
		var order_address = $("input[name='order_address']").val();
		var designerName = $("#designerName").val();
		console.info("designerName"+designerName,"order_clientName:"+order_clientName+"order_phone:"+order_phone+"order_address"+order_address);
		if(order_clientName.match(/^\s*$/)){
			
			alert("对不起，请填写您的名字！");
			return false;
		}
		if(!order_phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
			
			alert("对不起，请填写您的手机号！");
			return false;
		}
		if(order_address.match(/^\s*$/)){
			
			alert("对不起，请填写您的地址！");	
			return false;
		}
	    $.ajax({
	    	
	    	type : "POST",
			dataType : "json",
			url : "${ctx}/saveOrder",
			data : {'designer':designerName,'acreage':order_acreage,'branchCompany':branchCompany,'orderId':orderId,'clientName':order_clientName,'phone':order_phone,'address':order_address,'sourceType':'立即预约'},
			success : function(data) {
				
				if (data.data == "ok") {
					alert("请您稍等，稍后会有客服人员为您服务!");
				}else{
					alert("保存失败");
				}
			}
	    });
		$(".md-close").click();
	});
	</script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }	
	${sessionScope.cnzzSession }
</body>
</html>
