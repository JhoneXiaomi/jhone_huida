<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

	<div class="head">
	  <div class="head_top">
	    <div class="w1200">
	      <div class="head_top01 fl">当前站&nbsp;<span id="CurrCompany" style="color:#008cd6;"></span>
	     		&nbsp;新洲装饰全国分站：
		      	<a href="http://www.xz27800.com" rel="nofollow" target="_blank">北京</a>&nbsp;
				<a href="http://bd.xz27800.com" rel="nofollow">保定</a>&nbsp;
				<a href="http://sjz.xz27800.com" rel="nofollow">石家庄</a>&nbsp;
				<a href="http://ty.xz27800.com" rel="nofollow">太原</a>&nbsp;
				<a href="http://www.0531zhuangshi.com" rel="nofollow">济南</a>&nbsp; 
				<a href="http://www.xzzstj.com" rel="nofollow">天津</a>&nbsp;
				<a href="http://lf.xz27800.com" rel="nofollow">廊坊</a>&nbsp;
				<a href="http://ts.xz27800.com" rel="nofollow">唐山</a>&nbsp;
				<a href="http://cz.xz27800.com" rel="nofollow">沧州</a>&nbsp; 
				<a href="http://zz.xz27800.com" rel="nofollow">郑州</a>&nbsp;
				<!-- <a href="http://hf.xz27800.com" rel="nofollow">合肥</a>&nbsp;
				<a href="javascript:void(0)" rel="nofollow">重庆</a> -->
	      </div>
	      <div class="head_top02 fr">◎ 京城百姓信赖品牌家装公司 ◎ 室内装饰协会理事单位 </div>
	    </div>
	  </div>
	  <div class="head_bottom w1200">
	      
	    <div class=""> 
	     <div class="head_logo fl"><a href="${ctx }/"><img src="${homeLogo.value}"  id="where" width="600" height="120"/></a></div>
	      <!--search start-->
	     <%-- <div class="head_search fl">
	       <div class="search_1">
	          <form action="${ctx }/cases/p1">
	            <input type="text" class="search_put" name="key" placeholder="搜索案例" />
	            <input type="submit" class="search_sub" value="搜索" />
	          </form>
	       </div>
	       
	       <div class="search_2">
	         热门搜索：
	         <a href="${ctx }/cases/p1?key=简约"> 简约 &nbsp;|</a>
	         <a href="${ctx }/cases/p1?key=欧式"> 欧式 &nbsp;|</a>
	         <a href="${ctx }/cases/p1?key=怀旧"> 怀旧 &nbsp;|</a>
	         <a href="${ctx }/cases/p1?key=乡村"> 乡村 &nbsp;|</a>
	       </div>
	     </div> --%>
	    <!--search end-->
	    <div class="head_yy head_tel fl">
           <span>工商执照</span>
           <p><a href="${ctx}/businessLicense.jsp"><img src="${ctx }/www/images/national_emblem_light.png"/></a></p>
         </div>
	     <div class="head_tel fr">
	       <span>全国免费咨询电话</span>
	       <p>${homeTp.value }</p>
	     </div>
	     </div>
	     
	  </div>
	</div>
	<script type="text/javascript">
	 var currentBCompany = '${branchCompany}';
	    if(currentBCompany=='bjxz'){
	    	$("#CurrCompany").text('北京站');
	    	$("#where").attr("alt","北京新洲家装公司");
	    }
	    if(currentBCompany=='tjxz'){
	    	$("#CurrCompany").text('天津站');
	    	$("#where").attr("alt","天津新洲家装公司");
	    }
	    if(currentBCompany=='lfxz'){
	    	$("#CurrCompany").text('廊坊站');
	    	$("#where").attr("alt","廊坊新洲家装公司");
	    }
	    if(currentBCompany=='sjzxz'){
	    	$("#CurrCompany").text('石家庄站');
	    	$("#where").attr("alt","石家庄新洲家装公司");
	    }
	    if(currentBCompany=='tsxz'){
	    	$("#CurrCompany").text('唐山站');
	    	$("#where").attr("alt","唐山新洲家装公司");
	    }
	    if(currentBCompany=='bdxz'){
	    	$("#CurrCompany").text('保定站');
	    	$("#where").attr("alt","保定新洲家装公司");
	    }
	    if(currentBCompany=='cqxz'){
	    	$("#CurrCompany").text('重庆站');
	    	$("#where").attr("alt","重庆新洲家装公司");
	    }
	    if(currentBCompany=='hfxz'){
	    	$("#CurrCompany").text('合肥站');
	    	$("#where").attr("alt","合肥新洲家装公司");
	    }
	    if(currentBCompany=='jnxz'){
	    	$("#CurrCompany").text('济南站');
	    	$("#where").attr("alt","济南新洲家装公司");
	    }
	    if(currentBCompany=='tyxz'){
	    	$("#CurrCompany").text('太原站');
	    	$("#where").attr("alt","太原新洲家装公司");
	    }
	    if(currentBCompany=='zzxz'){
	    	$("#CurrCompany").text('郑州站');
	    	$("#where").attr("alt","郑州新洲家装公司");
	    }
	    if(currentBCompany=='czxz'){
	    	$("#CurrCompany").text('沧州站');
	    	$("#where").attr("alt","沧州新洲家装公司");
	    }
	    if(currentBCompany=='hfxz'){
	    	$("#CurrCompany").text('合肥站');
	    	$("#where").attr("alt","合肥新洲家装公司");
	    }
	</script>
</body>
</html>