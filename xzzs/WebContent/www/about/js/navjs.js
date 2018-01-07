

var isHomePage = '';
$(function(){
	var nickName = '';
	nickName = nickName.substring(0,3)+"****"+nickName.substring(7,11);
	$("#topNickName").html(nickName)
	/**设置全局的ajax请求*/
	$.ajaxSetup({  
		beforeSend:function(xhr){
			//showloading();
		},
	    complete:function(xhr, textStatus) {  
	    	hideloading();
	    }  
	}); 
});
/**显示动画*/
function showloading(){
	$("body").addClass("m-loading");
}
/**隐藏动画*/
function hideloading(){
	$("body").removeClass("m-loading");
}
	var first_delimiters='|';
	var second_delimiters='__';
	var default_value='0';
	var categoryId='';
	//回显数据
	function initPageData(){
		//回显选中的搜索框的下拉列表
		var pathName = window.location.pathname;
		$('.effectPicture a').each(function(){
			var $a = $(this);
			if(pathName == $a.attr('codeUrl')){
				$('#searchFormId').attr({"action":$a.attr("codeUrl")});
				var codeKeywords = $a.attr("codeKeywords");
				$('#searchFormId').find('input[codeKeywords=codeKeywords]').attr({"name":codeKeywords});
				console.log('codeKeywords: ',$('input[name="'+codeKeywords+'"]'));
				var $codeKeywordsInput = $('input[name="'+codeKeywords+'"]');
				if($codeKeywordsInput.length > 1){
					$('input[name=searchWords]').val($codeKeywordsInput[1].value);
				}
				var $div = $('.showSubMenu');
				var contents = $div.contents();
				for(var i = 0; i<contents.length;i++){
					if(contents[i].nodeType == 3){
						contents[i].nodeValue = $a.text();
						break;
					}
				}
				return false;
			}
		});
		//回显筛选项数据
		var $sortDiv=$('div.sort');
		var sortName='';
		var sortType='';
		if(sortName=='goodsPrice'){
			var $price=$sortDiv.find('a.price');
			if(sortType=='desc'){
				$price.addClass('down');
			}else if(sortType=='asc'){
				$price.addClass('up');
			}else{
				$price.addClass('down');
			}
		}else if($.trim(sortName).length>0){
			$sortDiv.find('a[sortNameCode='+sortName+']').addClass('active');
		}else{
			$('a[sortNameCode=multiSort]').addClass('active');
		}
		//回显产品分类目录
		if($.trim(categoryId).length>0){
			var $dd=$('dd[categoryId='+categoryId+']');
			var $dt=$('dt[categoryId='+categoryId+']');
			if($dd.size()>0){
				$dd.addClass('active');
				$dd.closest('dl').addClass('active');
			}else if($dt.size()>0){
				$dt.closest('dl').addClass('active');
			}
		}
    }
	//处理搜索的form表单的提交
	function dealSearch(){
		var $searchForm=$('#searchFormId');
		var $selectList=$('ul.select_list');
		var $aList=$selectList.find('li');
		
		var action=$searchForm.attr('action');
		//处理搜索关键词
		var keywords=$('input[name=searchWords]').val();
		$searchForm.find('input[name=keywords]').val(keywords);
		//处理搜索选项
		if($aList.size()>0){
			for(var i=0;i<$aList.size();i++){
	    		$searchForm.append("<input type='hidden' name='filters' value='"+$($aList[i]).attr('attrAndOptionName')+"'/>");
			}
		}
		//处理排序的问题
		var $sortDiv=$('div.sort');
		var $price=$sortDiv.find('a.price');//商品价格排序的考虑
		var $a=$sortDiv.find('a.active');
		var sortName="";
		var sortType="";
		if($price.hasClass("up")){
			sortName='goodsPrice';
			sortType='asc';
		}else if($price.hasClass('down')){
			sortName='goodsPrice';
			sortType='desc';
		}else if($a.attr('sortCode')=='sortCode'){
			sortName=$a.attr('sortNameCode');
			sortType='desc';
		}
		if($.trim(sortName).length>0){
			$searchForm.find('input[name=sortName]').val(sortName);
			$searchForm.find('input[name=sortType]').val(sortType);
		}
		//产品分类的处理
		var $selectedDd=$('#js_menuList dd.active');//最小分类选中的情况
		if($selectedDd.size()==1){
			categoryId=$selectedDd.attr('categoryId');
			$searchForm.find('input[name=categoryId]').val(categoryId);
		}
		//移除为空的input元素
		$searchForm.find('input[value=""]').remove();
		$searchForm.submit();
	}
	//用于搜索引擎
	$(function(){
		//回显数据
		initPageData();
		//搜索按钮点击事件
		$('#searchBtn').on('click',function(){
			showloading();
			var $searchForm=$('#searchFormId');
			//处理搜索关键词
			var keywords=$('input[name=searchWords]').val();
			$searchForm.find('input[codeKeywords=codeKeywords]').val(keywords);
			dealSearch();
		});
		//悬浮搜索按钮点击事件
		$('button[code=floatSearchCode]').on('click',function(){
			showloading();
			var $searchForm=$('#searchFormId');
			//处理搜索关键词
			var keywords=$('input[name=floatSearchWords]').val();
			$searchForm.find('input[codeKeywords=codeKeywords]').val(keywords);
			dealSearch();
		});
		//点击选项增加筛选条件
		$('ul.attr_list>li>a').on('click',function(){
			showloading();
			var $a=$(this);
			var $searchForm=$('#searchFormId');
			var attrName=$a.closest('div.attr_item').find('div.attr_tag').text();
			var optionName=$a.text();
			var $selectList=$('ul.select_list');
			var $newLi=$("<li class=\"item\" attrAndOptionName="+attrName+":"+optionName+"><strong>"+attrName+":</strong> "+optionName+" <a class=\"btn_del_attr\" href=\"javascript:;\"></a></li>");
			$selectList.append($newLi);
			dealSearch();
		});
		//移除一个筛选条件
		$('div.attr_select').on('click','a.btn_del_attr',function(){
			showloading();
			$(this).closest('li').remove();
			dealSearch();
		});
		//排序按钮的点击
		$('div.sort').on('click','a',function(){
			showloading();
			var $a=$(this);
			//价格的升序和降序的处理
			if($a.hasClass('price')){
				$a.siblings('a').removeClass('active');
				if($a.hasClass('up')){
					$a.removeClass('up').addClass('down');
				}else if($a.hasClass('down')){
					$a.removeClass('down').addClass('up');
				}else{
					$a.addClass('down');
				}

			}else {
				$('a.price').removeClass('up').removeClass('down');
				$a.addClass('active').siblings('a').removeClass('active');
			} 
			dealSearch();
		});
		//最小分类的父级分类的点击
// 		$('div.category_list dt').on('click',function(event){
// 			$(this).parent('dl').siblings('dl').removeClass('active');
// 			$(this).parent('dl').addClass('active');
// 			if(event.target==event.currentTarget){
// 				var $dt=$(this);
// 				$('#js_menuList dd').removeClass('active');
// 				//移除增加的选项
// 				$('ul.select_list').empty();
// 				//移除排序条件
// 				$('a[sortCode=sortCode]').removeClass('active');
// 				$('a.price').removeClass('up').removeClass('down');
// 				dealSearch();
// 			}
// 		});
		//最小分类的点击
		$('div.category_list dd').on('click',function(){
			showloading();
			var $dd=$(this);
			if(!$dd.hasClass('active')){
				$('#js_menuList dd').removeClass('active');
				$dd.addClass('active');
			}
			//移除增加的选项
			$('ul.select_list').empty();
			//移除排序条件
			$('a[sortCode=sortCode]').removeClass('active');
			$('a.price').removeClass('up').removeClass('down');
			dealSearch();
		});
	});
	//用于搜索热词的显示控制,将一行显示不完,超过一行的关键词做移除处理
	$(function(){
		var $ul=$('ul[code=hotWordsUl]');
		var $liList=$ul.children('li');
		if($liList.size()>0){
			$firstLi=$($liList.get(0));
			var firstTop=$firstLi.position().top;
			$liList.each(function(index,item){
				var $li=$(this);
				var top=$li.position().top;
				if(top==firstTop){
					$li.css({visibility:"visible"});
				}else{
					$li.remove();
				}
			});
		}
	});





 $(function(){
   			var $menuDiv = $('div.index_content');
   			var $aList = $menuDiv.find('a');
   			$aList.each(function(index,item){
   				var $a = $(this);
   				var href = $a.attr('href');
   				if(typeof(href) !='undefined'){
	   				$a.attr('href',href.replace('WEBSITE_ID','4'));
   				}
   			});
   		});
   		//如果不是首页,需要将目录隐藏
   		if(isHomePage != 'true'){
	    	$(document).ready(function() {
			$('.left_info').hide();
	            //不是主页才添加
	    		$('.nav-green-title').hover(function(){
	    			$('.left_info').css('display','block');
	    		},function(e){
	    			if(e.offsetY>40){
	                    $('.left_info').css('display','block'); 
	                }else{
	                     $('.left_info').css('display','none');
	                }
	            });
	            
	            $('.left_info').hover(function(){
	                
	            },function(e){
	                if(e.offsetY>100){
	                    $('.left_info').hide();
	                }
	            });
	
	            //不是主页才添加

	    		//banner 子菜单显示隐藏
				var x = 0;
				var timer = null;
				$(".left_info ul li").hover(function(ev){
	
				    var that = $(this);
				    //that.css('background','#fff');
				    var menus = that.data('submenu');
					$('.allSubMenu').show();
				    $('.SubMenu').hide();
				    $('#SubMenu_'+menus).show();
				    $('#SubMenu_'+menus).hover(function(){	
				    $('#SubMenu_'+menus).show();
				        //that.css('background','#fff');
				    },function(){
				        //that.css('background','rgba(255,255,255)');
				        if(e.offsetX<0){
				        	
				        }else{
				        	  $('.SubMenu').hide();
							  $('.allSubMenu').hide();
							  $('.left_info').hide();
				        }
				      
						
				    });
	
				    that.find('.left_info_title').css('color','#95c46e');
					
				    var positions = that.position();
	
				    if(500-positions.top < $('#SubMenu_'+menus).height())
				    {
				        $('#SubMenu_'+menus).css('top',500-$('#SubMenu_'+menus).height());
				    }
				    else{
				        $('#SubMenu_'+menus).css('top',positions.top);
				    }
	
				},function(e){
				   
				    $(this).find('.left_info_title').css('color','#000');
				    var that = $(this);
				    var menus = that.data('submenu');
				    $('#SubMenu_'+menus).hide();
					
	                if(e.offsetX<0){
	                    //往左边移动 隐藏
	                    $('.left_info').hide();
	                }else if(e.offsetX>$(this).width()){
	                    
	                    if($('#SubMenu_'+menus).html() == undefined){
	                      $('.left_info').hide();
	                    }
	                }
	                //不是主页才添加 
				});
	    	})
   		}
		
		
		
			
	$(function(){
		
		$("#index_nav").children().children().children("li:first").removeClass("b_left");
		
		/*导航下拉*/
		 $("ul.nav li").hover(function(){
             $(this).addClass("on");

         },function(){
             $(this).removeClass("on");

         });
         $("ul.nav li").hover(function(){
             $(this).parent("ul").siblings("h3").addClass("choice");
         },function(){
             $(this).parent("ul").siblings("h3").removeClass("choice");
         });
         if ($("ul.nav li").find("ul") .html()!="") {
                 $("ul.nav li").parent("ul").siblings("h3").append("<span class='sub'></span>");                
         }
         
	});

