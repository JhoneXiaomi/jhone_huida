<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %> 
<%@ include file="public/shangqiao.jsp" %>   
<!doctype html>
<html lang="en" class="no-js">
<head>

	<meta charset="utf-8">
	<c:if test="${sessionScope.casesType=='全部' && sessionScope.caseAcreage=='全部' && sessionScope.caseStyle=='全部'}">
		<title>装修风格_装修效果图-${companyCity}新洲装饰公司</title>
	</c:if>
	<c:if test="${sessionScope.caseStyle!='全部'}">
		<title>${sessionScope.caseStyle}_${companyCity}装修多少钱-${companyCity}新洲装饰公司</title>
	</c:if>
	<title>${casesSeoTitleStr.value }</title>
	<meta name="keywords" content="${casesSeoKeywordStr.value }"/>
	<meta name="description" content="${casesSeoDescStr.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/component.css" />
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
	<style>
		.all{
			color: #008cd6 !important;
		}
	</style>
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
	
	<div class="ej_main w1200">
	  <div class="ej_main_local sjs_local">您的当前位置：<a href="${ctx}/">${companyCity}装修</a>><a href="${ctx }/cases/p1">装修案例</a></div>
	  
	  
	  <div class="ej_anli_xz">
	       <div class="ej_anli_xuanze01"  id="caseStyle">
	           风格：
              <a id="caseStyleFirst">全部</a>
	          <a >现代简约</a>
	          <a >混搭风格</a>
	          <a >中式风格</a>
	          <a >地中海</a>
	          <a >美式乡村 </a>
	          <a >北欧风格 </a>
	       </div>
	   <!--     <div class="ej_anli_xuanze04" id="caseHouseType">
	         户型： 
	          <a id="caseHouseTypeFirst">全部</a>
	          <a>一居</a>
	          <a >两居</a>
	          <a >三居</a>
	          <a >多居</a>
	          <a >复式</a>
	          <a >别墅</a>
	          <a >洋房</a>
	          <a >会所</a>
	          <a >其他</a>
	         
	       </div>
	       
	       
	       <div class="ej_anli_xuanze02" id="caseAcreage">
	         面积：
	          <a id="caseAcreageFirst">全部</a>
	          <a >40㎡以内</a>
              <a >40-60㎡</a>
              <a >60-70㎡</a>
              <a >70-100㎡</a>
              <a >100㎡以外</a>
	         
	       </div> -->
	       
	  </div>
	  
	  
	  <div class="anli_list w1200 clearfix">
	  
	  <c:forEach items="${listCases }" var="cases" varStatus="status">
	  	    
	  	       <c:if test="${(status.index+1)%3 != 0 }">
	  	    
		 		<dl>
			      <dt>
				      <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
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
			               <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}" target="_blank">
			              	 	<img class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/>
			               		<span class="m50">${cases.designerName }</span>
		                   </a>
			               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
			               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
			               <font><button class="md-trigger" data-modal="modal-1" style="backgroud-color:transparent;color:#fff;border:0;"> 这样装修得花多少钱？</button></font>
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
			   <c:if test="${(status.index+1)%3 == 0 }">
			    <dl class="no_mar">
			       <dt>
				      <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
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
			               <font><button class="md-trigger" data-modal="modal-1" style="backgroud-color:transparent;color:#fff;border:0;"> 这样装修得花多少钱？</button></font>
			             </p>
			      </dd> 
			      </dl> 
			      <div class="md-modal md-effect-1" id="modal-1">
					<div class="md-content">
						<h3>装修预算</h3>
						<div>
							<p class="zxys">您的装修预算为:23</p>
							<button class="md-close"></button>	
						</div>
					</div>
				</div>		  	
	  	   	   </c:if>
	    </c:forEach>
	    
	    <!-- page begin -->
	    
	    <div class="Page clearfix">
		     <span>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>  
		      <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo-1 }">上一页</a>  
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>
	         </c:if>   
		     <c:forEach var="i" begin="1" end="${page.pageCount}">
			     <a <c:if test='${page.pageNo == i }'>style="width: 36;height: 32;background-color:#008cd6;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/cases/p${i }">&nbsp;${i}&nbsp;</a>
		      </c:forEach>	
			  <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo+1 }">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>   
	         </c:if> 
	    </div>
	    <!-- page end -->
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
	  
	  
	</div>
	
	
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

	     /* 实现案例的交叉查询 */
		 var caseStyleP = '${sessionScope.caseStyle}';
		 var caseAcreageP = '${sessionScope.caseAcreage}';
		 var caseHouseTypeP = '${sessionScope.casesType}';
		 if(caseStyleP == "" || caseStyleP == "全部" ){
			 $("#caseStyleFirst").attr("class","all");
		 }else{
			 $("#caseStyle a:contains("+caseStyleP+")").attr("class","all");
		 }
		 if(caseAcreageP == "" || caseAcreageP == "全部"){
			 $("#caseAcreageFirst").attr("class","all");
		 }else{
			 $("#caseAcreage a:contains("+caseAcreageP+")").attr("class","all");
		 }
		 if(caseHouseTypeP == "" || caseHouseTypeP == "全部"){
			 $("#caseHouseTypeFirst").attr("class","all");
		 }else{
			 $("#caseHouseType a:contains("+caseHouseTypeP+")").attr("class","all");
		 }
		 
		 $("#caseStyle a").bind("click",function(){
			 
			 var casesType1 = '${sessionScope.casesType}';
			 var caseAcreage1 =  '${sessionScope.caseAcreage}';
			 var caseStyle1 = $(this).text();
			 window.location.href = "${ctx}/cases/p1?casesType="+casesType1+"&caseAcreage="+caseAcreage1+"&caseStyle="+caseStyle1;
			
		 });
		 $("#caseAcreage a").bind("click",function(){
			 
			 var casesType2 =  '${sessionScope.casesType}';
			 var caseAcreage2 = $(this).text();
			 var caseStyle2 =  '${sessionScope.caseStyle}';
			 window.location.href = "${ctx}/cases/p1?casesType="+casesType2+"&caseAcreage="+caseAcreage2+"&caseStyle="+caseStyle2;
			
		 });
		 $("#caseHouseType a").bind("click",function(){
			
			 var casesType3 = $(this).text();
			 var caseAcreage3 = '${sessionScope.caseAcreage}';
			 var caseStyle3 =  '${sessionScope.caseStyle}';
			 window.location.href = "${ctx}/cases/p1?casesType="+casesType3+"&caseAcreage="+caseAcreage3+"&caseStyle="+caseStyle3;
			
		 });
		 
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


