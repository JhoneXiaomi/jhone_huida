<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${news.seoTitle }</title>
<meta name="keywords" content="${news.seoKeyword }">
<meta name="description" content="${news.seoDesc }">
<link type="text/css" href="${pageContext.request.contextPath}/www/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
</head>

<body>

<!--header start-->
<div class="header">
 <jsp:include page="../public/head.jsp"/>
  <!--nav start-->
   <jsp:include page="../public/nav.jsp"/>
  <!-- nav end -->
</div>
<!--header end-->

<div class="huodong_main w1180">
   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath }/"> ${cityCompany}装修></a>  <a href="${pageContext.request.contextPath }/spec/p1?type=热门活动">热门活动</a></div>
   <div class="list_huodong_title"> <div class="cont_anli_title"><p>上传时间：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p><h3 class="">【${type }】</h3></div></div>
    
    
    <!--左侧新闻列表-->
    <div class="clear">
    
    <div class="content_news_left fl">
      <div class="content_news_title"> ${news.title } </div>
      <div class="content_news_data">文章作者：${news.author } 上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;阅读数:${news.readNum }</div>
      <div class="content_news_con">${news.contents }</div>
      <div class="cont_page clear">
      
     	<c:if test="${newsUp.newsId > 0}">
      	  <div class="page_prev fl">上一篇：<a href="${pageContext.request.contextPath}/newDetail?newsId=${newsUp.newsId }&type=${newsUp.type}">${newsUp.title }</a></div>
    	</c:if>
      	 <c:if test="${news.newsId+1 < max}">
      	  <div class="page_next fr">下一篇：<a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId+1}&type=${newsDown.type}">${newsDown.title }</a></div>
      	</c:if>
        
      </div>
    </div>
    <div class="list_hd_right fr">
    <div class="anli_hxgh">
          <div class="anli_hxgh_title">
            <h3>免费申请户型规划</h3>
            <p>专业设计师提供全程一对一专业服务</p>
          </div>
          
          <form>    
            <p><input class="inp" type="text" id="clientName" name="clientName" placeholder="您的姓名" data-title="您的姓名"></p>
            <p><input class="inp" type="text" id="phone" name="phone" placeholder="您的手机号" data-title="您的手机号"></p>
            <p><input class="inp" type="text" id="address" name="address" placeholder="楼盘名称" data-title="楼盘名称"></p>
            <p><input class="inp" type="text" id="acreage" name="acreage" placeholder="房屋面积" data-title="房屋面积"></p>
            <p class=""><input type="button" onclick="bjbaoming();"class="sq"  value="免费申请"></p>
            <p><input type="hidden" class="index-input-03" id="sourceType" name="sourceType" value="免费申请"/></p>
          </form>
        </div>
 
    
    <div class="ej_tjwz">
      <h3>推荐文章</h3>
      
      <ul>
       	<c:forEach items="${newListNews}" var="news" begin="0" end="9">
  		    <li><span></span>
  		    	<a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">${news.title }</a>
  		    </li>
      	</c:forEach>
      </ul>
    </div>
   </div>
    
    
  </div> 
   </div>
    
    


<div class="clearfix"></div>
<!--footer start-->
<div class="footer">
  <div class="footer01_bg">
    <div class="footer01 w1180">
      <div class="link">${sessionScope.homeLk.value }</div>
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
          <li><img src="${pageContext.request.contextPath}/www/images/footer_tel.png"><span>联系电话：${homeTp.value }</span></li>
<%--           <li><img src="${pageContext.request.contextPath}/www/images/footer_email.png"><span>邮箱：${homePort.value }</span></li> --%>
          <li>
            <div class="addw clearfix">
               <div class="fl"><img src="${pageContext.request.contextPath}/www/images/footer_des.png">地址：</div>
               <div class="f_address fl"><!-- <span class="foot_address"> -->${homeAdress.value }<!-- </span> --></div>
            </div>
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
  
  <div class="footer02_bg"><div class="w1180">Copyright 2013-2016 三创国际装饰有限公司</div></div>
