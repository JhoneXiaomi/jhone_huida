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
      <div class="welcom_left fl">欢迎来到瑞博文官方网站！  您的当前站：石家庄</div>
      <div class="zxyy_right fr">
        <a href="">在线咨询</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="">在线预约</a>
      </div>
    </div>
  </div>
  <!--logo telqq start-->
  <div class="top_t w1200 clearfix">
    <div class="logo fl"><img src="${sessionScope.homeLogo.value }" width="454" height="85"/></div>
    <div class="telqq fr">
      <p >24小时服务热线：<br/><b>${sessionScope.homeTp.value }</b></p>
      <div class="linezx"><a href="">在线咨询</a></div>
    </div>
  </div>
  <!--logo telqq end-->
  <div class="clear"></div>
</div>
</body>
</html>