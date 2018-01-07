package com.scinter.www.util;

import java.util.UUID;
import java.util.Map;
import java.util.HashMap;
import java.util.Formatter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.UnsupportedEncodingException;  

class Sign {
    public static void main(String[] args) {
    	
    	String appId = "wx476d18abaeb2bdbc"; // 必填，公众号的唯一标识
        String secret = "dab0a721dffb5cd00f985c08ec88ad88";
        String jsapi_ticket = "jsapi_ticket";
        // 注意 URL 一定要动态获取，不能 hardcode
        String url = "http://example.com";
        
        
        
//        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+secret+"&code="+wxCode+"&grant_type=authorization_code";
//        //第一次请求 获取access_token 和 openid
//        String  oppid = new HttpRequestor().doGet(requestUrl);
//        JSONObject oppidObj =JSONObject.fromObject(oppid);
//        String access_token = (String) oppidObj.get("access_token");
//        String openid = (String) oppidObj.get("openid");
//        String requestUrl2 = "https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
//        String userInfoStr = new HttpRequestor().doGet(requestUrl2);
//        JSONObject wxUserInfo =JSONObject.fromObject(userInfoStr); 
//        
//        Map<String, String> ret = sign(jsapi_ticket, url);
//        for (Map.Entry entry : ret.entrySet()) {
//            System.out.println(entry.getKey() + ", " + entry.getValue());
//        }
    };

    public static Map<String, String> sign(String jsapi_ticket, String url) {
        Map<String, String> ret = new HashMap<String, String>();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";

        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                  "&noncestr=" + nonce_str +
                  "&timestamp=" + timestamp +
                  "&url=" + url;
        System.out.println(string1);

        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }

        ret.put("url", url);
        ret.put("jsapi_ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);

        return ret;
    }

    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
}
