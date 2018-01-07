<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${CurrentCase.seoTitle }</title>
<meta name="keywords" content="${CurrentCase.seoKeyword }">
<meta name="description" content="${CurrentCase.seoDesc }">
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
    
   <!--nav start--> 
   <jsp:include page="../public/nav.jsp"/>
   <!--nav end-->  
 
</div>
<!--header end-->

<div class="cont_main w1180">
  <div class="list_position">您的当前位置：<a href="${ctx}/"> ${cityCompany}装修</a> > <a href=""> 案例展示</a></div>
  
  
  <!--案例详情页  案例展示（大图） start-->
  <div class="content_anli">
        
    <div class="caseview case_view">
    
    <div class="cont_anli_title"><p>上传时间<fmt:formatDate value="${CurrentCase.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p><h3 class="">【${CurrentCase.caseTitle }】</h3></div>
        <div class="fl">
         <div class="cont_anli_tab">
         
         <ul class="clearfix">
            <li>楼盘：${CurrentCase.caseCommunity}</li>
            <li>风格：${CurrentCase.caseStyle }</li>
            <li>户型：${CurrentCase.caseHouseType }</li>
            <li>面积：${CurrentCase.caseAcreage }</li>
            <li>预算：${CurrentCase.caseMoney }</li>
            <li>行政区域：${CurrentCase.caseArea }</li>
         </ul>
       </div> 
        
        
		<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/slide.js"></script>
            <div class="fadePlay casePlay">
            <span id="prev" class="btn prev"></span> 
            <span id="next" class="btn next"></span> 
            <span id="prevTop" class="btn prev"></span> 
            <span id="nextTop" class="btn next"></span>
              <div id="picBox" class="picBox">
                <ul class="cf">	
                   <c:forEach items="${caseList }" var="cases" begin="0" end="5">
                   		 <li><img src="${cases.imageUrl }" alt="${CurrentCase.caseTitle }"></li>
                   </c:forEach>		
                </ul>
              </div>
              <div class="listBox_bg">
               <div id="listBox" class="listBox">
                <ul class="cf">
                   <c:forEach items="${caseList }" var="cases" begin="0" end="5">
                   		 <li><i class="arr2"></i><img src="${cases.imageUrl }" alt="${CurrentCase.caseTitle }"></li>
                   </c:forEach>	
                 
                </ul>
              </div>
            </div>
            </div>
           
        </div>
        <div class="anli_per fr" style="padding-bottom: 10px;">
         <h4>本案设计师简介</h4>
        
          <div class="anli_per_info clear">
             <div class="anli_per_img fl"><img src="${designer.designerPhotoImg }" width="120" height="140" alt="${designer.designerName}"></div>
             <div class="anli_per_con fl">
               <p>姓名：${designer.designerName }</p>
               <p>级别：${designer.designerTitle }</p>
               <p>从业时间：${designer.designerWorkTime }年</p>
               <a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}"><p class="TA">TA的主页</p></a>
             </div>
          </div>
        
        <div class="anli_hxgh">
          <div class="anli_hxgh_title">
            <h3>免费申请户型规划</h3>
            <p>专业设计师提供全程一对一专业服务</p>
          </div>
          
          <form>
            <input type="hidden" id="orderId" name="orderId"> 
            <input type="hidden" id="sourceType" name="sourceType" value="免费申请">
            <p><input class="inp" type="text" id="clientName" name="clientName" placeholder="您的姓名" data-title="您的姓名"></p>
            <p><input class="inp" type="text" id="phone" name="phone" placeholder="您的手机号" data-title="您的手机号"></p>
            <p><input class="inp" type="text"  id="address" name="address" placeholder="楼盘名称" data-title="楼盘名称"></p>
            <p><input class="inp" type="text"  id="acreage" name="acreage"  placeholder="房屋面积" data-title="房屋面积"></p>
            <p class=""><input type="button" onclick="bjbaoming();" class="sq" value="免费申请"></p>
            <p></p>
          </form>
        </div>
                        
        </div>
    </div>
   
  </div>
  <!--案例详情页  案例展示（大图） end-->

  <div class="list_alpic">
   <div class="clearfix"></div>
    <div class="list_per_al">
      <div class="list_title">
        <h3>${CurrentCase.caseHouseType }的其他案例</h3>
        <span><a href="">查看更多>></a></span>
      </div>
    
      <div class="list_al clearfix">
		<c:forEach items="${caseHouseTypeList }" var="cases" varStatus="status" begin="0" end="7">
	   <c:if test="${(status.index+1) % 4 != 0}" > 
      <dl>
        <div class="list_pic"><a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img src="${cases.caseThumbImg }" width="280" height="213" ></a></div>
        <dt><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}"><img src="${cases.designerPhotoImg }" width="70" height="70"></a></dt>
        <dd>
          <div class="list_info">
            <span><b style="color:#f39800">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
            <span>别墅&nbsp;|&nbsp;${cases.caseAcreage }&nbsp;|&nbsp;&nbsp;<b style="color:#f39800">${cases.caseMoney }万</b>起</span>
          </div>
        </dd>
      </dl>
      </c:if>
      <c:if test="${(status.index+1) % 4 == 0}">
		  <dl class="no_mar">
	        <div class="list_pic"><a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img src="${cases.caseThumbImg }" width="280" height="213" ></a></div>
	        <dt><a href="javascript:void(0)"><img src="${cases.designerPhotoImg }" width="70" height="70"></a></dt>
	        <dd>
	          <div class="list_info">
	            <span><b style="color:#f39800">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
	            <span>别墅&nbsp;|&nbsp;${cases.caseAcreage }&nbsp;|&nbsp;&nbsp;<b style="color:#f39800">${cases.caseMoney }万</b>起</span>
	          </div>
	        </dd>
	      </dl>
      </c:if>  	  		  	
	 </c:forEach>      
    </div>  
    </div>
    <div class="list_per_al">
       <div class="list_title">
        <h3>${CurrentCase.caseStyle }的其它案例</h3>
        <span><a href="">查看更多>></a></span>
       </div>
       <div class="list_al clearfix">
       	<c:forEach items="${caseStyleList }" var="cases" varStatus="status" begin="0" end="7">
      <c:if test="${(status.index+1) % 4 != 0}" > 
      <dl>
        <div class="list_pic"><a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img src="${cases.caseThumbImg }" width="280" height="213" ></a></div>
        <dt><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}"><img src="${cases.designerPhotoImg }" width="70" height="70"></a></dt>
        <dd>
          <div class="list_info">
            <span><b style="color:#f39800">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
            <span>别墅&nbsp;|&nbsp;${cases.caseAcreage }&nbsp;|&nbsp;&nbsp;<b style="color:#f39800">${cases.caseMoney }万</b>起</span>
          </div>
        </dd>
      </dl>
      </c:if>
      <c:if test="${(status.index+1) % 4 == 0}">
		  <dl class="no_mar">
	        <div class="list_pic"><a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img src="${cases.caseThumbImg }" width="280" height="213" ></a></div>
	        <dt><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}"><img src="${cases.designerPhotoImg }" width="70" height="70"></a></dt>
	        <dd>
	          <div class="list_info">
	            <span><b style="color:#f39800">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
	            <span>别墅&nbsp;|&nbsp;${cases.caseAcreage }&nbsp;|&nbsp;&nbsp;<b style="color:#f39800">${cases.caseMoney }万</b>起</span>
	          </div>
	        </dd>
	      </dl>
      </c:if>  	  	
     </c:forEach>  
      
    </div>  
      
    </div>
    




<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/fengge.js"></script>

<!--右侧悬浮 开始-->
<jsp:include page="../public/fastToTop.jsp"/>
<!--右侧悬浮 结束-->
<div class="layout">  

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
		
		  function bjbaoming(){
			 var orderId = $("#orderId").val(); 
			 var clientName= $("#clientName").val();
			 var phone= $("#phone").val();
			 var address= $("#address").val();
			 var acreage= $("#acreage").val();
			 var sourceType= $("#sourceType").val();
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
					type : "POST",
					dataType : "json",
					async: false,
					url : "${pageContext.request.contextPath}/saveOrder",
					data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType},
					success : function(data) {
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
				});  
		}
		</script>
<!--跳到顶部-->
 

</div>

<!-- /底部 -->
</div>	
</div>



<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!--footer end-->

<!--右侧悬浮 end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
