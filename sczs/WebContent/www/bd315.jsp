<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<%@ include file="/public/shangqiao.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>315装修特惠</title>
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css">
<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>

</head>
<body>
<!--nav start--> 
<jsp:include page="../public/nav.jsp"/>

<!--nav end--> 


<div class="bd315">
  <div class="bdhd">
    <img src="${ctx }/www/images/bd/bd_315banner.jpg"/>
    
    
    <div class="bd315_hd">
      <img src="${ctx }/www/images/bd/bd_315_02.png"/>
      
      <div class="bd_form">
        <p><span>您的姓名：</span><input type="text" class="bdhd_name" name="clientName" id="clientName" /></p>
        <p><span>小区名称：</span><input type="text" class="bdhd_xq_name" name="address"/></p>
        <p><span>房屋面积：</span><input type="text" class="bdhd_xq_name"  name="acreage"/></p>
        <p><span>联系电话：</span><input type="text" class="bdhd_xq_name" name="phone"/></p>
         
         <p><span>所在城市：</span>
           <select class="bd_city" id="branchCompany">
             <option value="0">请选择您所在的城市</option>
	         <option value="bjsc">北京</option>
	         <option value="tjsc">天津</option>
	         <option value="tssc">唐山</option>
	         <option value="bdsc">保定</option>
	         <option value="lfsc">廊坊</option>
	         <option value="sjzsc">石家庄</option>
	         <option value="czsc">沧州</option>
	         <option value="zzsc">郑洲</option>
	         <option value="tysc">太原</option>
	         <option value="jnsc">济南</option>
	         <option value="hfsc">合肥</option>
	         <option value="yjsc">燕郊</option>
	         <option value="dcsc">大厂</option>
	         <option value="hssc">衡水</option>
	         <option value="aysc">安阳</option>
	         <option value="cqsc">重庆</option>
           </select>
         </p>
         
        <div class="submit_bdbm"><input type="button" onclick="submitForm()" value="立即报名"/></div>
      </div>

      <div class="bdnametel">
         <h3>已有<font>268</font>人预约成功</h3>
 <!-- 代码开始 -->
		<div class="list_lh">
            <ul>
				<li><p><a href="" target="_blank">张先生 &nbsp;&nbsp;&nbsp;&nbsp;  1833369**** &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p></li>
                <li>
				  <p><a href="" target="_blank">刘先生&nbsp;&nbsp;&nbsp;&nbsp;  1513162**** &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
                <li>
				  <p><a href="" target="_blank">王女士&nbsp;&nbsp;&nbsp;&nbsp;  1583010**** &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
                <li>
				  <p><a href="" target="_blank">姚小姐&nbsp;&nbsp;&nbsp;&nbsp; 1520001**** &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
                <li>
				  <p><a href="" target="_blank">刘女士&nbsp;&nbsp;&nbsp;&nbsp;  1385425****  &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
                <li>
				  <p><a href="" target="_blank">江先生&nbsp;&nbsp;&nbsp;&nbsp;  1526896**** &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
                <li>
				  <p><a href="" target="_blank">闫先生&nbsp;&nbsp;&nbsp;&nbsp;  1339331****  &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
                <li>
				  <p><a href="" target="_blank">张女士 &nbsp;&nbsp;&nbsp;&nbsp; 1583218**** &nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计</a></p>
				</li>
      
				
			</ul>
		</div>
		<!-- 代码结束 -->
      </div>
    </div>
    
    
    
