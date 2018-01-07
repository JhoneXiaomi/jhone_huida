<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>   
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no" />
	<title>${statScinterHomeSeoTitle.value }</title>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script>
</head>

<body>
	<div class="neiye-top">快速报价<div class="neiye-fanhui"><a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a></div></div>
	
	<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="javascript:void(0)">快速报价</a></div>
	
	<form class="ksbj-form" action="" method="post">
	    <input type="text" name="clientName" placeholder="业主姓名" class="ksbj-text ksbj-name">
	    <input type="text" name="phone" placeholder="联系手机" class="ksbj-text ksbj-name" >
	    <input type="text" name="address" placeholder="楼盘地址" class="ksbj-text ksbj-name" >
	    <div class="ksbj-size">
	      <input type="text" name="acreage" placeholder="房屋面积" class="ksbj-text ksbj-name">
	      <span class="danwei">平方米</span>
	    </div>
	    
	    <div class="sex">
	      业主性别：<input type="radio" name="sex" id="sexMan" class="sex_yz" value="男"/>男
      		 <input type="radio" name="sex" id="sexWomen" class="sex_yz" value="女"/>女
	    </div>
	    
	   
	   <div class="huxing">您的户型：<select id="houseType">
		        	<option value="无" class="huxing_val">====请选择====</option>
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
	            </div>
	            
	             <div class="huxing">装修风格：<select id="style">
	                <option value="无">====请选择====</option>
		        	<option value="现代简约">现代简约</option>
		        	<option value="经典欧式">经典欧式</option>
		        	<option value="中式风格">中式风格</option>
		        	<option value="乡村田园">乡村田园</option>
		        	<option value="地中海">地中海</option>
		        	<option value="淡雅时光">淡雅时光</option>
		        	<option value="美式乡村">美式乡村</option>
		        	<option value="其他">其他</option>
		        </select>
	            </div>
	            
	            <div class="huxing">约设计师：<select id="designer" >
	            
	 				<option value="">====请选择====</option>
	                <c:forEach items="${designerList }" var="designer">
	                		<option value="${designer.designerName }">${designer.designerName }</option>
	                </c:forEach>	                
		        </select>
	            </div>
	            
	     		<input id="checkBut"  type="button" value="提交" class="ksbj-tijiao">
	</form>
	
	
 	<!-- fotter begin -->
 		<jsp:include page="public/fotter.jsp"/>
 	<!--  fotter end -->
	
	<script type="text/javascript">

		/* 选中默认的设计师 */
		var designerName = '${designerName}';
		$("#designer").val(designerName);
		
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
		$("#checkBut").bind("click",function(){
			
			 var orderId = dateTime;
			 var clientName= $("input[name='clientName']").val();
			 var phone= $("input[name='phone']").val();
			 var address= $("input[name='address']").val();
			 var acreage= $("input[name='acreage']").val();
			 var sex = $("input[name='sex']").val();
			 var houseType = $("#houseType").val();
			 var style = $('#style').val();
			 var designer = $("#designer").val();
			 var branchCompany = "${branchCompany}";
			 var sourceType= "快速报价(手机站)";
			 
			 if(clientName.match(/^\s*$/)){
				 alert("用户名不能为空，请填写用户名!");
				 return false;
			 }
			 if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 alert("手机号格式不正确，请重新填写手机号!");
				 return false;
			 }
			 $.ajax({
					type : "POST",
					dataType : "json",
					url : "${pageContext.request.contextPath}/MsaveOrder",
					data : {'branchCompany':branchCompany,'style':style,'houseType':houseType,'sex':sex,'designer':designer,'sourceType':sourceType,'acreage':acreage,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage},
					success : function(data) {
						if (data.data == "ok") {
							alert("您的订单已经提交成功，稍后会将有工作人员联系你！");
						}else{
							alert("保存失败");
						}
					}
				});  
			
		});
	</script>
</body>
</html>