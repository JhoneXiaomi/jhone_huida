<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %> 
<%@ include file="public/shangqiao.jsp" %>  
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>年底立项|石家庄装修公司|石家庄装饰公司|石家庄装修公司排名|新洲装饰怎么样|全包装修|老房装修|新房装修</title>
	<meta name="keywords" content="石家庄装修公司、全国十大装饰公司之一、老房装修专家、家装套餐公司、整装装饰公司、全包装修、半包装修、整装套餐、新洲装饰怎么样"/>
	<meta name="description" content="石家庄新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
</head>
<body>
<div class="sjzxz">
  
   <div class="sjzxz_img">
   
   	 <img src="${ctx }/www/images/sjz/sjzxz_01.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_02.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_03.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_04.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_05.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_06.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_07.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_08.jpg"/>
   	 <img src="${ctx }/www/images/sjz/sjzxz_09.jpg"/>
   	 <a href="http://www.xz27800.com"><img src="${ctx }/www/images/sjz/sjzxz_10.jpg"/></a>
   <%--   <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_01.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_02.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_03.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_04.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_05.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_06.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_07.png"/></a>
     <a href="${ctx }/"><img src="${ctx }/www/images/sjz_xq_08.png"/></a> --%>
   </div>
   
  <%--  <div class="sjzxz_po">
    
    <img src="${ctx }/www/images/sjz_xq_09.png"/>
     <div class="sjz_float">
      <h3>已报名用户</h3>
       <div id="FontScroll">
        <ul>
          <li><a href="javacript:void(0)">182****1552已成功报名</a></li>
          <li><a href="javacript:void(0)">150****3453已成功报名</a></li>
          <li><a href="javacript:void(0)">187****2520已成功报名</a></li>
          <li><a href="javacript:void(0)">188****3985已成功报名</a></li>
          <li><a href="javacript:void(0)">180****9259已成功报名</a></li>
          <li><a href="javacript:void(0)">181****2127已成功报名</a></li>
          <li><a href="javacript:void(0)">150****3453已成功报名</a></li>
          <li><a href="javacript:void(0)">187****2520已成功报名</a></li>
          <li><a href="javacript:void(0)">188****3985已成功报名</a></li>
          <li><a href="javacript:void(0)">180****9259已成功报名</a></li>
          <li><a href="javacript:void(0)">181****2127已成功报名</a></li>
        </ul>
       </div>
     
       <div class="biaodan_info">
       
	          姓名：<input type="text" name="clientName" class="baodan_name"/>
	          电话：<input type="text" name="phone" class="baodan_tel"/>
	          楼盘：<input type="text" name="address" class="baodan_lp"/>
       	面积：<input type="text" name="acreage" class="baodan_mj"/>
             <input type="button" name="_subBut" class="cjhd" value="参加活动">
       </div>
     </div>
     
   </div> --%>
   
   <%-- <div class="sjzxz_img">
	   <a href="${ctx }/">
	     <img src="${ctx }/www/images/sjz_xq_10.png"/>
	   </a>  
   </div> --%>
	   
	<script src="${ctx }/www/js/jquery.min.js"></script>
	<script>
	
		$("input[name='_subBut']").click(function(){
			
			var orderId = getOrderId();
			var clientName = $("input[name='clientName']").val();
			var phone = $("input[name='phone']").val();
			var address = $("input[name='address']").val();
			var acreage = $("input[name='acreage']").val();
			var branchCompany= "${sessionScope.branchCompany}";
			
			console.info("address"+address,"orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/saveOrder",
						data : {'address':address,'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
						success : function(data) {
							if (data.data == "ok") {
								alert("请您稍等，稍后会有客服人员为您服务!");
							}else{
								alert("保存失败");
							}
						}
					});  
			 }else if(clientName.match(/^\s*$/)){
				 alert("对不起,请正确填写姓名!");
			 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 alert("对不起，请正确填写电话格式!");
			 }else if(acreage.match(/^\s*$/)){
				 alert("对不起,请填请正确天填写房屋面积!");
			 }
		});	
	
		(function($){
		    $.fn.FontScroll = function(options){
		        var d = {time: 2000,s: 'fontColor',num: 1};
		        var o = $.extend(d,options);
		        
		
		        this.children('ul').addClass('line');
		        var _con = $('.line').eq(0);
		        var _conH = _con.height(); //滚动总高度
		        var _conChildH = _con.children().eq(0).height();//一次滚动高度
		        var _temp = _conChildH;  //临时变量
		        var _time = d.time;  //滚动间隔
		        var _s = d.s;  //滚动间隔
		
		
		        _con.clone().insertAfter(_con);//初始化克隆
		
		        //样式控制
		        var num = d.num;
		        var _p = this.find('li');
		        var allNum = _p.length;
		
		        _p.eq(num).addClass(_s);
		
		
		        var timeID = setInterval(Up,_time);
				this.hover(function(){clearInterval(timeID)},function(){timeID = setInterval(Up,_time);});
		
		        function Up(){
		            _con.animate({marginTop: '-'+_conChildH});
		            //样式控制
		            _p.removeClass(_s);
		            num += 1;
		            _p.eq(num).addClass(_s);
		            
		            if(_conH == _conChildH){
		                _con.animate({marginTop: '-'+_conChildH},"normal",over);
		            } else {
		                _conChildH += _temp;
		            }
		        }
		        function over(){
		            _con.attr("style",'margin-top:0');
		            _conChildH = _temp;
		            num = 1;
		            _p.removeClass(_s);
		            _p.eq(num).addClass(_s);
		        }
		    };
		})(jQuery);
		
		$('#FontScroll').FontScroll({time: 2000,num: 1});
	</script>
	<script>
	
		// cnzz
		var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
		document.write(unescape("%3Cspan id='cnzz_stat_icon_1259586357'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1259586357%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));

	</script>
	<script language=javascript>
		var LiveAutoInvite0='您好，来自%IP%的朋友';
		var LiveAutoInvite1='来自首页的对话';
		var LiveAutoInvite2=' 网站商务通 主要功能：<br>1、主动邀请<br>2、即时沟通<br>3、查看即时访问动态<br>4、访问轨迹跟踪<br>5、内部对话<br>6、不安装任何插件也实现双向文件传输<br><br><b>如果您有任何问题请接受此邀请以开始即时沟通</b>';
	</script>
	<script language="javascript" src="http://pht.zoosnet.net/JS/LsJS.aspx?siteid=PHT90969211&float=1&lng=cn"></script>


	

<script type="text/javascript">
</script>
</div>

</body>
</html>
