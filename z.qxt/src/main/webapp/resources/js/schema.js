var openDefault =
function() {
    function e() {
        var e = y.getQueryString("schema") || "",
        i = y.getQueryString("id") || "",
        t = y.getQueryString("way") || "",
        o = y.getQueryString("type") || "",
        n = y.getQueryString("version") || "",
        u = {
            android: {
                url: "http://mjdownload.baoxiangkeji.com/common/download/mjapk",
//                schema: function() {
//                    var u = "douyutvtest://platformapi/startApp?room_id=" + e + "&isVertical=" + i + "&room_src=" + t + "&isVideo=" + o;
//                    return n && (u = u + "&evoke_chan=" + n),
//                    u
//                } ()
                schema: e
            },
            ios: {
                url: "http://www.baidu.com",
                schema: e
            },
            iosHD: {
                url: "https://itunes.apple.com/cn/app/dou-yutv-hd/id921452804",
                schema: "douyutvhd://" + e + "&" + i + "&" + t + "&" + o
            }
        };
        g(u)
    }
//    function i() {
//        var e = y.getQueryString("isEvokeChan") || "",
//        i = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: function() {
//                    var i = "douyutvtest://platformapi/startApp";
//                    return e && (i = i + "?evoke_chan=" + e),
//                    i
//                } ()
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyutv://"
//            },
//            iosHD: {
//                url: "https://itunes.apple.com/cn/app/dou-yutv-hd/id921452804",
//                schema: "douyutvhd://"
//            }
//        };
//        g(i)
//    }
//    function t() {
//        var e = y.getQueryString("downUrl") || "",
//        i = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyutvtest://platformapi/startApp"
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyutv://"
//            },
//            iosHD: {
//                url: "https://itunes.apple.com/cn/app/dou-yutv-hd/id921452804",
//                schema: "douyutvhd://"
//            }
//        };
//        l.isIOS ? l.isIOSHD ? window.location.href = e || i.iosHD.url: window.location.href = e || i.ios.url: window.location.href = e || i.android.url
//    }
//    function o() {
//        var e = y.getQueryString("id") || "",
//        i = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyuapp://yuba?page=postdetail&id=" + e
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyuapp://yuba?page=postdetail&id=" + e
//            }
//        };
//        g(i)
//    }
//    function n() {
//        var e = y.getQueryString("id") || "",
//        i = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyuapp://message?type=addfriend&uid=" + e
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyuMail://message?type=addfriend&uid=" + e
//            }
//        };
//        g(i)
//    }
//    function u() {
//        var e = 6,
//        i = y.getQueryString("roomId") || "",
//        t = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyutvaudio://?type=" + e + "&room_id=" + i
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyutv://?type=" + e + "&room_id=" + i
//            }
//        };
//        g(t)
//    }
//    function a() {
//        var e = 7,
//        i = y.getQueryString("topicId") || 0,
//        t = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyutvtest://platformapi/startApp?type=" + e + "&topic_id=" + i
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyutv://?type=" + e + "&topic_id=" + i
//            }
//        };
//        g(t)
//    }
//    function r() {
//        var e = 8,
//        i = y.getQueryString("classId") || 0,
//        t = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyutvtest://platformapi/startApp?type=" + e + "&class_id=" + i
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyutv://?type=" + e + "&class_id=" + i
//            }
//        };
//        g(t)
//    }
//    function d() {
//        var e = y.getQueryString("roomId") || "",
//        i = y.getQueryString("isVertical") || "",
//        t = y.getQueryString("roomSrc") || "",
//        o = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyutvtest://platformapi/startApp?type=5&room_id=" + e + "&isVertical=" + i + "&room_src=" + t + "&isVideo=1"
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyutv://" + e + "&" + i + "&" + t + "&1"
//            },
//            iosHD: {
//                url: "https://itunes.apple.com/cn/app/dou-yutv-hd/id921452804",
//                schema: "douyutvhd://" + e + "&" + i + "&" + t + "&1"
//            }
//        };
//        g(o)
//    }
//    function p() {
//        var e = y.getQueryString("id") || "",
//        i = y.getQueryString("page") || "",
//        t = {
//            android: {
//                url: _dyNewApkUrl || "http://a.app.qq.com/o/simple.jsp?pkgname=air.tv.douyu.android",
//                schema: "douyuapp://yuba?page=" + i + "&id=" + e
//            },
//            ios: {
//                url: "https://itunes.apple.com/us/app/dou-yu-re-men-gao-qing-you/id863882795",
//                schema: "douyuapp://yuba?page=" + i + "&id=" + e
//            }
//        };
//        g(t)
//    }
    function s() {
        var s = y.getQueryString("type") || 0;
        "0" == s && e(),
        "1" == s && i(),
        "2" == s && t(),
        "3" == s && o(),
        "4" == s && n(),
        "6" == s && u(),
        "7" == s && a(),
        "8" == s && r(),
        "9" == s && d(),
        "10" == s && p()
    }
    var c = null,
    m = navigator.userAgent,
    l = function() {
        var e = m.toLowerCase();
        return {
            isMobile: !!e.match(/AppleWebKit.*Mobile.*/i),
            isWX: "micromessenger" == e.match(/MicroMessenger/i),
            isWB: "weibo" == e.match(/WeiBo/i),
            isQQ: "qq" == e.match(/QQ/i) && (e.indexOf("yyb_d") > -1 || e.indexOf("yybd") > -1),
            isDyAndroid: "douyu_android" == e.match(/Douyu_Android/i),
            isDyIOS: "douyu_ios" == e.match(/Douyu_IOS/i),
            isIOS: !!e.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/i),
            isIOSHD: e.match(/ipad/i)
        }
    } (),
    y = {
        getQueryString: function(e) {
            var i = new RegExp("(^|&)" + e + "=([^&]*)(&|$)", "i"),
            t = window.location.search.substr(1).match(i);
            return null != t ? unescape(t[2]) : null
        }
    },
    h = {
        API: function(e) {
            window.WeixinJSBridge && window.WeixinJSBridge.invoke ? e(window.WeixinJSBridge) : document.addEventListener("WeixinJSBridgeReady",
            function() {
                e(window.WeixinJSBridge)
            },
            !1)
        },
        versionToNum: function(e) {
            for (var e = e.toString(), i = e.split("."), t = ["", "0", "00", "000", "0000"], o = t.reverse(), n = 0, u = i.length; u > n; n++) {
                var a = i[n].length;
                i[n] = o[a] + i[n]
            }
            var r = i.join("");
            return r
        },
        wxOpenApp: function(e, i) {
            h.API(function(t){
                h.wxGreaterThan("6.5.5") && t.invoke("launchApplication", {
                    schemeUrl: e
                },
                function(e) {
                    e.err_msg.indexOf("launchApplication:fail") > -1 && i && i()
                })
            })
        	
        },
        greaterThan: function(e, i) {
            var t = h.versionToNum(e),
            o = h.versionToNum(i);
            return t > o
        },
        wxGreaterThan: function(e) {
            var i = e || "6.5.5",
            t = /MicroMessenger\/((\d+)\.(\d+)\.(\d+))/i,
            o = m.match(t)[1];
            return !! h.greaterThan(o, i)
        }
    },
    g = function(e) {
        var i = null,
        t = y.getQueryString("downUrl") || "";
        if (l.isIOS) i = e.ios,
        l.isIOSHD && i.iosHD && (i = i.iosHD),
        l.isWX && h.wxGreaterThan("6.5.5") && h.wxOpenApp(i.schema,
        function() {
            location.href = i.url
        }),
        setTimeout(function() {
        	alert(i.schema)
            window.location.href = i.schema
        },
        100),
        c = setTimeout(function() {
        	$(".load-main").css('display','none'); 
            window.location.href = t || i.url
        },
        3e3);
        else if (i = e.android) {
            var o = document.createElement("iframe");
            o.src = i.schema,
            o.style.display = "none",
            document.body.appendChild(o),
            c = setTimeout(function() {
            	$(".load-main").css('display','none'); 
                window.location.href = t || i.url,
                document.removeChild(o)
            },
            3e3)
        }
    };
    document.ready = function(e) {
//    	document.addEventListener("DOMContentLoaded",
//		        function() {
//	            document.removeEventListener("DOMContentLoaded", arguments.callee, !1),
//	            e()
//	        },
//	        !1)
        document.addEventListener ? e(): document.attachEvent ? document.attachEvent("onreadytstatechange",
        function() {
            "complete" == document.readyState && (document.detachEvent("onreadystatechange", arguments.callee), e())
        }) : document.lastChild == document.body && e()
    },document.ready(s);
    var v = function() {
        var e, i = function(e, i) {
            return "" !== e ? e + i.slice(0, 1).toUpperCase() + i.slice(1) : i
        },
        t = function() {
            var t = !1;
            return "number" == typeof window.screenX && ["webkit", "moz", "ms", "o", ""].forEach(function(o) {
                0 == t && void 0 != document[i(o, "hidden")] && (e = o, t = !0)
            }),
            t
        } (),
        o = function() {
            return t ? document[i(e, "hidden")] : void 0
        },
        n = function() {
            return t ? document[i(e, "visibilityState")] : void 0
        };
        return {
            hidden: o(),
            visibilityState: n(),
            visibilitychange: function(i, u) {
                return u = !1,
                t && "function" == typeof i ? document.addEventListener(e + "visibilitychange",
                function(e) {
                    this.hidden = o(),
                    this.visibilityState = n(),
                    i.call(this, e)
                }.bind(this), u) : void 0
            }
        }
    } (void 0);
    v.visibilitychange(function() {
    	$(".load-main").css('display','none'); 
        clearTimeout(c)
    },
    !0)
};