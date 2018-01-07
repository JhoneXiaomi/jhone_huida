<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${rbwhomeSeoKeyword.value }"/>
<meta name="description" content="${rbwHomeSeoDesc.value }"/>
<title>${rbwHomeSeoTitle.value }</title>
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
       <div class="ej_weizhi_left fl"><span>O</span>NLINE ORDER &nbsp;在线订单</div>
       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">在线订单</a></div>
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
          	<c:forEach items="${casesList }" var="cases" begin="0" end="1">
          	 <li>
	          	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	          	 	<img src="${cases.caseThumbImg }" width="240" height="180"/>
	          	 </a>
	          <%-- 	 <span>${cases.caseTitle }</span> --%>
          	 </li>
          	</c:forEach>
          </ul>
        </div>
  </div>
  <div class="ej_news_right fr">
     
     
    <div class="Column-L">
    <div class="bigTitle">在线订单</div>
    
    <div class="postForm" id="postForm">
	<form method="post" action="?c=post&f=setok&module_id=119" onsubmit="return to_submit('postForm');">
	    <input type="hidden" id="branchCompany" name="branchCompany"  value="${myBranchCompany }"/>
		<input type="hidden" id="orderId" name="orderId"/>
	    <div class='table ext cls_contact'>
          <div class='left'><span class='red'>*</span> 业主姓名：</div>
          <div class='right'>
             <div>
             <table cellpadding='0' cellspacing='0'>
             <tr>
             <td> <input type='text' class='input-text' name='clientName' id='clientName' style='width:100px;'/> </td>
             <td class='clue_on'>&nbsp;请填写您的姓名</td></tr></table>
             </div>
          </div>
        <div class='clear'></div>
	    </div>	   
         <div class='table ext cls_sex'>
         <div class='left'>
         <span class='red'>*</span> 业主性别：</div>
         <div class='right'><div>
	         <table cellpadding='0' cellspacing='0'>
		         <tr>
		         <td>
			         <table cellpadding='0' cellspacing='0'>
				         <tr>
					         <td><input type='radio' name='sex' value='男'  id="sexMan"/> 男 &nbsp; </td>
					         <td><input type='radio' name='sex' value='女' id="sexWomen" /> 女 &nbsp; </td>
				         </tr>
		         	</table>
	         	</td>
	         	</tr>
	         </table>
         </div>
         </div>
         <div class='clear'></div></div>	    
         
         <div class='table ext cls_phone'>
         <div class='left'>
         <span class='red'>*</span> 联系手机：</div>
         <div class='right'> <div>
         <table cellpadding='0' cellspacing='0'><tr>
         <td><input type='text' class='input-text' name='phone' id='phone' style='width:150px;'/></td>
         <td class='clue_on'>&nbsp;请您填写手机号码，我们会保护您的隐私</td>
         </tr></table></div></div>
         <div class='clear'></div></div>
         	    
         <div class='table ext cls_addr'><div class='left'>楼盘地址：</div>
         <div class='right'><div><table cellpadding='0' cellspacing='0'><tr>
         <td><input type='text' class='input-text' name='address' id='address' style='width:350px;'/></td>
         <td class='clue_on'>&nbsp;填写详细楼盘或地址</td></tr></table></div></div>
         <div class='clear'></div></div>
         
         <div class='table ext cls_area'><div class='left'>使用面积：</div>
         <div class='right'><div><table cellpadding='0' cellspacing='0'><tr>
         <td><input type='text' class='input-text' name='acreage' id='acreage' style='width:100px;'/></td>
         <td class='clue_on'>&nbsp;平方米</td></tr></table></div></div>
         <div class='clear'></div></div>	   
         
         <div class='table ext cls_cost'><div class='left'>装修预算：</div>
         <div class='right'><div><table cellpadding='0' cellspacing='0'><tr>
         <td><input type='text' class='input-text' name='budget' id='budget' style='width:100px;'/></td>
         <td class='clue_on'>&nbsp;万元</td></tr></table></div></div>
         <div class='clear'></div></div>	   
         
         <div class='table ext cls_unit'>
         <div class='left'>您的户型：</div>
         <div class="right"><div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tbody><tr>
        <td>
	        <select id="houseType">
	        	<option value="">===请选择===</option>
	        	<option value="一居">一居</option>
	        	<option value="两居">两居</option>
	        	<option value="三居">三居</option>
	        	<option value="多居">多居</option>
	        	<option value="复式">复式</option>
	        	<option value="别墅">别墅</option>
	        	<option value="洋房">洋房</option>
	        	<option value="会所">会所</option>
	        	<option value="其他">其他</option>
	        </select>
        </td>
        
        <td id="_opt_parent_unit"></td>
        <td id="_opt_son_unit" style="padding-left:3px;"></td>
        </tr>
        </tbody></table>
        </div>
        </div>
         
         
         <div class='clear'></div></div>	   
         
          <div class='table ext cls_dstyle'><div class='left'>装修风格：</div>
          <div class="right"><div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tbody><tr>
        <td>
            <select id="style">
                <option value="无">===请选择===</option>
	        	<option value="现代简约">现代简约</option>
	        	<option value="经典欧式">经典欧式</option>
	        	<option value="中式风格">中式风格</option>
	        	<option value="乡村田园">乡村田园</option>
	        	<option value="地中海">地中海</option>
	        	<option value="淡雅时光">淡雅时光</option>
	        	<option value="美式乡村">美式乡村</option>
	        	<option value="其他">其他</option>
	        </select>
        </td>
        <td id="_opt_parent_dstyle"></td>
        <td id="_opt_son_dstyle" style="padding-left:3px;"></td>
        </tr>
        </tbody></table>
        </div>
        </div>
          
          
          <div class='clear'></div></div>	    
         
         
         
         <div class='table ext cls_designer'><div class='left'>预约设计师：</div>
         
         <div class="right">
        <div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tbody><tr>
        <td>
         <select id="designer">
                <option value="">===请选择===</option>
				  <c:forEach items="${designerList }" var="designer">
                	<option value="${designer.designerName }">${designer.designerName }</option>
                 </c:forEach>	
	        </select>
        </td>
        <td id="_opt_parent_designer"></td>
        <td><span id="designer_tmp_show" class="stips"></span></td>
        </tr>
        </tbody></table>
        </div>
        </div>
        <div class='clear'></div></div>	    
        <div class='table ext cls_content'><div class='left'>
        <span class='red'>*</span> 装修要求：</div>
        <div class='right'><div><table cellpadding='0' cellspacing='0'><tr>
        <td><textarea class='input-text' style='width:350px;height:80px' name='note' id='note'></textarea></td>
        </tr></table></div></div><div class='clear'></div></div>	    
       <!--  <div class='table ext cls_dtime'><div class='left'>动工时间：</div>
        <div class='right'><div>
	        <table cellpadding='0' cellspacing='0'><tr>
		        <td><input type='text' class='input-text' name='dtime' id='dtime'  value='' style='width:150px;'/></td>
		        <td class='clue_on'>&nbsp;请输入预计动工时间</td></tr>
	        </table>
	        </div>
	    </div> -->
	    <div class='clear'></div></div>		
        <div class="table">
	    <div class="right">
	</div>
