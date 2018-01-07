<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>     
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>装修报价-${companyCity}新洲装饰公司</title>
	<meta name="keywords" content="新洲装饰、全国十大装饰公司之一、老房装修专家、家装套餐公司、整装装饰公司、全包装修、半包装修、整装套餐、新洲装饰怎么样"/>
	<meta name="description" content="北京新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
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
	
	
	
	<div class="bmym w1200">
	  
	<div class="ej_main_local">您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a href="${ctx }/orderLine">装修报价</a></div>
	
	  <div class="bm_con">
	    <img src="${ctx }/www/images/bj_01.jpg" width="100%"/>
	    <div class="bm_inp">
	      <ul class="clearfix">
	        <li>装修风格：
	            <select id="style">
	                <option value="无">===请选择===</option>
		        	<option value="现代简约" >现代简约</option>
		        	<option value="经典欧式" >经典欧式</option>
		        	<option value="中式风格" >中式风格</option>
		        	<option value="乡村田园" >乡村田园</option>
		        	<option value="地中海" >地中海</option>
		        	<option value="淡雅时光" >淡雅时光</option>
		        	<option value="美式乡村" >美式乡村</option>
		        	<option value="其他" >其他</option>
	        	</select>
	        </li> 
	        
	        <li>所在小区：<input type="text" name="address" placeholder="请输入小区名" value="${address}"/></li> 
	        
	        <li>建筑面积：<input type="text" name="acreage" placeholder="请输入建筑面积"/></li> 
	        
	        <li>约设计师：
	        
	            <select id="designer">
	                <option value="无">===请选择===</option>
	                <c:forEach items="${designerList }" var="designer">
	                	<option value="${designer.designerName }">${designer.designerName }</option>
	                </c:forEach>
	           </select>
	           <input type="hidden" id="orderId" name="orderId">
	        </li>
	        
	        <li>您的称呼：<input type="text" name="clienName"  placeholder="先生/女土"/></li> 
	        <li>联系电话：<input type="text" name="phone" placeholder="请输入您的电话"/></li>
	        
	      </ul>
	    </div>
	    
	    <div class="ljsq"><a href="javascript:void(0)" id="_submit">立即申请</a></div>
	    
	    
	    <img class="imgl" src="${ctx }/www/images/bj_02.jpg" width="100%"/>
	  </div>
	</div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	
	<!-- 服务 开始 -->
	<jsp:include page="public/service.jsp"/>
	<!-- 服务结束 -->
	
	<script type="text/javascript">
	   
	  var designer = "${designerName}";
	  if(designer!= null)
	  		$("#designer").val(designer);
	   var orderId = getOrderId();
	   var i = 0;
	   $("#_submit").click(function(){
		  	 i++;
		     var orderId = getOrderId();
		     var designer = $("#designer").val();
		     var style = $("#style").val();
		     var address = $("input[name='address']").val(); 
			 var clientName= $("input[name='clienName']").val();
			 var phone= $("input[name='phone']").val();
			 var acreage= $("input[name='acreage']").val();
			 var branchCompany= '${sessionScope.branchCompany}';
			 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){

				 if (i<=1) {
					 
					 $("#_submit").attr("disabled",true);
				     $("#_submit").css("background","#524c4a");
					 $.ajax({
							type : "POST",
							dataType : "json",
							url : "${ctx}/saveOrder",
							data : {'orderId':orderId,'style':style,'designer':designer,'address':address,'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
							success : function(data) {
								if (data.data == "ok") {
									alert("请您稍等，稍后会有客服人员为您服务!");
								}else{
									alert("保存失败");
								}
							}
					 });  
				 } else {
					alert("对不起请勿重复提交"); 
				 }
				 
					
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
