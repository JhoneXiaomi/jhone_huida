// 浏览器判断  
function checkBrowser(){
    var u = window.navigator.userAgent.toLocaleLowerCase(),
        msie = /(msie) ([\d.]+)/,
        chrome = /(chrome)\/([\d.]+)/,
        firefox = /(firefox)\/([\d.]+)/,
        safari = /(safari)\/([\d.]+)/,
        opera = /(opera)\/([\d.]+)/,
        ie11 = /(trident)\/([\d.]+)/,
        b = u.match(msie)||u.match(chrome)||u.match(firefox)||u.match(safari)||u.match(opera)||u.match(ie11);
    return {name: b[1], version: parseInt(b[2])};

}
// 验证码
jq(".img_yzm_a").click(function(event) {

    var idCode=jq("#passCode");
    var id = idCode || 'passport',

        str = window.location.href.toString().split('.')[0].replace('http://', "") || 'www',
        A = new Date().getTime();
    if ($(id)) {
        $(id).attr('src','http://'+str+'.to8to.com/passport.php?t=' + A);
    }

});


function newverifypicMy(id) {
    var id = id || 'passport',
        str = window.location.href.toString().split('.')[0].replace('http://', "") || 'www',
        A = new Date().getTime();
    if ($(id)) {
        $(id).src = 'http://'+str+'.to8to.com/passport.php?t=' + A;
    };
};
//防重复提交
var repeatFlag = false,
    agineRuku = 0;
