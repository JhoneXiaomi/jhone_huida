<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${CurrentCase.seoKeyword }"/>
<meta name="description" content="${CurrentCase.seoDesc }"/>
<title>${CurrentCase.seoTitle }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.4.min.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery.galleryview-1.1.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery.timers-1.1.2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#photos').galleryView({
			panel_width: 880,
			panel_height: 500,
			frame_width: 100,
			frame_height: 100
		});
	});
</script>
</head>
<body>
	<!--header start-->
	<jsp:include page="public/header.jsp" />
	<!--header end-->
    <!--nav start-->
	<jsp:include page="public/nav.jsp" />
    <!--nav end-->

<!--二级页面  主体部分 start-->

<div class="ej_main">
 
  <div class="ej_weizhi">
     <div class="w1200 clearfix">
       <div class="ej_weizhi_left fl"><span>C</span>ASE &nbsp;详细案例</div>
       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">详细案例</a></div>
     </div> 
  </div>
  
  
  
  <!--新闻详情 start-->
 <div class="ej_news_con w1200 clearfix">
  <div class="ej_news_left fl">
        <div class="ej_anlisjs">
          <div class="bigTitle">本案设计师</div>
          <div class="anli_per_info clear">
             <div class="anli_per_img fl">
	             <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
	             		<img src="${designer.designerPhotoImg }" width="120" height="140" alt="${designer.designerName}"/>
	             </a>
             </div>
             <div class="anli_per_con fl">
               <p>姓名：${designer.designerName }</p>
               <p>级别：${designer.designerTitle }</p>
               <p>从业时间：${designer.designerWorkTime }</p>
               <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}"><p class="TA">TA的主页</p></a>
             </div>
          </div>
        </div>

    <div class="anli_hxgh">
          
          
          <div class="anli_hxgh_title">
            <h3>免费申请户型规划</h3>
            <!--<p>专业设计师提供全程一对一专业服务</p>-->
          </div>
          
          <form>
	            <input type="hidden" id="branchCompany" name="branchCompany"  value="${myBranchCompany }"/>
			    <input type="hidden" id="orderId" name="orderId"/>
	            <p><input class="inp" type="text" id ="freeClientName" name="freeClientName" placeholder="您的姓名" data-title="您的姓名"/></p>
	            <p><input class="inp" type="text" id ="freePhone" name="freePhone" placeholder="您的手机号" data-title="您的手机号"/></p>
	            <p><input class="inp" type="text" id ="freeAddress" name="freeAddress" placeholder="楼盘名称" data-title="楼盘名称"/></p>
	            <p><input class="inp" type="text" id ="freeAcreage" name="freeAcreage" placeholder="房屋面积" data-title="房屋面积"/></p>
            
	            <select name="freeStyle" id="freeStyle">
		           <option value="东南亚风格">东南亚风格</option>
		           <option value="混搭风格">混搭风格</option>
		           <option value="简约风格">简约风格</option>
		           <option value="美式风格">美式风格</option>
		           <option value="欧式风格">欧式风格</option>
		           <option value="地中海风格">地中海风格</option>
		           <option value="中式风格">中式风格</option>
		           <option value="田园式风格">田园式风格</option>
	            </select>
           
            <p class=""><input type="button" class="sq" value="免费申请" onclick="freeOnline()"/></p>
            <p></p>
          </form>
        </div>
  </div>
  <div class="ej_con_anli ej_news_right fr">
    
    <div class="bigTitle">楼盘详细信息</div>
    
    
    <div class="cont_anli_tab">
         
         <ul class="clearfix">
            <li>楼盘：${CurrentCase.caseCommunity}</li>
            <li>风格：${CurrentCase.caseStyle }</li>
            <li>户型：${CurrentCase.caseHouseType }</li>
            <li>面积：${CurrentCase.caseAcreage }m²</li>
            <li>预算：${CurrentCase.caseMoney }万</li>
            <li>行政区域：${CurrentCase.caseArea }</li>
         </ul>
       </div>
    
    
    
