<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="ctx" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css">
<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
<title></title>
</head>
<body>
<!--footer start-->
<div class="footer">
  <div class="footer01_bg">
    <div class="footer01 w1180">
       <div class="link" id="friendLink">${sessionScope.homeLk.value }</div>
      <div class="footer_nav fl">
        <h3>快速导航</h3>
        <ul>
             <li><a href="${pageContext.request.contextPath }/Integrated_package.jsp">整装套餐</a></li>
          <li><a href="${pageContext.request.contextPath }/cases/p1" >设计案例</a></li>
          <li><a href="${pageContext.request.contextPath}/spec/p1?type=热门活动" id="s3" class="subNavBtn">热门活动</a></li>
          <li><a href="${pageContext.request.contextPath}/designer/p1">设计团队</a></li>
          <li><a href="${pageContext.request.contextPath}/specase/p1?type=说装修">说装修</a></li>
          <li><a href="${pageContext.request.contextPath}/blue_diamond_process.jsp">蓝钻工艺</a></li>
          <li><a href="javascript:void(0)">三创服务</a></li>
          <li><a href="${pageContext.request.contextPath}/about.jsp">关于三创</a></li>
        </ul>
      </div>
     <div class="footer_cont fl">
        <h3>联系我们</h3>
         <ul class="clear">
         	<c:if test="${branchCompany!='bjsc'}">
				<li><img src="${pageContext.request.contextPath}/www/images/company.png"><span>总公司名称：北京三创装饰设计有限公司(总部)</span></li>
				<li><img src="${pageContext.request.contextPath}/www/images/company.png"><span>总公司地址：北京市朝阳区十里河古隆盛四层</span></li>
			</c:if>
          <li><img src="${pageContext.request.contextPath}/www/images/company.png"><span>公司名称：${scinterHomeChildCompany.value }</span></li>

          <li><img src="${pageContext.request.contextPath}/www/images/footer_tel.png"><span>公司电话：${homeTp.value }</span></li>
<%--           <li><img src="${pageContext.request.contextPath}/www/images/footer_email.png"><span>邮箱：${homePort.value }</span></li> --%>
          <li>
           <img src="${pageContext.request.contextPath}/www/images/footer_des.png"><span>公司地址：${homeAdress.value }</span>
           
         </li>
        </ul>
      </div>
      
      <div class="footer_ewm">
      <h3>扫描二维码</h3>
       <ul>
          <li><img src="${homeTc.value }"></li>
          <li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/www/images/tianmao.png"></a></li>
          <li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/www/images/jingdong.jpg"></a></li>
        </ul>
      </div>
    </div>
  </div>
   <div class="clear"></div>
  
  <div class="footer02_bg"><div class="w1180">Copyright 2013-2016 北京三创国际装饰设计有限公司</div></div>
</div>
<!--footer end-->

<!--右侧悬浮 开始-->
<div class="floating_ck">
	<dl>
    	<dt></dt>
        <dd class="quote">
			<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"> <span>在线咨询</span></a>

            <div class="floating_left">
				  	 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">点击立即咨询</a>
            </div>
        </dd>
        <dd class="qqpic">
        	<a href="http://wpa.qq.com/msgrd?v=3&uin=648040867&site=qq&menu=yes" target="_blank" style="color: #FFF"><span>QQ咨询</span></a>
        </dd>
        <dd class="qrcord">
        	<span>扫一扫</span>
            <div class="floating_left floating_ewm">
            	<i><img src="${homeTc.value }"/></i>
                <p class="qrcord_p01">扫一扫<br>扫描二维码</p>
            </div>
        </dd>
        <dd class="return">
        	<span onClick="gotoTop();return false;">返回顶部</span>
        </dd>
    </dl>
</div>
<!--右侧悬浮 结束-->
<!--跳到顶部-->
   
<script type="text/javascript" src="js/minify%282%29.js"></script>

<script type="text/javascript">

$("#link").children().attr("rel","nofollow");
$(function(){
	var url=window.location.href;
	var lastIndex=url.lastIndexOf("/");
	if((url.length-lastIndex)>1){
		$("#friendLink").hide();
	}
});

$("#FBaojia").find("input[type='text'],textarea").each(function() {
    var clue_on = $(this).closest(".table").find(".clue_on");
    $(this).attr('placeholder', clue_on.text());
    if(!$.browser.msie){
        $(this).focus(function(){$(this).attr("placeholder",'');});
        $(this).blur(function(){$(this).attr("placeholder", clue_on.text());});
    }
}).placeholder();
function FBaojia_submit(f){
var formId = $("#"+f);
var contact = formId.find("#contact");if(!contact.val()){alert("请输入您的称呼");contact.focus();return false;}
var phone = formId.find("#phone");if(!(/^1[3|4|5|8][0-9]\d{7,8}$/.test(phone.val()))){alert("手机号码未填写或填写错误");phone.focus();return false;}
var area = formId.find("#area");var areaVal = area.val();if(!areaVal || isNaN(areaVal)){alert("请输入正确的面积");area.focus();return false;}
var check = formId.find("#sys_check");if(!check.val()){alert("请输入验证码");check.focus();return false;}
$.get("@c=post&f=ajax_checkcode&sys_check=.htm"+check.val(), function(data){
    if(data!="success"){
        formId.find("#imgcode").attr("src",get_url("login,codes")+'rand='+Math.random());
        alert("验证码有误！请重新填写");
        check.val('');check.focus();return false;
    }else{
        $.post(formId.find("form").attr("action"), formId.find("form").serialize(),function(data){
            alert(formId.find("#tomsg").val());
            formId.find("#imgcode").attr("src",get_url("login,codes")+'rand='+Math.random());
            check.val('');
        });
    }
});
return false;}
$(document).ready(function(){
    $("#FBaojia #sys_check").focus(function(){
        $("#FBaojia #imgcode").css({display:"block"}).animate({opacity: "1",top: 0},300);
    }).blur(function(){
        $("#FBaojia #imgcode").css({display:"none"}).animate({opacity: "0",top: "-20px"},300);
    });
    //底部报价器
    $("#closeBaojia").click(function(){
        $(".fBaojia").stop(true,true).animate({left:"-100%"},500,function(){
            $(".fBaojia-h").stop(true,true).animate({height:0},500,function(){
                $("#openBaojia").stop(true,true).animate({left:0},500);
            });
        });
    });
    $("#openBaojia").click(function(){
        $(this).stop(true,true).animate({left:-30},500,function(){
            $(".fBaojia").stop(true,true).animate({left:0},500,function(){
                $(".fBaojia-h").stop(true,true).animate({height:85},500);
            });
        });
    });
});
</script>    


<!--</div>-->
<!-- <div class="openBaojia fcf f14 tc fb" id="openBaojia" title="我要报价" style="left: -30px;">我<br>要<br>报<br>价<br></div> -->
<!-- <div class="Column-100 fBaojia-h" style="height: 100px;"></div> -->
<!--底部报价器结束-->

<!-- /底部 -->

${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>