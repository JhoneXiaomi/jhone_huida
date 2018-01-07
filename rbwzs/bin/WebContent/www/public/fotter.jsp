<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="footer">
  <div class="foot w1200">
     <div class="link"> 友情链接：${sessionScope.homeLk.value } </div>
     <div class="foot01 clearfix">
       <div class="footer_nav fl">
         <h5>快速导航</h5>
         <a href="">装修套餐</a>
         <a href="">设计案例</a>
         <a href="">热门活动</a>
         <a href="">设计团队</a>
         <a href="">装修攻略</a>
         <a href="">蓝钻工艺</a>
         <a href="">三创服务</a>
         <a href="">关于三创</a>
       </div>
       
       <div class="footer_add fl">
         <ul class="clearfix">
           <li><img src="${ctx }/www/images/icon_phone.png"/><span>热线：${homeTp.value }</span></li>
           <li><img src="${ctx }/www/images/icon_tel.png"/>电话：${homeTp.value }</li>
           <li><img src="${ctx }/www/images/icon_add.png"/>地址：${homeAdress.value }</li>
         </ul>
       </div>
       
       <div class="footer_ewm fr">
         <ul class="clearfix">
           <li><img src="${homeTc.value }" width="96" height="96"/><p>二维码</p></li>
           <li><img src="${ctx }/www/images/weibo.png" width="96" height="96"/><p>官方微博</p></li>
         </ul>
       </div>
     </div>
  </div>
  
    <div class="foot_bot">
       <div class="w1200">瑞博文装饰有限公司  备ICP  版权所有 Copyright© 2014 All Rights Reserved 技术支持：瑞博文装饰</div>
     </div>
  
</div>
</body>
</html>