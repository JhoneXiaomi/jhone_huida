<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${statScinterHomeSeoTitle.value }</title>
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css">
<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
</head>
<body>

	<!--header start-->
	<div class="header">
	 <jsp:include page="../public/head.jsp"/>
	   <!--nav start-->
       <jsp:include page="../public/nav.jsp"/>
 	   <!-- nav end -->
	</div>
	<!--header end-->
	<div class="list_loupan_main w1180">
	   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/">${cityCompany}装修</a><a href=""> 案例展示</a></div>
	   <div class="list_loupan_title"> <div class="cont_anli_title"><h3 class="">【楼盘信息】</h3></div></div>
	
	   <div class="content_loupan_main clearfix">
	     <div class="content_loupan_left fl"><img src="${currentHouse.bulidingThumbImg }" width="395" height="300"></div>
	     <div class="content_loupan_right fl">
	       <h2>${currentHouse.bulidingName }</h2>
	       <p><b>行政区域：</b>${currentHouse.bulidingArea}</p>
	       <p><b>隶属公司：</b><span id="req_branchCompany"></span></p>
	       <p><b>开始时间：</b><fmt:formatDate value="${currentHouse.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	       <div class="content_loupan_cont clearfix">
	          <div class="content_loupan_tel fl">装修热线：<span>${sessionScope.homeTp.value }</span> </div>
	       </div>
	     </div>
	      
	   </div>
	  
	  
	  <div class="content_loupan_baoming">
	    <div class="zhitongche" id="zhitongche">
			<form>
			    <input type="hidden" id="orderId" name="orderId"> 
				<input type="hidden" id="sourceType" name="sourceType" value="免费申请">
				<ul class="zhitong1">
					<li> 姓名：<span>*</span>
						<input name="clientName" class="mfsj-name" id="clientName" type="text">
					</li>
					<li>电话：<span>*</span>
						<input name="phone" class="mfsj-tel" id="phone" type="text">
					</li>
					<li>楼盘 : <span>&nbsp;</span>
						<div class="loupan">
							<input name="address" class="mfsj-name" id="address" type="text">
						</div>
					</li>
				</ul>
				<ul class="zhitong2">		
					<li>
					  
						 <input onclick="bjbaoming();" type="button" class="baoming" id="_phpok_submit" value="免费申请"/>
						
					</li>
				</ul>
			</form>
		</div>
	  </div>
	  
	  
	  <div class="clear"></div>
	  <div class="content_loupan_tj">
	    
	    <div class="list_title">
	        <h3>您可能还关注以下楼盘</h3>
	        <span><a href="">查看更多&gt;&gt;</a></span>
	      </div>
	    
	    <ul>
	     <c:forEach items="${hotBuildingList }" var="house" varStatus="status" begin="0" end="7">
	      <c:if test="${(status.index+1) % 4 != 0}" >
	      	<li>
	         <div class="list_loupan_imginfo">
	            <div class="loupan_img">
	            <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">
	            
	              <img src="${house.bulidingThumbImg }" width="280" height="213" alt="${house.bulidingName }"></a>
	            </div>
	            <div class="loupan_info clear">
	              <div class="loupan_fl fl"><p class="info01">
	               <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">【${house.bulidingName }】</a></p>
	              <p class="info02">在施：10户&nbsp;&nbsp;|&nbsp;&nbsp;报名：12户</p></div>
	              
	            </div>
	         </div>
	       </li>
	      </c:if>
	      <c:if test="${(status.index+1) % 4 == 0}" >
	      <li class="no_mar">
	         <div class="list_loupan_imginfo">
	            <div class="loupan_img">
	            <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">
	            
	              <img src="${house.bulidingThumbImg }" width="280" height="213" alt="${house.bulidingName }"></a>
	            </div>
	            <div class="loupan_info clear">
	              <div class="loupan_fl fl"><p class="info01">
	               <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">
	                            【${house.bulidingName }】
	                </a>
	                </p>
	              <p class="info02">在施：10户&nbsp;&nbsp;|&nbsp;&nbsp;报名：12户</p></div>
	              <<%-- p class="info03 fr"><a href="javascript:void(0)" class="info03">${house.bulidingArea }</a></p> --%>
	              
	            </div>
	         </div>
	       </li>
	      </c:if>
	      </c:forEach>
	     </ul>
	  </div>
	</div>


	
	<div class="clearfix"></div>
	<!--footer start-->
	<div class="footer">
	  <div class="footer01_bg">
	    <div class="footer01 w1180">
	      <div class="link">${sessionScope.homeLk.value }</div>
	      <div class="footer_nav fl">
	        <h3>快速导航</h3>
	        <ul>
	         
	             <li><a href="${pageContext.request.contextPath }/Integrated_package.jsp">整装套餐</a></li>
	          <li><a href="${pageContext.request.contextPath }/cases/p1" >设计案例</a></li>
	          <li><a href="${pageContext.request.contextPath}/spec/p1?type=热门活动" id="s3" class="subNavBtn">热门活动</a></li>
	          <li><a href="${pageContext.request.contextPath}/designer/p1">设计团队</a></li>
	          <li><a href="${pageContext.request.contextPath}/specase/p1?type=说装修">说装修</a></li>
	          <li><a href="${pageContext.request.contextPath}/blue_diamond_process.jsp">蓝钻工艺</a></li>
	          <li><a href="javascript:void(0)">三创服务</a></li>
	          <li><a href="${pageContext.request.contextPath}/about.jsp">关于三创</a></li>
	        </ul>
	      </div>
	      
	       <div class="footer_cont fl">
	        <h3>联系我们</h3>
	        <ul class="clear">
	          <li><img src="${pageContext.request.contextPath}/www/images/footer_tel.png"><span>联系电话：${homeTp.value }</span></li>
	          <li>
	            <div class="addw clearfix">
	               <div class="fl"><img src="${pageContext.request.contextPath}/www/images/footer_des.png">地址：</div>
	               <div class="f_address fl"><!-- <span class="foot_address"> -->${homeAdress.value }<!-- </span> --></div>
	            </div>
	         </li>
	         
	        </ul>
	      </div>
	      
	      <div class="footer_ewm">
	      <h3>扫描二维码</h3>
	        <ul>
	          <li><img src="${homeTc.value }"></li>
	          <li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/www/images/tianmao.png"></a></li>
	          <li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/www/images/jingdong.jpg"></a></li>
	        </ul>
	      </div>
	    </div>
	  </div>
	   <div class="clear"></div>
	  <div class="footer02_bg"><div class="w1180">Copyright 2013-2016 三创国际装饰有限公司</div></div>
	</div>
	<!--footer end-->
	<!--右侧悬浮 开始-->
	<jsp:include page="../public/fastToTop.jsp"/>
	<!--右侧悬浮 结束-->
	<script type="text/javascript">
		
		var now = new Date();
		var year = now.getFullYear();
		var month =(now.getMonth() + 1).toString();
		var day = (now.getDate()).toString();
		var hour = (now.getHours()).toString();
		var minute = (now.getMinutes()).toString();
		var second = (now.getSeconds()).toString();
		var ms = (now.getMilliseconds()).toString();
		if (month.length == 1) {
		    month = "0" + month;
		}
		if (day.length == 1) {
		    day = "0" + day;
		}
		if (hour.length == 1) {
		    hour = "0" + hour;
		}
		if (minute.length == 1) {
		    minute = "0" + minute;
		}
		  if (second.length == 1) {
		    second = "0" + second;
		} 
		var dateTime = year + month +  day + hour + minute + second + ms;
		$("#orderId").val(dateTime);
		
		  function bjbaoming(){
			 var orderId = $("#orderId").val(); 
			 var clientName= $("#clientName").val();
			 var phone= $("#phone").val();
			 var address= $("#address").val();
			 var sourceType= $("#sourceType").val();
			 var branchCompany = '${sessionScope.branchCompany}';
			 if(clientName.match(/^\d*$/)){
		         alert('请填写正确的姓名');
		         return false;
		     }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		         alert('请填写11位号码');
		         return false;
		     }
			 $.ajax({
					type : "POST",
					dataType : "json",
					async: false,
					url : "${pageContext.request.contextPath}/saveOrder",
					data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'sourceType':sourceType},
					success : function(data) {
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
				});  
		}
	</script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>