var gpm = new GlobalProvincesModule();
jQuery(function() {
    var totleWrap = jq('.zxbj-apply-bottom-bar'),
        link = jq('.zxbj-apply-bottom-bar-link'),
        closeBtn = totleWrap.find('.icn_tip_close'),
        bwObj = checkBrowser(),
        ie6Flag = false,
        mitZXBJFlag = true,
    //flag = true,
        flag = getCookie('to8to_bottomBarHidden'),
        flag1220 = 1220;//显示小的
    var resultHref = '';
    var zbData = {},showData= {};
    //判断链接是否为新的效果图链接   改变底部通栏状态
    var new_href_present = -1;
    var new_href_present1 = -1;
    if (location.href.split('?')[1] && location.href.split('/')[3]){//如果存在这个参数
        new_href_present = location.href.split('?')[1].indexOf('tg_meitu=sem');
        new_href_present1 = location.href.split('/')[3].indexOf('meitu');
    }
    if (new_href_present >= 0 && new_href_present1>=0){
        flag = true;
    }
    initEvent();
    initPeopleNum();

    //匹配当前显示二维码
    /*if (getCookie('to8to_townid') == '1130') {
     jq('.bottom_atten_code img').attr('src', 'http://img.to8to.com/to8to_img/img_code/code_1130.jpg');
     };*/
    function initPeopleNum() {
        //该数据的伪造规则 (月*12 + 日*24 + 时*180 + 分*3 + 秒/20)
        var date = new Date(),
            num = (date.getMonth() + 1)*12 + date.getDate()*24 + date.getHours()*180 + date.getMinutes()*3 + date.getSeconds()/20;
        totleWrap.find('.apply_mn').html(Math.ceil(num));
    }
    function setVisible() {
        if(jq(window).scrollTop() > 273) {
            if(!getCookie('to8to_bottomBarHidden')) {
                totleWrap.css('left', 0);
                link.css('left', '-156px');
                flag = false;
            } else {
                setSmallLeft()
                totleWrap.css('left', '-150%');
                flag = true;
            }
        } else {
            link.css('left', '-156px');
            totleWrap.css('left', '-150%');
        }
    }

    function setSmallLeft() {
        link.css('left', 0);
    }
    function initEvent() {
        if(bwObj.name == 'safari') {
            totleWrap.addClass('sarifi-sepesil');
        } else if(bwObj.name == 'msie' && bwObj.version == 6) {
            ie6Flag = true;
        }
        if(jq('body:eq(0)').hasClass('narrow_980')) {
            flag1220 = 980;
        }
        setVisible();
        jq(window).bind('scroll resize', function() {
            if(jq(window).scrollTop() > 273) {
                if(flag) {
                    setSmallLeft()
                    totleWrap.css('left', '-150%');
                } else {
                    totleWrap.css('left', 0);
                    link.css('left', '-156px');
                }
            } else {
                link.css('left', '-156px');
                totleWrap.css('left', '-150%');
            }
        });

        totleWrap.find('[name="square"], [name="chkPhone"], [name="phone"],[name="chkYzm"]').placeholder();
        gpm.def_province = ["省/市", ""];
        gpm.def_city1 = ["市/地区", ""];
        gpm.initProvince($('zxbjBottomUser_Shen'));

        //点击开始计算
        totleWrap.find('.count-btn-new').bind('click',function(){
            //获取当前ptag
            var ptag = jq('.bottom_fiexd_box').find('input[name="ptag"]').val();
            //百度统计函数
            try{
                _hmt && _hmt.push(['_trackEvent', 'zb', 'submit', ptag]);
            }catch(e){

            }
            start_count();
        })

        link.bind('click', function() {
            link.animate({'left': '-156px'}, 200, function() {
                totleWrap.animate({'left': '0'}, 800);
                flag = false;
            });
        });

        closeBtn.bind('click', function() {
            setCookie('bottomBarHidden', true, 24*60*60*1000, true);
            totleWrap.animate({'left': '-150%'}, 800, function(){
                link.animate({'left': 0}, 200);
                flag = true;
            });

        });

        totleWrap.find(':radio[name="status"]').click(function() {//兼容safari
            jq(this).parents('.bottom_sjybj_content').removeClass('height_auto').find('.erro').remove();
        });
        var ptag = totleWrap.find(':hidden[name="ptag"]').val();
        jq('[searchtage]').bind('click', function() {
            var tag = jq(this).attr('searchtage');
            zxbjClickCream(ptag,tag);
        });
    }


    //装修智能报价检测
    function new_botton_check() {
        var chkArr = [{
            id: totleWrap.find(':text[name="square"]')[0],
            parentTip: '.zxbj-apply-bottom-bar',
            parCls:'.bottom-content-left',
            className: 'erro',
            labl: 'em',
            lablClass: '',
            info: [{
                reg:[0],
                tip:'请输入建筑面积'
            },{
                reg:[/^\d+(\.[0-9]?[1-9]{1})?$/],
                tip:'建筑面积不能超过两位小数'
            },{
                reg:[/^[0-4]{1}(\.[0-9]?[1-9]{1})?$/],
                tip:'建筑面积必须大于5', negate:true
            },{
                reg:[/^[1-9]{1}[0-9]{0,2}(\.[0-9]?[1-9]{1})?$|^1000$/],
                tip: '建筑面积必须是1000以内'
            }]
        }, {
            id: totleWrap.find('select[name="shen"]')[0],
            parentTip: '.zxbj-apply-bottom-bar',
            parCls:'.bottom-content-left',
            className: 'erro',
            labl: 'em',
            lablClass: '',
            info: [{
                reg: [0],
                tip: '请选择所在地'
            }]
        },{
            id: totleWrap.find('select[name="city"]')[0],
            parentTip: '.zxbj-apply-bottom-bar',
            parCls:'.bottom-content-left',
            className: 'erro',
            labl: 'em',
            lablClass: '',
            info: [{
                reg: [0],
                tip: '请选择所在地'
            }]
        }];
        var phoneRule = {
            id: jq('#zxbj_phone_bottom')[0],
            parentTip: '.zxbj-apply-bottom-bar',
            parCls:'.bottom-content-left',
            className: 'erro',
            labl: 'em',
            lablClass: '',
            info: [{
                reg: [0],
                tip: '请输入手机号码'
            },{
                reg: [/^1{1}[34578]{1}\d{9}$/],
                tip: '请输入正确的手机号码'
            }]
        };
        if (jq('#zxbj_phone_bottom').length > 0) {
            chkArr.push(phoneRule);
        };
        return simplifyCheck2(chkArr);
    }

    function getZXBJdata() {
        var sendData = {};
        sendData.square = totleWrap.find(':text[name="square"]').val();
        sendData.shen = totleWrap.find('select[name="User_Shen_bottom"]').val();
        sendData.city = totleWrap.find('select[name="User_City_bottom"]').val();
        sendData.dangci = totleWrap.find(':hidden[name="dangci"]').val();
        sendData.ptag = totleWrap.find(':hidden[name="ptag"]').val();
        sendData.zxtime = totleWrap.find('select[name="zxtime"]').val();
        return sendData;
        //return 'square='+area.val()+'&User_Shen='+shen.val()+'&User_City='+city.val() + '&dangci='+ dangci.val()+'&ptag='+ptag.val();
    }

    //装修报价第1步提交
    function zxbjFirstStep() {
        if(new_botton_check()) {
            zbData = getZXBJdata();
            totleWrap.find('.passport').trigger('click');

            totleWrap.find('.step1').animate({'z-index': 9996},100, function() {
                ie6Flag && totleWrap.find('.step1').hide();

                var tips = '为了方便随时查看，报价结果会短信发送';
                var ptg = totleWrap.find(':hidden[name="ptag"]').val();
                tips = ptg =='1_3_7_123'  || ptg == '1_1_4_2' ? '我们将把红包抵扣劵发送至您的手机' : tips;
                totleWrap.find('.step2 > p').html(tips);
                totleWrap.find('.step2').css({'opacity': 0, 'z-index': 9998}).show();
                totleWrap.find('.step2').animate({'opacity': 1}, 200);
            });

        }
    }

    function checkPhone() {
        var phone = totleWrap.find(':text[name="chkPhone"]'),
            yzm = totleWrap.find(':text[name="chkYzm"]');

        var chkArr = [{
            id: phone[0],
            parentTip: '.zxbj-apply-bottom-bar',
            parCls:'.bottom_sjybj_content',
            className: 'erro',
            labl: 'em',
            lablClass: '',
            info: [{
                reg: [0],
                tip: '请输入手机号码'
            },{
                reg: [/^1{1}[34578]{1}\d{9}$/],
                tip: '请输入正确的手机号码'
            }]
        }, {
            id: yzm[0],
            parentTip: '.zxbj-apply-bottom-bar',
            parCls:'.bottom_sjybj_content',
            className: 'erro',
            labl: 'em',
            lablClass: '',
            info: [{
                reg: [0],
                tip: '请输入验证码'
            }]
        }];

        return simplifyCheck2(chkArr);
    }

    //第2步
    function checkPhoneStep2() {
        var phone = totleWrap.find(':text[name="chkPhone"]'),
            yzm = totleWrap.find(':text[name="chkYzm"]');

        if(!mitZXBJFlag) {
            return false;
        }
        if(checkPhone()) {
            var rand_num = yzm.val();
            mitZXBJFlag = false;
            if(rand_num == '') {
                yzm.focus();
            } else {
                jq.ajax({
                    type: "GET",
                    url: "/my/get_moblie_yz.php",
                    dataType: 'json',
                    data: {ajax:1, rand_num: rand_num},
                    success:function(data){
                        if(data == 1) {//验证码正确
                            //判断是否是折扣底部通栏
                            //初始化必填数据
                            zbData.phone = phone.val();
                            zbData.nowstep = 1;
                            zbData.modeltype = 2;
                            zbData.type = 'bottom';
                            //var bjData = JSON.parse(jq("#bjData").val());
                            zbData.refurl = window.parent.location.href;
                            zbData.onFirstStepEnd = function(res) {
                                //console.log(res);
                                mitZXBJFlag = true;
                                var wrap = jq('.zxbj-calc-wrap .zxbj .step3');
                                showData.nowstep = res.nextstep;
                                showData.modeltype = res.modeltype;
                                showData.yid = res.yid;
                                //报价结果展示
                                showResult(res);

                                //submitZXBJData(da, phone);
                            }
                            var  ptag = totleWrap.find(':hidden[name="ptag"]').val();
                            if( ptag == '1_3_7_123' ||  ptag=='1_1_4_2'  ){
                                IsDeduction(zbData)
                            }else{
                                if(!window.tender) {
                                    jq.getScript('http://static.to8to.com/gb_js/tender.js?v=1464789987',function(){
                                        var zxBottom = new tender();
                                        zxBottom.init(zbData);
                                    });
                                    return;
                                }
                                var zxBottom = new tender();
                                zxBottom.init(zbData);
                            }

                        }else{
                            mitZXBJFlag = true;
                            alert('验证码错误');
                            yzm.focus();
                        }
                    }
                });
            }
        }
    }
    //展示报价返回结果
    function showResult(res) {
        if(res.status == 1) {//发送成功
            var price = totleWrap.find('.con_p1');
            var href = 'http://www.to8to.com/zb/zxbj2.php?windbox=boxhref&square='+zbData.square+'&User_Shen='+encodeURIComponent(zbData.shen)+'&User_City='+encodeURIComponent(zbData.city) + '&dangci='+ zbData.dangci+'&ptag='+zbData.ptag ;
            //totleWrap.find('.step3 .btn_detail').attr('href', href);
            resultHref = href;
            price.eq(0).find('span').html(res.banbaoPrice);
            price.eq(1).find('span').html(res.quanbaoPrice);
            //给第三步加链接
            jq('.step3').find('.btn_detail_ffa00b').attr({'href':resultHref,'target':'_blank'});
            totleWrap.find('.step3 .p1:eq(0)').html(res.desc1);
            if(totleWrap.find('.step3 p.mallvolumn_tit_tip').length)
            {
                var desc =res.desc || '我们将24小时内致电您，提供更多家居建材资讯。';
                totleWrap.find('.step3 p.mallvolumn_tit_tip').html('<i>*</i>'+res.desc);
            }
            totleWrap.find('.step2').animate({'z-index': 9996},100, function() {
                totleWrap.find('.step3').css({'opacity': 0, 'z-index': 9998}).show();
                totleWrap.find('.step3').animate({'opacity': 1}, 200);
            });
        }
    }
    //** 点击流
    function zxbjClickCream(ptag,tag)
    {
        var zxbjCfgObj={"1_1_1_99":{"first":"1_1_1_98","second":"1_1_1_99","three":"1_1_1_97"},
            "1_2_3_99":{"first":"1_2_3_98","second":"1_2_3_99","three":"1_2_3_97"},"1_2_1_99":{"first":"1_2_1_98","second":"1_2_1_99","three":"1_2_1_97"},"1_2_5_99":{"first":"1_2_5_98","second":"1_2_5_99","three":"1_2_5_97"},"1_2_6_99":{"first":"1_2_6_98","second":"1_2_6_99","three":"1_2_6_97"},"1_3_5_100":{"first":"1_3_5_96","second":"1_3_5_100","three":"1_3_5_95"},"1_3_5_101":{"first":"1_3_5_94","second":"1_3_5_101","three":"1_3_5_93"},"1_3_5_102":{"first":"1_3_5_92","second":"1_3_5_102","three":"1_3_5_91"},"1_3_4_99":{"first":"1_3_4_90","second":"1_3_4_99","three":"1_3_4_89"},"1_3_6_99":{"first":"1_3_6_98","second":"1_3_6_99","three":"1_3_6_97"},"1_8_6_1":{"first":"1_3_5_92","second":"1_8_6_1","three":"1_3_5_91"},"1_8_5_1":{"first":"1_3_5_92","second":"1_8_5_1","three":"1_3_5_91"}};

        var subPtag='';
        for(var key in zxbjCfgObj)
        {
            if(key==ptag)
            {
                subPtag=zxbjCfgObj[ptag][tag];
                break;
            }
        }
        if(typeof clickStream=='object' && subPtag)
        {
            clickStream.getCvParams(subPtag);
        }
    }

    //折扣的底部通栏判断是否发送现金卷
    function IsDeduction(datas){
        var phone = datas.phone;
        jq.ajax({
            type: "POST",
            url: "/yezhu/getCoupon.php",
            dataType: 'json',
            data: {phone:phone},
            success:function(data)
            {
                if(data == 2){
                    //数据
                    jq('.mallvolumn_tip').first().css('display','block');
                    if(!window.tender) {
                        jq.getScript('http://static.to8to.com/gb_js/tender.js?v=1464789987',function(){
                            var zxBottom = new tender();
                            zxBottom.init(datas);
                        });
                        return;
                    }
                    var zxBottom = new tender();
                    zxBottom.init(zbData);
                }
                else {
                    var step3Obj = totleWrap.find('.step3');
                    totleWrap.find('.step1,.step2').animate({'z-index': 9996},100, function() {
                        ie6Flag && totleWrap.find('.step2').hide();
                        step3Obj.css({'opacity': 0, 'z-index': 9998}).show();
                        step3Obj.animate({'opacity': 1}, 200);
                    });
                    jq('.mallvolumn_tip').last().css({'opacity': 1, 'z-index': 9998}).show();
                }
            }
        });
    }

    //获取cookie
    function getCookie(name, pre) {
        if (pre)
            name = 'to8to_' + name;
        var r = new RegExp("(\\b)" + name + "=([^;]*)(;|$)");
        var m = document.cookie.match(r);
        var res = !m ? "": decodeURIComponent(m[2]);
        var result = stripscript(res);

        return result;
    };

    //点击开始计算按钮后的验证
    function start_count(){
        if(new_botton_check()){
            getTotalDetailInfo('detail');
        }
    }
    function getTotalDetailInfo(type) {
        if (repeatFlag) {
            return;
        }
        //标示点击未完成不允许下一次点击
        repeatFlag = true;
        var mj = jq('#quoted_area_bottom').val();
        var cdata = jq('#quoted_form_bottom').serialize() + '&secStepAjax=1&ajaxAgine=' + agineRuku;
        var data = formToJSON(jq('#quoted_form_bottom'));
        var href = 'http://www.to8to.com/zb/zxbj2.php?windbox=boxhref&square='+data.square+'&User_Shen='+encodeURIComponent(data.shen)+'&User_City='+encodeURIComponent(data.city) + '&dangci='+ data.dangci+'&ptag='+data.ptag;
        data.type = type;
        data.nowstep = 1;
        data.modeltype = 2;
        data.onFirstStepEnd = function(data) {
            var yid = data.yid ? data.yid : 0;
            designInfo = data.designInfo;
            companyInfo = data.companyInfo;
            priceInDOM(data.priceInfo,jq('.budget-list li b'),data.res,data.banbaoPrice,data.other);
            //数据得到后样式变化
            jq('.bottom-budget-point').css('display','block');
            jq('.count-btn-new').addClass('recount-btn');
            jq('.new-bottom-content').css('padding','5px 0 35px 0');
            jq('.bottom-budget-point').css('bottom','2px');
            jq('.bottom-budget-price').find('a').addClass('show-on').attr({'href':href,'target':'_blank'});
            //这一次点击有了返回值流程走完可以再次点击
            repeatFlag = false;
        }; 
        var sendMsg = new tender();
        sendMsg.init(data);

    }
    //得到价格  并赋值到对应页面上去
    function priceInDOM(data,ele,homeMsg,banbao_price,other){
        var shi = 0;
        var ting = 0;
        var chu = 0;
        var wei = 0;
        var yang = 0;
        var qita = 0;
        for(var i = 0; i< homeMsg.length; i++) {
            if(homeMsg[i].key=='shi_arr[]')
            {
                shi += data[i].price;
            }

            if(homeMsg[i].key=='ting_arr[]')
            {
                ting += data[i].price;
            }
            if(homeMsg[i].key=='chu_arr[]')
            {
                chu += data[i].price;
            }
            if(homeMsg[i].key=='wei_arr[]')
            {
                wei += data[i].price;
            }
            if(homeMsg[i].key=='yangtai_arr[]')
            {
                yang += data[i].price;
            }

        }
        var qita = banbao_price-shi-ting-chu-wei-yang;
        jq('#quoted_bedroom_bottom').html(shi);
        jq('#quoted_saloon_bottom').html(ting);
        jq('#quoted_kitchen_bottom').html(chu);
        jq('#quoted_toilet_bottom').html(wei);
        jq('#quoted_balcony_bottom').html(yang);
        jq('.bottom-budget-price b').html(((banbao_price)/10000).toFixed(1));
        //jq('.bottom-budget-price b').html(((banbao_price-data[homeMsg.length].price)/10000).toFixed(1));
        jq('#quoted_other_bottom').html(qita);
    }
    function formToJSON(formEle) {
        var data = formEle.serializeArray();
        var dataObj = {};
        for (var i in data) {
            dataObj[data[i].name] = data[i].value;
        }
        return dataObj;
    }

});
