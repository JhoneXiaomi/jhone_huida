<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${news.seoKeyword }"/>
<meta name="description" content="${news.seoDesc }"/>
<title>${news.seoTitle }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
<script src="${ctx }/www/js/jquery.min.js"></script>
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
	       <div class="ej_weizhi_left fl"><span>H</span>OTACTIVITY &nbsp;热门活动</div>
	       <div class="ej_local_right fr">您的当前位置：
	       <a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="${ctx }/activity/p1">热门活动</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">${news.type }</a></div>
	     </div> 
	  </div>
	  
	  
	  
	  <!--新闻详情 start-->
	 <div class="ej_news_con w1200 clearfix">
	  <div class="ej_news_left fl">
	    
	    <div class="anli_hxgh">
	          <div class="anli_hxgh_title">
	            <h3>免费申请户型规划</h3>
	            <!--<p>专业设计师提供全程一对一专业服务</p>-->
	          </div>
	          
	          <form>
	            <input type="hidden" name="orderId" id="orderId"/>
	            <p><input class="inp" type="text" name="clientName" placeholder="您的姓名" data-title="您的姓名"/></p>
	            <p><input class="inp" type="text" name="phone" placeholder="您的手机号" data-title="您的手机号"/></p>
	            <p><input class="inp" type="text" name="address" placeholder="楼盘名称" data-title="楼盘名称"/></p>
	            <p><input class="inp" type="text" name="acreage" placeholder="房屋面积" data-title="房屋面积"/></p>
	            
	            <select name="houseStyle" id="style">
		           <option value="东南亚风格">东南亚风格</option>
		           <option value="混搭风格">混搭风格</option>
		           <option value="简约风格">简约风格</option>
		           <option value="美式风格">美式风格</option>
		           <option value="欧式风格">欧式风格</option>
		           <option value="地中海风格">地中海风格</option>
		           <option value="中式风格">中式风格</option>
		           <option value="田园式风格">田园式风格</option>
	            </select>
	            
	            <p class=""><input type="button" class="sq" value="免费申请" onclick="online();"/></p>
	            <p></p>
	          </form>
	        </div>
	        
	        
	        <div class="tjanli">
	          <div class="anli_hxgh_title">
	            <h3>推荐案例</h3>
	          </div>
	          <ul>
	          <c:forEach items="${aCasesList }" var="cases" begin="0" end="2">
		          <li>
			          <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
			        		 <img src="${cases.caseThumbImg }" width="240" height="180"/>
			          </a>
			          <span>
			          <c:choose>
			          
			          		<c:when test="${fn:length(cases.caseTitle)>17 }">
			          			${fn:substring(cases.caseTitle,0,17) }
			          		</c:when>
			          		<c:otherwise>
			          		    ${cases.caseTitle }
			          		</c:otherwise>
			          </c:choose>
			          </span>
		          </li>
	          </c:forEach>
	          </ul>
	          
	        </div>
	  </div>
	  <div class="ej_news_right fr">
	    <div class="ej_news_con_tit"><h4>${news.title }</h4></div>
	    <div class="ej_news_con_data">文章作者：${news.author } |  上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	    <div class="ej_news_con_con">${news.contents}
	</div>
	
	  
	  <div class="ej_news_con_page">
	  	<c:if test="${newsUp.newsId >= 0}">
      	  <div class="ej_page_prev fl">上一篇：<a href="${pageContext.request.contextPath}/activityDetail?newsId=${newsUp.newsId }&type=${newsUp.type}">${newsUp.title }</a></div>
    	</c:if>
      	 <c:if test="${newsDown.newsId <= max}">
      	  <div class="ej_page_prev fr">下一篇：<a href="${pageContext.request.contextPath}/activityDetail?newsId=${newsDown.newsId}&type=${newsDown.type}">${newsDown.title }</a></div>
      	</c:if>
	  </div>
	  </div>
	 </div>
	  <!--新闻详情 end-->
	    <div class="clearfix"></div>
	</div>
	<!--二级页面  主体部分 end-->
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	<script type="text/javascript">
	
		/* 设置订单号 */
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
		/* 在线订单的 */
		function online() {
		    var orderId = $("#orderId").val();
		    var clientName = $('input[name=clientName]').val();
		    var phone = $('input[name=phone]').val();
		    var acreage  = $('input[name=acreage]').val();
		    var address = $('input[name=address]').val();
		    var style = $('#style').val();
		    var branchCompany= '${branchCompany}';
		    var sourceType= "在线订单";
		    if(clientName!="" && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 $.ajax({
						type : "POST",
						dataType : "json",
						async: false,
						url : "${pageContext.request.contextPath}/saveOrder",
						data : {'phone':phone,'branchCompany':branchCompany,'acreage':acreage,'sourceType':sourceType,'acreage':acreage,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'style':style,},
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
