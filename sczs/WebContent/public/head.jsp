<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class="top_line"> 
  <div class="head_top  w1180">
       <div class="top_local fl">
        <span>当前站： <span id="CurrCompany" style="color:#f39800;"></span>&nbsp;&nbsp;&nbsp;&nbsp;三创装饰全国分站：</span>
            <a href="http://www.sc27800.com" rel="nofollow" target="_blank">北京</a>&nbsp;&nbsp;&nbsp;
            <a href="http://ts.sc27800.com" rel="nofollow" target="_blank">唐山</a>&nbsp;&nbsp;&nbsp;
            <a href="http://tj.sc27800.com" rel="nofollow" target="_blank">天津</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://lf.sc27800.com" rel="nofollow" target="_blank">廊坊</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://sjz.sc27800.com" rel="nofollow" target="_blank">石家庄</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://hs.sc27800.com" rel="nofollow" target="_blank">衡水</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://bd.sc27800.com" rel="nofollow" target="_blank">保定</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://ty.sc27800.com" rel="nofollow" target="_blank">太原</a>
    </div>
     <div class="top_wel fr" >◎ 京城百姓信赖品牌家装公司 ◎ 室内装饰协会理事单位 ◎ 绿色装饰企业</div>
  </div>
  </div>
  <div class="logotel w1180 clearfix">
    <div class="logo fl"><a href="${ctx }/"><img src="${sessionScope.homeLogo.value }" id="logoImg"></a></div>
    <div class="telqq fr">
    	<div class="qq fr"><span><img src="${pageContext.request.contextPath}/www/images/tel.png"></span><p>公司电话：</p><p>${sessionScope.homeTp.value }</p></span></div>
    </div>
  </div>
  <script type="text/javascript">
  
	  /* 为分站添加点击事件 */
	  var currentBCompany = '${sessionScope.branchCompany}';
	  $('#BCompany').val(currentBCompany);
	  if(currentBCompany=='bjsc'){
	  	$("#CurrCompany").text('北京站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰北京站！');
	  }
	  if(currentBCompany=='tjsc'){
	  	$("#CurrCompany").text('天津站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰天津站！');
	  }
	  if(currentBCompany=='lfsc'){
	  	$("#CurrCompany").text('廊坊站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰廊坊站！');
	  }
	  if(currentBCompany=='sjzsc'){
	  	$("#CurrCompany").text('石家庄站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰石家庄站！');
	  }
	  if(currentBCompany=='tssc'){
	  	$("#CurrCompany").text('唐山站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰唐山站！');
	  }
	  if(currentBCompany=='bdsc'){
	  	$("#CurrCompany").text('保定站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰保定站！');
	  }
	  if(currentBCompany=='hssc'){
	  	$("#CurrCompany").text('衡水站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰衡水站！');
	  }
	  if(currentBCompany=='tysc'){
	  	$("#CurrCompany").text('太原站');
	  	$("#div_CurrCompany").text('欢迎访问三创装饰太原站！');
	  }
  
  </script>
</body>
</html>