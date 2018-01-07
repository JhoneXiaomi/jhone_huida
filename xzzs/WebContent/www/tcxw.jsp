<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="public/shangqiao.jsp" %>     
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>装修免费报价</title>
<meta content="" name="Keywords">
<meta content="" name="Description">
<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
	
<link href="${ctx }/www/css/styleJrtt.css" rel="stylesheet" type="text/css">

</head>

<body>

<div class="population">
  <div class="header">
     <img src="${ctx}/www/images/jrtt/banner.jpg" />
  </div>
  <div class="sxfw">
    <img src="${ctx}/www/images/jrtt/sx_service.jpg" />
  </div>
  
  
  <div class="bj_form">
   <div class="bm_title"><img src="${ctx}/www/images/jrtt/baoming_tit.jpg" /></div>
   <h3>今天已有<font>387</font>位业主获取了装修预算</h3>
    <form>
    	<input type="hidden" name="orderId" id="orderId"/>
       <!-- <select onchange="window.location=this.value;" id="bj_select" name="city" class="city"> -->
       <select  id="branchCompany" name="branchCompany" class="city">
         <option value="0">请选择您所在的城市</option>
         <option value="bjxz">北京</option>
         <option value="tjxz">天津</option>
         <option value="tsxz">唐山</option>
         <option value="bdxz">保定</option>
         <option value="lfxz">廊坊</option>
         <option value="sjzxz">石家庄</option>
         <option value="czxz">沧州</option>
         <option value="zzxz">郑洲</option>
         <option value="tyxz">太原</option>
         <option value="jnxz">济南</option>
         <option value="hfxz">合肥</option>
         <option value="yjxz">燕郊</option>
         <option value="dcxz">大厂</option>
         <option value="hsxz">衡水</option>
         <option value="ayxz">安阳</option>
         <option value="cqxz">重庆</option>
       </select>

       <input class="bj_inp_area" id="acreage" name="acreage" placeholder="请输入您的房屋面积" />
       
       <select id="style" name="style">
         <option value="0">请选择您喜欢的风格</option>
         <option value="现代简约">现代简约</option>
         <option value="欧美风格">欧美风格</option>
         <option value="田园风格">田园风格</option>
         <option value="中式风格">中式风格</option>
         <option value="地中海风格">地中海风格</option>
       </select>
       
       <input class="bj_inp_area" id="clientName" placeholder="请输入您的姓名" name="clientName" />
       <!--<div class="bj_am">
        <div class="bj_am01">
          <select>
            <option value="一室">一室</option>
            <option value="两室">两室</option>
            <option value="三室">三室</option>
            <option value="四室">四室</option>
          </select>
        </div>
        
        
        <div class="bj_am02">
          <select>
            <option value="一厅">一厅</option>
            <option value="两厅">两厅</option>
            <option value="三厅">三厅</option>
          </select>
        </div>
        
        
        
        <div class="bj_am03">
          <select>
            <option value="一室">一厨</option>
            <option value="两室">两厨</option>
          </select>
        </div>
        
        
       </div>-->
       
       <input placeholder="输入号码，报价结果将发送到您的手机" name="phone"/>
       <a class="ljjs" onclick="submit()"><input class="ljjs" type="button" value="立即计算"/></a>
    </form>
  </div>
  
  <div class="center">
    <img src="${ctx}/www/images/jrtt/todayimg_05.jpg" />
     <div class="center_po"><img src="${ctx}/www/images/jrtt/todayimg_06.jpg" /></div>
     <div class="center_ljbm"><a href="">立即报名</a></div>
    
    <img src="${ctx}/www/images/jrtt/todayimg_07.jpg" />
    <img src="${ctx}/www/images/jrtt/todayimg_08.jpg" />
  </div>
  
  
 <!-- <div class="center_anli">
    <ul class="clearfix">
      <li><a href=""><img src="${ctx}/www/images/jrtt/anli01.jpg"/></a></li>
      <li class="no_mar"><a href=""><img src="${ctx}/www/images/jrtt/anli01.jpg"/></a></li>
      <li><a href=""><img src="${ctx}/www/images/jrtt/anli01.jpg"/></a></li>
      <li class="no_mar"><a href=""><img src="${ctx}/www/images/jrtt/anli01.jpg"/></a></li>
    </ul>
  </div>-->
  <div class="center_anli">
    <c:forEach items="${casesList}" var="cases" begin="0" end="3" varStatus="status">
	    <dl class="no_mar">
	      <dt><img src="${cases.caseThumbImg}"/></dt>
	      <dd>
	        <p class="tit_style"> ${cases.caseStyle}</p>
	        <p class="tit_hm">${cases.caseHouseType} 面积：${cases.caseAcreage}㎡</p>
	      </dd>
	    </dl>
 	</c:forEach>
