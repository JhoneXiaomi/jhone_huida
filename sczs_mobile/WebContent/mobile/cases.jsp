<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="${scinterCasesSeoKeywordStr.value }">
<meta name="description" content="${scinterCasesSeoDescStr.value }">
<title>${scinterCasesSeoTitleStr.value }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script type="text/javascript" src="${ctx }/mobile/js/ejjz.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">

   <!--主体部分 start-->
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【装修案例】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="${ctx }/cases">装修案例</a></div>
    </div>
    
    <div class="clear"></div>
    <div class="mList_al_con">
      <ul>
      	<c:forEach items="${casesList }" var="cases" varStatus="status" begin="0" end="${CasesNum }">
      	
      	    <c:if test="${(status.index+1) % 2 != 0}">
			<li class="ri">
			   <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	           <img src="${cases.caseThumbImg}" style="width: 100%;height: 118px;">
	           </a>
	           <div class="mList_info">
	             <h4>${cases.caseTitle }</h4>
	             <div class="p"><p class="pR fl">${cases.caseStyle }</p> <p class="pB fr"><a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${cases.designerId}">${cases.caseDesigner }</a></p></div>
	           </div>
	        </li>   
	        </c:if>  
	        <c:if test="${(status.index+1) % 2 == 0}">
			<li class="le">
			   <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	           <img src="${cases.caseThumbImg}" style="width: 100%;height: 118px;">
	           </a>
	           <div class="mList_info">
	             <h4>${cases.caseTitle }</h4>
	             <div class="p"><p class="pR fl">${cases.caseStyle }</p> <p class="pB fr"><a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${cases.designerId}">${cases.caseDesigner }</a></p></div>
	           </div>
	        </li>   
	        </c:if>  		
      	</c:forEach>
      	
       </ul>
      
    </div>
    
     <div  id="moreNum" class="jz_more"><input class="btn btn-red btn-lg" type="button" value="加载更多"/></div>
  </div>
  <!--主体部分  end-->
  

<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
<script>
var CasesNum = '${CasesNum }';
var totalNums = '${totalNums }';
if(parseInt(CasesNum) >= parseInt(totalNums)){
	$("#moreNum").remove();
}
	$("#moreNum").bind("click",function(){
		
		if(parseInt(CasesNum) < parseInt(totalNums)){
			CasesNum = '${CasesNum +6 }';
			window.location.href = "${pageContext.request.contextPath}/cases?CasesNum="+CasesNum;
		}
		
	});
</script>
</body>
</html>
