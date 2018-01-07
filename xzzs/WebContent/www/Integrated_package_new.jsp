<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<%@ include file="public/shangqiao.jsp" %>
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<c:if test="${branchCompany =='bjxz'}">
		<title>北京十大装饰公司之一|新房装修|北京新洲装饰|新洲装饰怎么样|全包装修|老房装修|整装套餐</title>
	</c:if>
	<c:if test="${branchCompany =='hfxz'}">
		<title>新房装修|合肥新洲装饰|新洲装饰怎么样|全包装修|老房装修|整装套餐</title>
	</c:if>
	<meta name="keywords" content="新洲装饰、北京新洲装饰、北京十大装饰公司之一、老房装修专家、家装套餐公司、整装装饰公司、全包装修、半包装修、整装套餐、新洲装饰怎么样"/>
	<meta name="description" content="北京新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	
	<!--底部报价 js-->
	<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script>
	   var jq = jQuery.noConflict();
	</script>
	<%-- <script type="text/javascript" src="${ctx }/www/js/db_01.js"></script> --%>
	<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
	<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
	<!--底部报价 js-->
	
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
	
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.0.min.js"></script>
	
	
	<div class="xf_taocan" style="font-size:0">
	 
	 <img src="${ctx }/www/images/bj/taocan_bj_01.jpg"/>
	 <img src="${ctx }/www/images/bj/taocan_bj_02.jpg"/>
	 <img src="${ctx }/www/images/bj/taocan_bj_03.jpg"/>
	</div>


	<div class="clear"></div>
	<!--footer start-->
	<%-- <jsp:include page="public/fotter.jsp"/> --%>
	<!--footer end-->
	
 	<!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
    
    <!-- servise start -->
    <jsp:include page="public/faster.jsp"/>
    <!-- servise end -->
 
	<script type="text/javascript">
	
			
		   var orderId = getOrderId();
		   $("#_sumbit").click(function(){
			  	 
				 var clientName= $("input[name='fotterName']").val();
				 var phone= $("input[name='fotterPhone']").val();
				 var acreage= $("input[name='fotterAcreage']").val();
				 var address = $("input[name='fotterAddress']").val();
				 var branchCompany= $('#branchCompany').val();
				 console.info("address"+address,"orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
				 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
					 
					 $.ajax({
							type : "POST",
							dataType : "json",
							url : "${ctx}/saveOrder",
							data : {'address':address,'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
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
