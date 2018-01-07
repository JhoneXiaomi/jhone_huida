<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
<title>${statScinterHomeSeoTitle.value }</title>
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
	       <div class="ej_weizhi_left fl"><span>C</span>OMMON PROBLEM &nbsp;常见问题</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">常见问题</a></div>
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
	        
	        
	        <div class="tjanli">
	          <div class="anli_hxgh_title">
	            <h3>推荐案例</h3>
	            <!--<p>专业设计师提供全程一对一专业服务</p>-->
	          </div>
	          
	          <ul>
	          	<c:forEach items="${casesList }" var="cases" begin="0" end="2">
	          	 <li>
	          	 <a href="${ctx }/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	          	 <img src="${cases.caseThumbImg }" width="240" height="180"/>
	          	 </a>
	          	 </li>
	          	</c:forEach>
	          </ul>
	          
	        </div>
	  </div>
	  <div class="ej_news_right fr">
	  
	   <div style="margin-top:20px;"></div>
	  <div class="bigTitle">常见问题</div>
	     <div class="ej_changjianwenti">
			<c:forEach items="${faqLists }" var="faq" >
	  
		  	 <dl>
		  	    <dt><h3>${faq.faqDesc }</h3></dt> 
			    <dd>
				   ${faq.faqAnswer }
				   <p><font color="#009c42">创建时间:<fmt:formatDate value="${faq.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></font></p>
			    </dd>   
		     </dl>
		  </c:forEach> 	       
	     </div>
	     
	     
	     <div class="Page clearfix">
	     
       	 <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/commen/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/commen/p${i }">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/commen/p${page.pageNo+1 }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/commen/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
       </div> 
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
			    var branchCompany= $('#branchCompany').val();
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
