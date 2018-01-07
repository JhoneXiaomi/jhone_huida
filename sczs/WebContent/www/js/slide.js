$(function(){
	var oPic = $("#picBox");
	var oList = $("#listBox");

	var oPrev = $("#prev");
	var oNext = $("#next");
	var oPrevTop = $("#prevTop");
	var oNextTop = $("#nextTop");

	var oPicLi = $("#picBox li");
	var oListLi = $("#listBox li");
	var len1 = oPicLi.length;
	var len2 = oListLi.length;

	var oPicUl = $("#picBox ul");
	var oListUl = $("#listBox ul");
	var w1 = oPicLi.width();
	var w2 = oListLi.width();

	oPicUl.width(w1 * len1);
	oListUl.width(w2 * len2);

	var index = 0;
	var num = 4;
	var num2 = Math.ceil(num / 2);
	
	var timer=null;
	timer=setInterval(function(){if(!$(oPicUl).is(":animated")){Next()}},5000);

	oListLi.click(function(){
		index = $(this).index();
		Change();
	});
	oNextTop.click(function(){
		Next();
	});
	oNext.click(function(){
		Next();
	});
	oPrevTop.click(function(){
		Prev();
	});
	oPrev.click(function(){
		Prev();
	});
	function Next(){
		index ++;
		index = index == len2 ? 0 : index;
		Change();
	}		
	function Prev(){
		index --;
		index = index == -1 ? len2 -1 : index;
		Change();
	}
	function Change() {
		oPicUl.stop(true,true);
		oPicUl.animate({left: - index * w1,opacity:'0.4'});
		oPicUl.animate({left: - index * w1,opacity:'1'});
		if(index <= num2){
			oListUl.animate({left: 0});
		}else if(len2 - index + 1 > num){
			oListUl.animate({left: - num2 * w2});
		}else{
			oListUl.animate({left: - (len2 - num) * w2});
		}
		for (var i = 0; i < len2; i++) {
			oListLi[i].className = "";
			if(i == index){
				oListLi[i].className = "on";
			}
		}
	}
	oListLi.mouseenter(function(){
		clearInterval(timer)
	});
	oListLi.mouseout(function(){
		clearInterval(timer)
		timer=setInterval(function(){if(!$(oPicUl).is(":animated")){Next()}},5000);
	});
})