<script type="text/javascript" src="${ctx }/www/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/www/js/scroll.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.list_lh li:even').addClass('lieven');
})
$(function(){
	$("div.list_lh").myScroll({
		speed:40, //数值越大，速度越慢
		rowHeight:68 //li的高度
	});
});
</script>
  
    
    
    
    
    <a onclick="ziXun()"><img src="${ctx }/www/images/bd/bd_315_04.png"/></a>
    <a onclick="ziXun()"><img src="${ctx }/www/images/bd/bd_315_05.png"/></a>
    
      <div class="bd_po">
        <img src="${ctx }/www/images/bd/bd_315_06.jpg"/>
       <div class="bd_po_a"><input type="button" onclick="ziXun()" value="点击咨询"/></div>
      </div>
      
    <img src="${ctx }/www/images/bd/bd_315_07.png"/>
     
     <div class="bd_po">
      <img src="${ctx }/www/images/bd/bd_315_08.jpg"/>
      <div class="bd_po_a_a"><input type="button" onclick="ziXun()" value="点击咨询"/></div>
     </div>
      
    <img src="${ctx }/www/images/bd/bd_315_10.png"/>
    <img src="${ctx }/www/images/bd/bd_315_09.jpg"/>
    
    <div class="bd_po">
      <img src="${ctx }/www/images/bd/bd_315_11.jpg"/>
      <div class="bd_po_a_b">
        <input type="text" id="name" placeholder="请输入您的姓名"/>
        <input type="text" id="phone" placeholder="请输入您的电话"/>
        <input type="text" id="acreage" placeholder="请输入您的房屋面积"/>
        
         <span>所在城市：</span>
           <select class="bd_city" id="branchCompanys" name="branchCompany">
             <option value="0">请选择您所在的城市</option>
	         <option value="bjsc">北京</option>
	         <option value="tjsc">天津</option>
	         <option value="tssc">唐山</option>
	         <option value="bdsc">保定</option>
	         <option value="lfsc">廊坊</option>
	         <option value="sjzsc">石家庄</option>
	         <option value="czsc">沧州</option>
	         <option value="zzsc">郑洲</option>
	         <option value="tysc">太原</option>
	         <option value="jnsc">济南</option>
	         <option value="hfsc">合肥</option>
	         <option value="yjsc">燕郊</option>
	         <option value="dcsc">大厂</option>
	         <option value="hssc">衡水</option>
	         <option value="aysc">安阳</option>
	         <option value="cqsc">重庆</option>
           </select>

        
        <p><input type="button" onclick="subimtLiJi()" value="立即报名"/></p>
        <p><input type="button" onclick="breakIndex()" value="返回首页"/></p>
      </div>
    </div>
    <!--<img src="images/bd/bd_315_12.png"/>-->
    
  </div>
</div>




<div class="clearfix"></div>
<!--footer start-->
<%-- <jsp:include page="../public/fotter.jsp"/> --%>
<!--footer end-->
<script type="text/javascript">

//点击咨询
function ziXun(){
	location.href = "http://p.qiao.baidu.com//im/index?siteid=10367567&ucid=6750529";
}


//提交所有信息的订单
function submitForm(){
		 var clientName= $("input[name='clientName']").val();
		 var phone= $("input[name='phone']").val();
		 var acreage= $("input[name='acreage']").val();
		 var branchCompany= $('#branchCompany').val();
		 var orderId = getOrderId();
		 var address = $("input[name='address']").val();
		 var acreages=$.trim(acreage);//房屋面积去空格
		 var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
		 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
		 if(clientName.match(/^\s*$/)){
			 alert("对不起,请正确填写姓名!");
		 }else if(address==""||address==null){
			 alert("请您填写小区名称");
		 }else if(!reg.test(acreages)){
			 alert("对不起,请填请正确天填写房屋面积!");
		 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
			 alert("对不起，请正确填写电话格式!");
		 }else if(branchCompany=="0"){
			 alert("请您选择城市");
		 }else if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) &&reg.test(acreages)){
			 $.ajax({
					type : "POST",
					dataType : "json",
					url : "${ctx}/saveOrderByOtherway",
					data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'315装修特惠'
						,'address':address},
					success : function(data) {
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
				});  
		 }
 };
 
 
//提交只有电话信息的订单
 function subimtLiJi(){
	  var phone=$("#phone").val();
	  var orderId = getOrderId();
	  var branchCompany= $('#branchCompanys').val();
	  var clientName=$("#name").val();
	  var acreage=$("#acreage").val();
	  var acreages=$.trim(acreage);//房屋面积去空格
	  var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
	  if(clientName.match(/^\s*$/)){
			 alert("对不起,请正确填写姓名!");
	  }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		  alert("对不起，请正确填写电话格式!");
	  }else if(!reg.test(acreages)){
			 alert("对不起,请填请正确天填写房屋面积!");
	  }else if(branchCompany=="0"){
			 alert("请您选择城市");
	  }else{
		  $.ajax({
				type : "POST",
				dataType : "json",
				url : "${ctx}/saveOrderByOtherway",
				data : {'branchCompany':branchCompany,'orderId':orderId,'phone':phone,'sourceType':'315装修特惠','clientName':clientName,"acreage":acreage},
				success : function(data) {
					if (data.data == "ok") {
						alert("请您稍等，稍后会有客服人员为您服务!");
					}else{
						alert("保存失败");
					}
				}
			});  
		}
 };
 
 //返回首页
 function breakIndex(){
	 location.href = "http://sjz.sc279.com/";
 }
</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</html>