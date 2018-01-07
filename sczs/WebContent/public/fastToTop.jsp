<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

<!--右侧悬浮 开始-->
<div class="floating_ck">
	<dl>
    	<dt></dt>
        <dd class="quote">
           
           		<c:if test="${branchCompany == 'bjsc'}">
				  	<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"> <span>在线咨询</span></a>
				</c:if> 
				<c:if test="${branchCompany == 'tssc'}">
				   	<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if> 
				<c:if test="${branchCompany == 'tjsc'}">
				   	<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if> 
				<c:if test="${branchCompany == 'lfsc'}">
				   	<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if> 
				<c:if test="${branchCompany == 'sjzsc'}">
				 	<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if>
				<c:if test="${branchCompany == 'bdsc'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if> 
				<c:if test="${branchCompany == 'hssc'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if> 
				<c:if test="${branchCompany == 'tysc'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><span>在线咨询</span></a>
				</c:if>  
				
            <div class="floating_left">
            
	            <c:if test="${branchCompany == 'bjsc'}">
				  	 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if> 
				<c:if test="${branchCompany == 'tssc'}">
				  <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if> 
				<c:if test="${branchCompany == 'tjsc'}">
				   <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if> 
				<c:if test="${branchCompany == 'lfsc'}">
				   <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if> 
				<c:if test="${branchCompany == 'sjzsc'}">
				 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if>
				<c:if test="${branchCompany == 'bdsc'}">
				<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"> 点击立即咨询 </a>
				</c:if> 
				<c:if test="${branchCompany == 'hssc'}">
				 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if> 
				<c:if test="${branchCompany == 'tysc'}">
				 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">点击立即咨询</a>
				</c:if>  
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
               <p class="qrcord_p02">全国免费服务热线<br><b>${sessionScope.homeTp.value }</b></p>
            </div>
        </dd>
        <dd class="return">
        	<span onClick="gotoTop();return false;">返回顶部</span>
        </dd>
    </dl>
</div>
<!--右侧悬浮 结束-->
</body>
</html>