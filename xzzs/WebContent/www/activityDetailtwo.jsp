<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>   
<%@ include file="public/shangqiao.jsp" %>     
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${news.seoTitle }</title>
	<meta name="keywords" content="${news.seoKeyword }"/>
	<meta name="description" content="${news.seoDesc }"/>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
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
	<!--banner end-->
	<div class="clear"></div>
	
	<script type="text/javascript" src="${ctx }/www/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/scroll.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.list_lh li:even').addClass('lieven');
	});
	$(function(){
		$("div.list_lh").myScroll({
			speed:40, //数值越大，速度越慢
			rowHeight:68 //li的高度
		});
	});
	</script>
	
	<div class="ej_main w1200">
	  <div class="ej_main_local">您的当前位置：<a href="${ctx }/">首页</a>><a href="${ctx }/news/p1">热点新闻</a></div>
	  <div class="lc"><img src="${ctx }/www/images/lcimg.jpg"/></div>
	  
	  <div class="clearfix">
	    
	    <div class="ej_news_left fl">
	      
	      <div class="news_cont_title">【${news.title }】</div>
	      <div class="news_cont_titme">发布时间：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>   发布人：小王  阅读（${news.readNum }）</div>
	       
	      <div class="news_cont_zy">${news.contents }</div>
	      
	    <!--   
	      <div class="news_page">
	        <div class="page_prev">上一篇：<a href="">家装设计有诀窍，完美装修“八不”原则</a></div>
	        <div class="page_next">下一篇：<a href="">装修一套房子到底需要多少装修材料</a></div>
	      </div> -->
	      
	    </div>
	    
	   <div class="main_anli_right ej_bj fr" >
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
	    <p>已有（<font color="red">${orderNumber }</font>）业主申请了此服务</p>
	    <p>免费电话申请${homeTp.value }</p>
	   
	    
	        
	          <div class="yuyue_info">
	            <div class="box">
	             <div class="bcon">
					<!-- 代码开始 -->
					<div class="list_lh">
						<ul>
							<c:forEach items="${orders }" var="order">
								<li>
								 <p>
								 <a href="javascript:void(0)" target="_blank">
								 <span style="float:left;width:90px"> 
									 <c:if test="${fn:length(order.clientName)==1 }">
									  ${order.clientName }××
									 </c:if>
									  <c:if test="${fn:length(order.clientName)==2 }">
									  ${order.clientName }
									 </c:if>
									  <c:if test="${fn:length(order.clientName)==3 }">
									  ${order.clientName }
									 </c:if>
								 </span>
								 <c:if test="${fn:length(order.phone) >0 }">
							     ${fn:substring(order.phone,0,3) }****${fn:substring(order.phone,7,11) }
							     </c:if>
								 <!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计 -->
								  </a>
								  </p>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 代码结束 -->
				</div>
			</div>
	      </div>
	  </div>
	 </div>
	</div>
		
	<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	 <!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
	<script type="text/javascript">
		
	   $("#_submit").click(function(){
		   
		  	 var orderId =  getOrderId();
			 var clientName= $("input[name='clientName']").val();
			 var phone= $("input[name='phone']").val();
			 var acreage= $("input[name='acreage']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
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
	${sessionScope.cnzzSession }
</body>
</html>