<div id="photos" class="galleryview">
 <c:forEach items="${caseList }" var="cases">
		  <div class="panel"> <img src="${cases.imageUrl }" />
		    <div class="panel-overlay">
		      <h2>${CurrentCase.caseTitle }</h2>
		    </div>
		  </div> 		 
  </c:forEach>
  <ul class="filmstrip">
   <c:forEach items="${caseList }" var="cases">
    <li><img src="${cases.imageUrl }" alt="${CurrentCase.caseTitle }" title="${CurrentCase.caseTitle }" /></li>
   </c:forEach> 
  </ul>
</div>
    
    
  </div>
 </div>
  <!--新闻详情 end-->
    
    <div class="clearfix"></div>

  
  <div class="list_al clearfix w1200">
		
         <div class="bigTitle">相关案例</div>
	    <c:forEach items="${casesList }" var="cases" varStatus="status" begin="0" end="7">
	    	<c:if test="${(status.index+1)%4 != 0 }">
			 <dl>
		        <div class="list_pic">
		        <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
		        <img src="${cases.caseThumbImg }" width="280" height="213"/>
		        </a></div>
		        <dt>
		          <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
		        <img src="${cases.designerPhotoImg }" width="70" height="70"/></a></dt>
		        <dd>
		          <div class="list_info">
		            <span><b style="color:#009c42">【${cases.caseTitle }】</b>&nbsp;&nbsp;${cases.caseStyle }</span>
		            <span>${cases.caseHouseType }&nbsp;|&nbsp;50&nbsp;|&nbsp;&nbsp;<b style="color:#009c42">${cases.caseMoney }万</b>起</span>
		          </div>
		        </dd>
		      </dl>	    	
	    	</c:if>
	    	<c:if test="${(status.index+1)%4 == 0 }">
			 <dl class="no_mar">
		        <div class="list_pic">
		        <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
		        <img src="${cases.caseThumbImg }" width="280" height="213"/>
		        </a></div>
		        <dt>
		          <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
		        <img src="${cases.designerPhotoImg }" width="70" height="70"/></a></dt>
		        <dd>
		          <div class="list_info">
		            <span><b style="color:#009c42">【${cases.caseTitle }】</b>&nbsp;&nbsp;${cases.caseStyle }</span>
		            <span>${cases.caseHouseType }&nbsp;|&nbsp;50&nbsp;|&nbsp;&nbsp;<b style="color:#009c42">${cases.caseMoney }万</b>起</span>
		          </div>
		        </dd>
		      </dl>	    	
	    	</c:if>
	    </c:forEach>	  	       
    </div>
</div>

<!--二级页面  主体部分 end-->
	
	
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
<script type="text/javascript">
	/* 设置订单号 */
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
		function freeOnline(){
			    var orderId = $("#orderId").val();
			    var clientName = $('input[name=freeClientName]').val();
			    var phone = $('#freePhone').val();
			    var acreage  = $('#freeAcreage').val();
			    var address = $('input[name=freeAddress]').val();
			    var style = $('#freeStyle').val();
			    var branchCompany= '${currentBCompany}';
			    var sourceType= "免费申请";
			    if(clientName!="" && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
					 $.ajax({
							type : "POST",
							dataType : "json",
							async: false,
							url : "${pageContext.request.contextPath}/saveOrder",
							data : {'sourceType':sourceType,'phone':phone,'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'style':style,},
							success : function(data) {
								if (data.data == "ok") {
									alert("您的订单已经提交成功!");
								}else{
									alert("保存失败");
								}
							}
						});  
				 }else if(clientName==""){
				        alert('姓名为空，请填写姓名！');
				        return false;
				 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				        alert('手机号码格式不正确，请重新填写！');
				        return false;
				  }
		}
	</script>
	${sessionScope.statistics.value }
${sessionScope.shangqiao.value }	
</body>
</html>
