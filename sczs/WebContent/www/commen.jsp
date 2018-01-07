<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>装修常见问题-${cityCompany}三创装饰公司</title>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
	<meta name="description" content="${statScinterHomeSeoDesc.value }">
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css">
	<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
	<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
</head>

<body>

	<!--header start-->
	<div class="header">
		<jsp:include page="../public/head.jsp" />
		 <!--nav start-->
   <jsp:include page="../public/nav.jsp"/>
  <!-- nav end -->
	</div>
	<!--header end-->


	<div class="huodong_main w1180">
		<div class="list_position">
			您的当前位置：<a href="${ctx }/"> ${cityCompany}装修</a> > <a href=""> 三创服务</a>
		</div>
		<div class="list_huodong_title">
			<div class="cont_anli_title">
				<h3 class="">【常见问题】</h3>
			</div>
		</div>


		<div class="cjwt_left fl">
			<c:forEach items="${faqLists }" var="faq">

				<dl>
					<dt>
						<h3>${faq.faqDesc }</h3>
					</dt>
					<dd>

						${faq.faqAnswer }
						<p>
							创建时间:
							<fmt:formatDate value="${faq.createTime }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
					</dd>
				</dl>
			</c:forEach>
			<div class="clearfix"></div>
			<div class="list_page">
				<div class="Page clearfix">

					<c:if test="${page.pageNo > 1}">
						<a
							href="${pageContext.request.contextPath}/commen/p${page.pageNo-1 }">上一页</a>
					</c:if>
					<c:if test="${page.pageNo <= 1}">
						<a href="javascript:void(0);">上一页</a>
					</c:if>

					<c:forEach var="i" begin="1" end="${page.pageCount}">
						<a
							<c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if>
							href="${pageContext.request.contextPath}/commen/p${i }">&nbsp;${i}&nbsp;</a>
					</c:forEach>

					<c:if test="${page.pageNo < page.pageCount}">
						<a
							href="${pageContext.request.contextPath}/commen/p${page.pageNo+1 }">下一页</a>
					</c:if>
					<c:if test="${page.pageNo >= page.pageCount}">
						<a href="javascript:void(0);">下一页</a>
					</c:if>

					<a
						href="${pageContext.request.contextPath}/commen/p${page.pageCount }">最后一页</a>
					<span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount }
						页</span>
				</div>
			</div>
		</div>
		<div class="list_hd_right fr">
			<div class="anli_hxgh">
				<div class="anli_hxgh_title">
					<h3>免费申请户型规划</h3>
					<p>专业设计师提供全程一对一专业服务</p>
				</div>

				<form>
					<input type="hidden" id="orderId" name="orderId">
					<p>
						<input class="inp" type="text" id="clientName" name="clientName"
							placeholder="您的姓名" data-title="您的姓名">
					</p>
					<p>
						<input class="inp" type="text" id="phone" name="phone"
							placeholder="您的手机号" data-title="您的手机号">
					</p>
					<p>
						<input class="inp" type="text" id="address" name="address"
							placeholder="楼盘名称" data-title="楼盘名称">
					</p>
					<p>
						<input class="inp" type="text" id="acreage" name="acreage"
							placeholder="房屋面积" data-title="房屋面积">
					</p>
					<p class="">
						<input type="button" onclick="bjbaoming();" class="sq"
							value="免费申请">
					</p>
					<p>
						<input type="hidden" class="index-input-03" id="sourceType"
							name="sourceType" value="免费申请" />
					</p>
				</form>
			</div>


			<div class="ej_tjwz">
				<h3>推荐文章</h3>

				<ul>
					<c:forEach items="${newsList }" var="news" begin="0" end="6">
						<li><span></span> <a
							href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">${news.title }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<!--footer start-->
	<jsp:include page="../public/fotter.jsp"/>
	<!--footer end-->
	<!--右侧悬浮 开始-->
	<jsp:include page="../public/fastToTop.jsp" />
	<!--右侧悬浮 结束-->
	<script type="text/javascript">
		function bjbaoming() {

			var now = new Date();
			var year = now.getFullYear();
			var month = (now.getMonth() + 1).toString();
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
			var dateTime = year + month + day + hour + minute + second + ms;
			$("#orderId").val(dateTime);
			
			var orderId = $("#orderId").val(); 
			var clientName = $("#clientName").val();
			var phone = $("#phone").val();
			var address = $("#address").val();
			var acreage = $("#acreage").val();
			var sourceType = $("#sourceType").val();
			var branchCompany = '${sessionScope.branchCompany}';
			console.info("branchCompany"+branchCompany+"acreage:"+acreage+"sourceType:"+sourceType+"orderId:"+orderId+"clientName:"+clientName+"phone:"+phone+"address:"+address);
			if (clientName.match(/^\d*$/)) {
				alert('请填写正确的姓名');
				return false;
			} else if (!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)) {
				alert('请填写11位号码');
				return false;
			} else if (acreage == '') {
				alert('请填写面积');
				return false;
			}
			console.info("you are running...");
			$.ajax({
				type : "POST",
				dataType : "json",
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
	${sessionScope.statistics.value } ${sessionScope.shangqiao.value }
</body>
</html>
