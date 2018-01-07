<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>     
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>
	
	
	<div class="demo">
		<div class="dome_main">
			<div class="bottom_fiexd_box zxbj-apply-bottom-bar">
				<div class="bottom_sjybj_bg"></div>
				<div class=" bottom_fiexd_sjybj ">
					<div class="container">
						<div class="bottom_sjybj_center clear">
		
							<form>
								<div class="bottom_sjybj_content step1" style="">
								<div class="elment mt20b5">
								  <div class="inp01">
								    <input type="text" name="fotterName" style="float:left" placeholder="您的姓名" class="inp1"/>
								    <input type="text" name="fotterPhone" style="float:left" placeholder="您的手机" class="inp1"/>
								  </div>
								</div>
								<div class="elment mb7 clear">
								<input type="text" id="fotterAddress" placeholder="您的楼盘" name="fotterAddress" class="inp1"/>
								<input type="text" id="fotterAcreage" placeholder="楼盘面积" name="fotterAcreage" class="inp1"/>
								</div>
								</div>
								<input id="_sumbit" type="button" style="border:none;" class="btn_ffa00b" value="免费量房"/>
							</form>	
	
							<div class="bottom_sjybj_right">
								<em class="icn_tip_close">×</em>
							</div>
							<div class="index_bj_kefuimg">
							<c:if test="${branchCompany == 'bjsc'}">
							  <a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'tssc'}">
							 <a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'tjsc'}">
								<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'lfsc'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'sjzsc'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if>
							<c:if test="${branchCompany == 'bdsc'}">
							<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'hssc'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'tysc'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if>  
							</div>
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<a class="bottom_show_left zxbj-apply-bottom-bar-link" href="javascript:void(0)" style="left: 0%;"></a>
	</div>

	<script type="text/javascript">
	
			
			   var orderId = getOrderId();
			   $("#_sumbit").click(function(){
				  	 
					 var clientName= $("input[name='fotterName']").val();
					 var phone= $("input[name='fotterPhone']").val();
					 var acreage= $("input[name='fotterAcreage']").val();
					 var address = $("input[name='fotterAddress']").val();
				     var branchCompany = '${sessionScope.branchCompany}';
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
			

			   /* 为分站添加点击事件 */
			   var currentBCompany = '${sessionScope.branchCompany}';
			   $('#BCompany').val(currentBCompany);
			   $("#logoImg").attr("alt",'${sessionScope.cityCompany}三创装饰公司');
			   if(currentBCompany=='bjsc'){
			   	$("#req_branchCompany").text("北京分公司");
			   	$("#CurrCompany").text('北京站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰北京站！');
			   }
			   if(currentBCompany=='tjsc'){
			   	$("#req_branchCompany").text("天津分公司");
			   	$("#CurrCompany").text('天津站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰天津站！');
			   }
			   if(currentBCompany=='lfsc'){
			   	$("#req_branchCompany").text("廊坊分公司");
			   	$("#CurrCompany").text('廊坊站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰廊坊站！');
			   }
			   if(currentBCompany=='sjzsc'){
			   	$("#req_branchCompany").text("石家庄分公司");
			   	$("#CurrCompany").text('石家庄站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰石家庄站！');
			   }
			   if(currentBCompany=='tssc'){
			   	$("#req_branchCompany").text("唐山分公司");
			   	$("#CurrCompany").text('唐山站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰唐山站！');
			   }
			   if(currentBCompany=='bdsc'){
			   	$("#req_branchCompany").text("保定分公司");
			   	$("#CurrCompany").text('保定站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰保定站！');
			   }
			   if(currentBCompany=='hssc'){
			   	$("#req_branchCompany").text("衡水分公司");
			   	$("#CurrCompany").text('衡水站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰衡水站！');
			   }
			   if(currentBCompany=='yjsc'){
			   	$("#req_branchCompany").text("燕郊分公司");
			   	$("#CurrCompany").text('燕郊站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰燕郊站！');
			   }
			   if(currentBCompany=='tysc'){
			   	$("#req_branchCompany").text("太原分公司");
			   	$("#CurrCompany").text('太原站');
			   	$("#div_CurrCompany").text('欢迎访问三创装饰太原站！');
			   }

			   function faseMoney(){
			   	
			   	window.location.href="${ctx }/orderLine";
			   }

	</script>
</body>
</html>