</div>
    <div class="bj_form">
     <div class="footer01">
	<select  id="branchCompanys" name="branchCompany">
	         <option value="0">请选择您所在的城市</option>
	         <option value="bjxz">北京</option>
	         <option value="tjxz">天津</option>
	         <option value="tsxz">唐山</option>
	         <option value="bdxz">保定</option>
	         <option value="lfxz">廊坊</option>
	         <option value="sjzxz">石家庄</option>
	         <option value="czxz">沧州</option>
	         <option value="zzxz">郑洲</option>
	         <option value="tyxz">太原</option>
	         <option value="jnxz">济南</option>
	         <option value="hfxz">合肥</option>
	         <option value="yjxz">燕郊</option>
	         <option value="dcxz">大厂</option>
	         <option value="hsxz">衡水</option>
	         <option value="ayxz">安阳</option>
	         <option value="cqxz">重庆</option>
       	</select>
       <input placeholder="输入您的联系电话，免费预约新洲装饰服务" id="phone"/>
       <a onclick="phoneSubmit()"><input type="submit"  value="免费预约" /></a>
     </div>
     
     <div class="footer02">
       Copyright @2015-2016 京ICP备12044014号 <br />
       版权所有 北京新洲伟业装饰有限公司 
     </div>
     
     <div class="footer03">
       <a href="" class="footer03a"><img src="${ctx}/www/images/jrtt/todayimg_10.jpg"/></a>
       <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" class="footer03b"><img src="${ctx}/www/images/jrtt/todayimg_12.jpg"/></a>
       <a onclick="isPC(this)" class="footer03c"><img src="${ctx}/www/images/jrtt/todayimg_14.jpg"/></a>
     </div>
     
   </div>
 
 
</div>

<script type="text/javascript" src="${ctx}/www/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
//判断是否为电脑登录
function isPC(useUtil) {
		var userAgentInfo = navigator.userAgent;
	    var Agents = ["Android", "iPhone",
	                "SymbianOS", "Windows Phone",
	                 "BlackBerry"];
	    var flag = false;
	    for (var v = 0; v < Agents.length; v++) {
	        if (userAgentInfo.indexOf(Agents[v]) > 0) {
	            flag = true;
	        }
	    }
	    if(flag){
		window.location.href="tel:18332010207";
	    }else{
	    	alert("电话为：18332010207");
	    }
	};
//提交所有信息的订单
 function submit(){
		 var clientName= $("input[name='clientName']").val();
		 var phone= $("input[name='phone']").val();
		 var acreage= $("input[name='acreage']").val();
		 var branchCompany= $('#branchCompany').val();
		 var orderId = getOrderId();
		 var style = $("#style").val();
		 var acreages=$.trim(acreage);//房屋面积去空格
 		 var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
		 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
		 if(branchCompany=="0"){
			 alert("请您选择城市");
		 }else if(style=="0"){
			 alert("请您选择装修风格");
		 }else if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) &&reg.test(acreages)){
			 $.ajax({
					type : "POST",
					dataType : "json",
					url : "${ctx}/saveOrderByOtherway",
					data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'腾讯新闻'
						,'style':style},
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
		 }else if(!reg.test(acreages)){
			 alert("对不起,请填请正确天填写房屋面积!");
		 }
  };
  //提交只有电话信息的订单
  function phoneSubmit(){
	  var phone=$("#phone").val();
	  var orderId = getOrderId();
	  var branchCompany= $('#branchCompanys').val();
	  if(branchCompany=="0"){
			 alert("请您选择城市");
		}else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		  alert("对不起，请正确填写电话格式!");
	 	 }else{
		  $.ajax({
				type : "POST",
				dataType : "json",
				url : "${ctx}/saveOrderByOtherway",
				data : {'branchCompany':branchCompany,'orderId':orderId,'phone':phone,'sourceType':'腾讯新闻'},
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
</script>
</body>
</html>