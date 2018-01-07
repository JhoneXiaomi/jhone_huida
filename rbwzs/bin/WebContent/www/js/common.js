// JavaScript Document
$(function() {
    var ww = $(window).width();
    $('header nav a:last').css({
        "border-right": 'none'
    });
    $('.mobile-nav li:eq(0)').addClass('mobile-nav-list1');
    $('.about:eq(3) .about-con').css({
        'border': 'none'
    });
    $('.btn-nav-bar').click(function() {
        var body_left = $('body').css("marginLeft");
        if (parseInt(body_left) == 0) {
            $('body').stop(true, false).animate({
                marginLeft: '-126px'
            });
            $('.mobile-nav').stop(true, false).animate({
                right: '0px'
            });
            $('.mobile-nav').css({
                "position": 'absolute',
                "height": $(document).height(),
                'display': 'block'
            })
        } else {
            $('body').stop(true, false).animate({
                marginLeft: '0px'
            });
            $('.mobile-nav').stop(true, false).animate({
                right: '-126px'
            }, function() {
                $('.mobile-nav').css({
                    "position": 'fixed',
                    'display': 'none'
                })
            })
        }
    });
    if (ww > 1024) {
        $('.case-sm,.case-lg').hover(function() {
            $(this).children('.case-img-wrapper').children('a').stop(true, false).animate({
                'right': 0
            }, 300, function() {
                $(this).addClass('hover');
                $(this).parent().children('.mask-point').css({
                    'display': 'block'
                })
            });
            $(this).children('.black-bg').css({
                'background': '#EF3125'
            });
            $(this).children('.white-bg').css({
                'background': '#EF3125'
            });
            $(this).children('.white-bg').children('a').css({
                'color': '#fff'
            });
            $(this).children('.case-con').children('i.black-ico-l').css({
                'backgroundPosition': '0 -14px'
            });
            $(this).children('.case-con').children('i.black-ico-r').css({
                'backgroundPosition': '-7px -14px'
            });
            $(this).children('.case-con').children('i.white-ico-l').css({
                'backgroundPosition': '0 -14px'
            });
            $(this).children('.case-con').children('i.white-ico-r').css({
                'backgroundPosition': '-7px -14px'
            })
        }, function() {
            $('.case-lg').children('.case-img-wrapper').children('a').stop(true, false).animate({
                'right': '-100%'
            }, 300);
            $('.case-sm').children('.case-img-wrapper').children('a').stop(true, false).animate({
                'right': '-100%'
            }, 300);
            $(this).children('.case-img-wrapper').children('.mask-point').hide();
            $(this).children('.case-img-wrapper').children('a').removeClass('hover');
            $(this).children('.black-bg').css({
                'background': '#000'
            });
            $(this).children('.white-bg').css({
                'background': '#fff'
            });
            $(this).children('.white-bg').children('a').css({
                'color': '#000'
            });
            $(this).children('.case-con').children('i.black-ico-l').css({
                'backgroundPosition': '0 0'
            });
            $(this).children('.case-con').children('i.black-ico-r').css({
                'backgroundPosition': '-7px 0'
            });
            $(this).children('.case-con').children('i.white-ico-l').css({
                'backgroundPosition': '-14px 0'
            });
            $(this).children('.case-con').children('i.white-ico-r').css({
                'backgroundPosition': '-21px 0'
            })
        })
    };
    if (ww <= 1024) {
        $('.case-sm,.case-lg').click(function() {
            $(this).children('.case-img-wrapper').children('a').stop(true, false).animate({
                'right': 0
            }, 300, function() {
                $(this).addClass('hover');
                $(this).parent().children('.mask-point').css({
                    'display': 'block'
                })
            });
            $(this).siblings('div').children('.case-img-wrapper').children('a').stop(true, false).animate({
                'right': '-100%'
            }, 300, function() {
                $(this).removeClass('hover');
                $(this).parent().children('.mask-point').hide()
            });
            $(this).children('.black-bg').css({
                'background': '#EF3125'
            });
            $(this).siblings('div').children('.black-bg').css({
                'background': '#000'
            });
            $(this).children('.white-bg').css({
                'background': '#EF3125'
            });
            $(this).siblings('div').children('.white-bg').css({
                'background': '#fff'
            });
            $(this).children('.white-bg').children('a').css({
                'color': '#fff'
            });
            $(this).siblings('div').children('.white-bg').children('a').css({
                'color': '#000'
            });
            $(this).children('.case-con').children('i.black-ico-l').css({
                'backgroundPosition': '0 -14px'
            });
            $(this).siblings('div').children('.case-con').children('i.black-ico-l').css({
                'backgroundPosition': '0 0'
            });
            $(this).children('.case-con').children('i.black-ico-r').css({
                'backgroundPosition': '-7px -14px'
            });
            $(this).siblings('div').children('.case-con').children('i.black-ico-r').css({
                'backgroundPosition': '-7px 0'
            });
            $(this).children('.case-con').children('i.white-ico-l').css({
                'backgroundPosition': '0 -14px'
            });
            $(this).siblings('div').children('.case-con').children('i.white-ico-l').css({
                'backgroundPosition': '-14px 0'
            });
            $(this).children('.case-con').children('i.white-ico-r').css({
                'backgroundPosition': '-7px -14px'
            });
            $(this).siblings('div').children('.case-con').children('i.white-ico-r').css({
                'backgroundPosition': '-21px 0'
            })
        })
    };
    $(window).load(function() {
        r();
        $('.case-list%20ul%20li%20span.mask').css({
            'height': $('.case-content ul li img').height() - 5
        })
    });
    $('.case-list ul li a').children('.mask-point').hide();

    function caseHover() {
        $('.case-list ul li a').live('mouseover', function() {
            $(this).parents().children('.case-bg').stop(true, true).fadeIn(300);
            $(this).children('span').css({
                'color': '#fff'
            });
            $(this).children('.mask').stop(true, false).animate({
                'right': 0
            }, 200, function() {
                $(this).addClass('mask-over')
            });
            $(this).children('.mask-point').fadeIn(50)
        }).live('mouseleave', function() {
            $(this).parents().children('.case-bg').hide();
            $(this).children('span').css({
                'color': '#9f9f9f'
            });
            $(this).children('.mask').stop(true, false).animate({
                'right': '-100%'
            }, 200, function() {
                $(this).removeClass('mask-over')
            });
            $(this).children('.mask-point').fadeOut(300)
        })
    };
    caseHover();
    $('.c-erweima').hover(function() {
        $('.c-erweima').children('div').show()
    }, function() {
        $('.c-erweima').children('div').hide()
    });
    $('.news-list .news-con-top').live('mouseover', function() {
        $(this).stop(true, true).animate({
            'height': 125
        }, 200);
        $(this).css({
            'overflow': 'visible'
        });
        $(this).children('a').children('.news-more').stop(true, true).fadeIn().css({
            'display': 'block'
        })
    }).live('mouseleave', function() {
        $(this).stop(true, true).animate({
            'height': 115
        }, 250);
        $(this).css({
            'overflow': 'visible'
        });
        $(this).children('a').children('.news-more').stop(true, true).fadeOut(50)
    });
    $('.job-content li').hover(function() {
        $(this).children('.job').css({
            'color': '#f00'
        })
    }, function() {
        $(this).children('.job').css({
            'color': '#3a3a3a'
        })
    });
    $('.job-content li').click(function() {
        $(this).children('.job-ask').stop(true, false).slideToggle();
        $(this).siblings().children('.job-ask').slideUp()
    });
    var total_height = 0;
    var set_height = 0;
    var st = parseFloat($(window).scrollTop());
    $(window).scroll(function() {
        st = parseFloat($(window).scrollTop());
        total_height = parseFloat($(window).height()) + st;
        set_height = $(document).height() - ($('footer').height() + 30);
        if (total_height >= set_height) {
            add_content()
        }
    });

    function add_content() {
        var i = 10
    };
    var case_scale1 = 936 / 816;
    var case_scale2 = 702 / 816;
    var case_scale3 = 468 / 956;
    var case_h = 0;
    if (ww > 1024) {
        case_h = 544;
        $('h1').hover(function() {
            $('h1').stop(false, false).animate({
                top: '-91px'
            })
        }, function() {
            $('h1').stop(false, false).animate({
                top: '0px'
            })
        });
        $('.side-bar').css({
            'visibility': 'visible'
        })
    } else if (ww <= 1024 && 795 < ww) {
        if (795 < ww) {
            case_h = ww / case_scale1;
            $('h1').hover(function() {
                $('h1').stop(true, false).animate({
                    top: '-91px'
                })
            }, function() {
                $('h1').stop(true, false).animate({
                    top: '0px'
                })
            });
            $('.company ul li:eq(2)').css({
                'padding-right': 0
            });
            $('.company ul li:eq(5)').css({
                'padding-right': 0
            });
            $('.side-bar').css({
                'visibility': 'visible'
            })
        }
    } else if ($(window).width() <= 795 && 545 < $(window).width()) {
        case_h = $(window).width() / case_scale2;
        $('.company ul li:eq(2)').css({
            'padding-right': 0
        });
        $('.company ul li:eq(5)').css({
            'padding-right': 0
        });
        if ($(window).width() < 768) {
            $('.side-bar').css({
                'visibility': 'hidden'
            })
        }
    } else if ($(window).width() <= 545) {
        case_h = $(window).width() / case_scale3;
        $('.side-bar').css({
            'visibility': 'hidden'
        })
    } else {};
    $('.case-wrapper').css({
        'height': parseInt(case_h)
    });
    $(window).resize(function() {
        ww = $(window).width();
        $('.case-content%20ul%20li%20span.mask').css({
            'height': $('.case-content ul li img').height() - 5
        });
        $('.news-show-list ul').css({
            'top': 0
        });
        if ($('header nav').css("display") == "block") {
            $('.mobile-nav').css({
                "position": 'fixed'
            });
            $('body').stop(true, false).animate({
                marginLeft: '0px'
            });
            $('.mobile-nav').stop(true, false).animate({
                right: '-126px'
            })
        };
        if (ww > 1024) {
            var case_h = 544;
            $('.side-bar').css({
                'visibility': 'visible'
            });
            $('.case-sm,.case-lg').hover(function() {
                $(this).children('.case-img-wrapper').children('a').stop(true, false).animate({
                    'right': 0
                }, 300, function() {
                    $(this).addClass('hover');
                    $(this).parent().children('.mask-point').css({
                        'display': 'block'
                    })
                });
                $(this).children('.black-bg').css({
                    'background': '#EF3125'
                });
                $(this).children('.white-bg').css({
                    'background': '#EF3125'
                });
                $(this).children('.white-bg').children('a').css({
                    'color': '#fff'
                });
                $(this).children('.case-con').children('i.black-ico-l').css({
                    'backgroundPosition': '0 -14px'
                });
                $(this).children('.case-con').children('i.black-ico-r').css({
                    'backgroundPosition': '-7px -14px'
                });
                $(this).children('.case-con').children('i.white-ico-l').css({
                    'backgroundPosition': '0 -14px'
                });
                $(this).children('.case-con').children('i.white-ico-r').css({
                    'backgroundPosition': '-7px -14px'
                })
            }, function() {
                $('.case-lg').children('.case-img-wrapper').children('a').stop(true, false).animate({
                    'right': '-100%'
                }, 300);
                $('.case-sm').children('.case-img-wrapper').children('a').stop(true, false).animate({
                    'right': '-100%'
                }, 300);
                $(this).children('.case-img-wrapper').children('.mask-point').hide();
                $(this).children('.case-img-wrapper').children('a').removeClass('hover');
                $(this).children('.black-bg').css({
                    'background': '#000'
                });
                $(this).children('.white-bg').css({
                    'background': '#fff'
                });
                $(this).children('.white-bg').children('a').css({
                    'color': '#000'
                });
                $(this).children('.case-con').children('i.black-ico-l').css({
                    'backgroundPosition': '0 0'
                });
                $(this).children('.case-con').children('i.black-ico-r').css({
                    'backgroundPosition': '-7px 0'
                });
                $(this).children('.case-con').children('i.white-ico-l').css({
                    'backgroundPosition': '-14px 0'
                });
                $(this).children('.case-con').children('i.white-ico-r').css({
                    'backgroundPosition': '-21px 0'
                })
            })
        } else if (ww <= 1024 && 795 < ww) {
            $('.company ul li:eq(2)').css({
                'padding-right': 0
            });
            $('.company ul li:eq(5)').css({
                'padding-right': 0
            });
            $('.side-bar').css({
                'visibility': 'visible'
            });
            case_h = $(window).width() / case_scale1
        } else if ($(window).width() <= 795 && 545 < $(window).width()) {
            $('.company ul li:eq(2)').css({
                'padding-right': 0
            });
            $('.company ul li:eq(5)').css({
                'padding-right': 0
            });
            case_h = $(window).width() / case_scale2;
            if ($(window).width() < 768) {
                $('.side-bar').css({
                    'visibility': 'hidden'
                })
            }
        } else if ($(window).width() <= 545) {
            case_h = $(window).width() / case_scale3;
            $('.side-bar').css({
                'visibility': 'hidden'
            })
        } else {};
        $('.case-wrapper').css({
            'height': parseInt(case_h)
        })
    });
    $('.contact ul li:eq(0)').css({
        'color': '#fff'
    }).click();
    var menu = $(".move_menu");
    $('.contact ul li').click(function() {
        var sthis = $(this);
        sthis.siblings().css({
            'color': '#3a3a3a'
        });
        menu.animate({
            'top': ($(this).position().top) + 105
        }, 500, function() {
            sthis.css({
                'color': '#fff'
            })
        });
        $('.adress_con').eq(sthis.index()).show(0).siblings('.adress_con').hide(0)
    });
    $('.contact form .button').hover(function() {
        $(this).css({
            'background': '#EF3125'
        })
    }, function() {
        $(this).css({
            'background': '#2a2a2a'
        })
    });
    $('.contact form input').focus(function() {
        $(this).addClass('changed').siblings().removeClass('changed')
    });
    $('.contact form input').blur(function() {
        $(this).removeClass('changed')
    });
    $('.contact form textarea').focus(function() {
        $(this).addClass('changed').siblings().removeClass('changed')
    });
    $('.contact form textarea').blur(function() {
        $(this).removeClass('changed')
    });
    var erweima_time = null;
    $('.side-bar-erweima').mouseover(function() {
        if (erweima_time) {
            clearTimeout(erweima_time)
        };
        $(this).css({
            'background': '#000'
        });
        $(this).children('.erweima').fadeIn()
    }).mouseleave(function() {
        $(this).css({
            'background': '#9c2727'
        });
        var _this = $(this);
        erweima_time = setTimeout(function() {
            _this.children('.erweima').hide()
        }, 500)
    });
    $('.side-bar-qq').hover(function() {
        $(this).css({
            'background': '#000'
        });
        $(this).stop(true, false).animate({
            'width': 110
        })
    }, function() {
        $(this).css({
            'background': '#BF3131'
        });
        $(this).stop(true, false).animate({
            'width': 45
        })
    });
    $('.side-bar-contact').hover(function() {
        $(this).css({
            'background': '#000'
        });
        $(this).stop(true, false).animate({
            'width': 110
        })
    }, function() {
        $(this).css({
            'background': '#BF3131'
        });
        $(this).stop(true, false).animate({
            'width': 45
        })
    });
    $('.to-top').hover(function() {
        $(this).css({
            'background': '#666'
        });
        $(this).children('.ico2').css({
            'backgroundPosition': '-28px -7px'
        })
    }, function() {
        $(this).css({
            'background': '#cbcbcb'
        });
        $(this).children('.ico2').css({
            'backgroundPosition': '-28px -2px'
        })
    });
    $('.to-top').click(function() {
        $('html,body').animate({
            scrollTop: 0
        }, 300)
    });
});
var news = {};
news.page = 1;
news.num = 16;
news.loading = true;

function loadNews(pages, cid) {
    var timestamp = new Date().getTime();
    $.post(siteUrl + "e/ajax/news.php@t=" + timestamp, {
        page: news.page,
        cid: cid,
        num: news.num
    }, function(deta) {
        if (deta) {
            $('.news-list ul').append(deta);
            news.page++;
            $('#loadMore').removeClass('loading');
            news.loading = true
        } else {
            $('#loadMore').removeClass('loading').addClass('none').html('没有了...')
        }
    })
};