</div>
<!--footer end-->
<!--右侧悬浮 开始-->
<jsp:include page="../public/fastToTop.jsp"/>
<!--右侧悬浮 结束-->
<div class="layout">  
<!--我要报价-->    
<div class="Column-100 fBaojia" style="left: 0px;">
    <div class="Column">
        <div class="wbody clearfix">
            <div class="baojia-name fl"><img src="${pageContext.request.contextPath}/www/images/dbpic.png"><i style="font-size:14px;"></i></div>
            <div class="baojia-con fl">

            <form id="form" method="post">
                <input type="hidden" id="orderId" name="orderId">
                <input type="text" class="xingming ggtext fl" name="KclientName" id="KclientName" placeholder="姓名" />
                <input type="text" class="xingming ggtext fl" name="Kphone" id="Kphone" value="" placeholder="手机" />
                <input type="text" class="xingming ggtext fl" name="Kacreage" id="Kacreage" value="" placeholder="面积" />
                <input type="submit" class="wwbj-but fl" id="submit" value="为我报价" />
            </form>
            </div>
            <div class="db_ewm fl"><img src="${homeTc.value }" width="101" height="103"/><br/><span>扫码获取更多优惠</span></div>
            </div>
            <div class="closeBaojia ease" id="closeBaojia" title="收回">×</div>
        </div>


<script type="text/javascript">
var orderId = $("#orderId").val();

var now = new Date();
var year = now.getFullYear();
var month =(now.getMonth() + 1).toString();
var day = (now.getDate()).toString();
var hour = (now.getHours()).toString();
var minute = (now.getMinutes()).toString();
var second = (now.getSeconds()).toString();
var ms = (now.getMilliseconds()).toString();
if (month.length == 1) {
    month = "0" + month;
}
if (day.length == 1) {
    day = "0" + day;
}
if (hour.length == 1) {
    hour = "0" + hour;
}
if (minute.length == 1) {
    minute = "0" + minute;
}
  if (second.length == 1) {
    second = "0" + second;
} 
var dateTime = year + month +  day + hour + minute + second + ms;
 $("#orderId").val(dateTime);

$(function(){
            $('#submit').click(function(e){
                e.preventDefault();
                var clientName = $('#KclientName').val();
                var phone = $('#Kphone').val();
                var acreage = $('#Kacreage').val();
                var orderId = $("#orderId").val();
                var branchCompany = '${sessionScope.branchCompany}';
                 if(clientName.match(/^\d*$/)){
                        alert('请填写正确的姓名');
                        return false;
                    }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
                        alert('请填写11位号码');
                        return false;
                    }else if(acreage === ''){
                        alert('请填写面积');
                        return false;
                    }
                 $.ajax({
                        url :"${pageContext.request.contextPath}/saveOrder",
                        type:"post",
                        data: {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'快速报价'},
                        success:function(data){
                        	if (data.data == "ok") {
                        		
        						alert("报价成功，请等待联系!");
        					}else{
        						
        						alert("保存失败");
        					}
                        }

                    });
           });
    });

</script>
   
        
<!--跳到顶部-->
   
<script type="text/javascript" src="js/minify%282%29.js"></script>

<script type="text/javascript">
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

</div>

<!--</div>-->
<div class="openBaojia fcf f14 tc fb" id="openBaojia" title="我要报价" style="left: -30px;">我<br>要<br>报<br>价<br></div>
<div class="Column-100 fBaojia-h" style="height: 100px;"></div>
<!--底部报价器结束-->

<!-- /底部 -->
</div>	

${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
<script type="text/javascript">
function bjbaoming(){
	 var clientName= $("#clientName").val();
	 var phone= $("#phone").val();
	 var address= $("#address").val();
	 var acreage= $("#acreage").val();
	 var sourceType= $("#sourceType").val();
	 if(clientName!="" && phone!="" && address!="" && acreage!=""){
		 /*  ,{'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType} */
		 $.ajax({
				type : "POST",
				dataType : "json",
				async: false,
				url : "${pageContext.request.contextPath}/saveOrder",
				data : {'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType},
				success : function(data) {
					if (data.data == "ok") {
						alert("请您稍等，稍后会有客服人员为您服务!");
					}else{
						
						alert("保存失败");
					}
				}
			});  
	 }else if(clientName==""){
		 alert("姓名不能为空,请填写姓名!");
	 }else if(phone==""){
		 alert("电话不能为空,请填写联系电话!");
	 }else if(address==""){
		 alert("楼盘名称不能为空,请填写楼盘名称!");
	 }else if(acreage==""){
		 alert("房屋面积不能为空,请填写房屋面积!");
	 }
}

	function faseMoney(){
		
		window.location.href="${ctx }/orderLine";
	}
</script>
</body>
</html>
