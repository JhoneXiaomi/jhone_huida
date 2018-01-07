<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<%@ include file="public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${currentCase.seoTitle }</title>
	<meta name="keywords" content="${currentCase.seoKeyword }"/>
    <meta name="description" content="${currentCase.seoDesc }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
	
    <script type="text/javascript" src="${ctx }/www/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${ctx }/www/js/jquery.galleryview-1.1.js"></script>
    <script type="text/javascript" src="${ctx }/www/js/jquery.timers-1.1.2.js"></script>
    <script type="text/javascript">
    
		$(document).ready(function(){
			$('#photos').galleryView({
				panel_width: 930,
				panel_height: 550,
				frame_width: 100,
				frame_height: 100
			});
		});
    </script>
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
	 
	<div class="clear"></div>
	
	<div class="ej_main w1200">
	  <div class="ej_main_local sjs_local">您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a href="${ctx }/cases/p1">装修案例</a>
	  
	 	<!-- JiaThis Button BEGIN -->
			<div class="jiathis_style clearfix">
				<a class="jiathis_button_qzone">QQ空间</a>
				<a class="jiathis_button_tsina">新浪微博</a>
				<a class="jiathis_button_tqq">腾讯微博</a>
				<a class="jiathis_button_weixin">微信</a>
				<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
				<a class="jiathis_counter_style"></a>
			</div>
			<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
		<!-- JiaThis Button END -->
	  </div>
	  <!--左侧 案例详情轮播-->
	  <div class="anli_cont_left fl">
	   
	<div class="ej_con_anli ej_news_right fl">
	   
				<div id="photos" class="galleryview">
					<c:forEach items="${caseList }" var="cases">
		
					 <div class="panel"> 
					  <img src="${cases.imageUrl }" alt="${cases.alt }" />
					    <div class="panel-overlay">
					      <h2>${cases.title }</h2>
					    </div>
					  </div>				
					</c:forEach>
				  <ul class="filmstrip">
				  <c:forEach items="${caseList }" var="cases">
				    <li><img src="${cases.imageUrl }" alt="${cases.title }" title="${cases.title }" /></li>
				  </c:forEach>  
				  </ul>
				</div>
    
  </div>
	
	
	
<div class="clear"></div>
	
	
	
	<div class="anli_shuoming">
	  <div class="title_shuoming">案例说明</div>
	  <div class="anli_sm_left fl">
	    <p>案例名称：
	    
		    <c:choose>
		    		<c:when test="${fn:length(currentCase.caseTitle)>20 }">${fn:substring(currentCase.caseTitle,0,20) }</c:when>
		    		<c:otherwise>${currentCase.caseTitle }</c:otherwise>
		    </c:choose>
	    </p>
	    <p>装修风格：${currentCase.caseStyle }</p>
	    <p>户型：${currentCase.caseHouseType }</p>
	    <p>面积：${currentCase.caseAcreage }平</p>
	    <p>设计师：${currentCase.caseDesigner }</p>
	    <p></p>
	  </div>
	  <div class="anli_sm_right fr">
	    <p>案例简介:&nbsp;${currentCase.caseDesc}</p>
	  </div>
	</div>
	    
	  </div> 
	  <!--左侧 案例详情轮播-->
	  
	  
	  <div class="main_anli_right ej_bj fr">
		  
		  <div class="ej_main_right_sjs clearfix">
	      <div class="anli_sjs_img"><img src="${designer.designerPhotoImg }" width="190" height="228"/>
	      
	      </div>
	      <div class="anli_sjs_info">
	       <h4>${designer.designerName }</h4>
	       <p>${designer.designerTitle }</p>
	       <span><a href="">TA的主页</a></span>
	      </div>
	    </div>
		  
		  
		  
		  
		  <h4>共有<b>130</b>&nbsp;&nbsp;位资深设计师 <br/> 为您提供<b>2890</b>&nbsp;&nbsp;套精品案例<br/>
		   共计&nbsp;<b>36985</b>&nbsp;&nbsp;位客户选择新洲装饰</h4>
         <h4></h4>
         <h4><b></b></h4>
         <h2>优秀的设计团队 丰富的设计经验</h2>
         <p>获得最靠谱的装修预算</p>	     
	    <div class="main_anli_right_input">
	      <input type="hidden" id="branchCompany" value="${branchCompany }"/>
	      <input type="hidden" name="orderId" id="orderId"/>
	      <input type="text" name="clientName" placeholder="请输入您的称呼"/>
	      <input type="text" name="phone" placeholder="请输入您的电话"/>
	      <input type="text" name="address" placeholder="请输入小区名称"/>
	      <input type="text" name="acreage" placeholder="请输入楼盘面积"/>
	      <a href="javascript:void(0)" id="_submit">立即申请</a>
	    </div>
	    <p>已有（<%-- <font color="red">${orderNumber }</font> --%>786）业主申请了此服务</p>
	    <p>免费电话申请${homeTp.value }</p>		
	   
	    
	  </div>
	  
	  <div class="clear"></div>
	  
	  <div class="anli_cont_bottom">
	     <h3>${currentCase.caseStyle }的其他案例</h3>
	     
	      <div class="anli_list w1200 clearfix">
	      
	      <c:forEach items="${casesAll }" var="cases" begin="0" end="5" varStatus="status">
	      	
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
			               <span class="m8"><i>3</i>张</span>
			               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
			               
			             </p>
			      </dd>			      
			    </dl>  
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
			               <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}" target="_blank">
			              	 	<img class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/>
			               		<span class="m50">${cases.designerName }</span>
		                   </a>
			               <span class="m8"><i>3</i>张</span>
			               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
			           
			             </p>
			      </dd>			      
			    </dl> 
	      	 </c:if>
	      </c:forEach>
	  </div>
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
	
	<script type="text/javascript">
		
	   $("#_submit").click(function(){
		   
		  	 var orderId =  getOrderId();
			 var clientName= $("input[name='clientName']").val();
			 var phone= $("input[name='phone']").val();
			 var acreage= $("input[name='acreage']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			 alert(clientName);
			 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						async: false,
						url : "${ctx}/saveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
						success : function(data) {
							if (data.data == "ok") {
								alert("请您稍等，稍后会有客服人员为您服务!");
							}else{
								alert("保存失败");
							}
						}
					});  
			 }else if(clientName.match(/^\s*$/)){
				 alert("对不起,请正确填写姓名!");
			 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 alert("对不起，请正确填写电话格式!");
			 }else if(acreage.match(/^\s*$/)){
				 alert("对不起,请填请正确天填写房屋面积!");
			 }
	   });
	</script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
</body>
</html>