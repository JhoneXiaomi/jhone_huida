<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>      
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<meta name="keywords" content="${scinterPackageSeoKeyword.value }">
<meta name="description" content="${scinterPackageSeoDesc.value }">
<title>${scinterPackageSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
  <!-- 代码 开始 -->
   <div class="mMain"> 
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 装修案例 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="javascript:void(0)">装修案例</a></div>
    </div>
  
    <div class="clear"></div>
  <div class="mTaocan">
    <img src="${ctx }/mobile/images/bdsc/bdsc398_01.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_02.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_03.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_04.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_05.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_06.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_07.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_08.jpg"/>
    <img src="${ctx }/mobile/images/bdsc/bdsc398_09.jpg"/>
    
    <div class="mb"></div>
  </div>
  
    
    
  </div>
<!-- 代码 结束 -->
<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
<script src="${ctx }/mobile/js/slide.js"></script>

</div>

<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
<script language="javascript">
	var LiveAutoInvite0='您好，来自%IP%的朋友';
	var LiveAutoInvite1='来自首页的对话';
	var LiveAutoInvite2=' 网站商务通 主要功能：<br>1、主动邀请<br>2、即时沟通<br>3、查看即时访问动态<br>4、访问轨迹跟踪<br>5、内部对话<br>6、不安装任何插件也实现双向文件传输<br><br><b>如果您有任何问题请接受此邀请以开始即时沟通</b>';
	</script>
	<script language="javascript" src="http://pht.zoosnet.net/JS/LsJS.aspx?siteid=PHT90969211&float=1&lng=cn"></script>

</body>
</html>