</div>
	<div class="table">
		<div class="left">&nbsp;</div>
      <div class="right1">
      <input type="button" class="button" id="_phpok_submit" onclick="online();" value="确认提交 "/>
      </div>
	</div>
</form>
</div>
	<script type="text/javascript" src="http://www.wtzs.cc/minify?f=tpl/www/images/js/php.js"></script>
	<script type="text/javascript">
	phpjs_parent_opt('','unit','11907');phpjs_parent_opt('','dstyle','11908');phpjs_parent_bemod('','designer','11909');
	
	</script>
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

		var designerName='${designerName}';
		$("#designer").val(designerName);
		/* 默认选中性别 */
		var designerSex = '${designerSex}';
		if(designerSex =='男' ){
			$("#sexMan").attr("checked",true);
		}else{
			$("#sexWomen").attr("checked",true);
		}
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
		/* 在线订单的 */
		function online() {
		    var orderId = $("#orderId").val();
		    var clientName = $('input[name=clientName]').val();
		    var sex = $('input[name=sex]').val();
		    var phone = $('#phone').val();
		   // var startDate = $('input[name=startDate]').val();,'startDate':startDate
		    var designer = $('#designer').val();
		    var budget= $('input[name=budget]').val();
		    var acreage  = $('#acreage').val();
		    var address = $('input[name=address]').val();
		    var houseType = $('#houseType').val();
		    var style = $('#style').val();
		    var note = $('#note').val();
		    var branchCompany = '${branchCompany}';
		    sourceType= "在线订单";
		    if(clientName!="" && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 $.ajax({
						type : "POST",
						dataType : "json",
						async: false,
						url : "${pageContext.request.contextPath}/saveOrder",
						data : {'phone':phone,'branchCompany':branchCompany,'acreage':acreage,'sourceType':sourceType,'acreage':acreage,'orderId':orderId,'sex':sex,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'budget':budget,'houseType':houseType,'style':style,'designer':designer,'note':note},
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
		
		function freeOnline(){
			    var orderId = $("#orderId").val();
			    var clientName = $('input[name=freeClientName]').val();
			    var phone = $('#freePhone').val();
			    var acreage  = $('#freeAcreage').val();
			    var address = $('input[name=freeAddress]').val();
			    var style = $('#freeStyle').val();
			    var branchCompany = '${branchCompany}';
			    var sourceType= "在线订单";
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
