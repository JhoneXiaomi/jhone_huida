<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class="header">
  <div class="top_one">
    <div class="w1200 clearfix">
      <div class="welcom_left fl">
	      <span>当前站： <span id="CurrCompany" style="color: #009c42;"></span>&nbsp;&nbsp;&nbsp;&nbsp;瑞博文装饰全国分站：</span>
	            <a href="http://www.rbw27900.com">石家庄</a>&nbsp;&nbsp;&nbsp;
	            <a href="http://bd.rbw27900.com">保定</a>&nbsp;&nbsp;&nbsp;
		        <a href="http://hs.rbw27900.com">衡水</a>&nbsp;&nbsp;&nbsp;
		        <a href="http://lf.rbw27900.com">廊坊</a>
		   </span>    
      </div>
      <div class="zxyy_right fr"> ◎ 百姓信赖品牌家装公司 ◎ 室内装饰协会理事单位 ◎ 绿色装饰企业  </div>
    </div>
  </div>
  <!--logo telqq start-->
  <div class="top_t w1200 clearfix">
    <div class="logo fl"><img src="${sessionScope.homeLogo.value }" width="454" height="85"/></div>
    <div class="telqq fr">
      <p >24小时服务热线：<br/><b>${sessionScope.homeTp.value }</b></p>
    </div>
  </div>
  <!--logo telqq end-->
  <div class="clear"></div>
</div>
	<script type="text/javascript">
	  
		  /* 为分站添加点击事件 */
		  var currentBCompany = '${branchCompany}';
		  if(currentBCompany=='sjzrbw1'){
		  	$("#CurrCompany").text('欢迎访问瑞博文装饰石家庄站！');
		  }
		  if(currentBCompany=='bdrbw1'){
		  	$("#CurrCompany").text('欢迎访问瑞博文装饰保定站!');
		  }
		  if(currentBCompany=='lfrbw1'){
		  	$("#CurrCompany").text('欢迎访问瑞博文装饰廊坊站!');
		  }
		  if(currentBCompany=='hsrbw1'){
		  	$("#CurrCompany").text('欢迎访问瑞博文装饰衡水站!');
		  }
	  </script>
</body>
</html>