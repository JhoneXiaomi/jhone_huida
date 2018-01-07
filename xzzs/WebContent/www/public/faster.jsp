<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>    
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
							<c:if test="${branchCompany == 'bjxz'}">
							  <a href="http://p.qiao.baidu.com/cps/chatIndex?reqParam=%7B%22from%22%3A1%2C%22sessionid%22%3A%22-100%22%2C%22siteId%22%3A%2210030480%22%2C%22tid%22%3A%22-1%22%2C%22userId%22%3A%225512100%22%2C%22ttype%22%3A1%7D">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'sjzxz'}">
							 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'zzxz'}">
							 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'tyxz'}">
								<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'bdxz'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							<c:if test="${branchCompany == 'tjxz'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if>
							<c:if test="${branchCompany == 'lfxz'}">
							<a href="javascript:void(0)">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if>  
							</div>
							<c:if test="${branchCompany == 'hfxz'}">
							 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">
							  	<img src="${ctx}/www/images/kefu01.png"/>
							  </a>
							</c:if> 
							
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
					 var branchCompany= $('#branchCompany').val();
					 console.info("address"+address,"orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
					 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
						 
						 $("#_sumbit").attr("disabled",true);
					     $("#_sumbit").css("background","#524c4a");
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
</body>
</html>