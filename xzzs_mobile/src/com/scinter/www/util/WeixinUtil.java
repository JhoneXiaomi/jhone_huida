package com.scinter.www.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

public class WeixinUtil {
    
    /**
     * 获取微信服务器的接口的信息
     * 
     * @author JhoneZhang
     * @date   2016年12月4日下午3:29:13
     * @param requestUrl
     * @param requestMethod
     * @param outputStr
     * @return
     */
    public static JSONObject httpRequest(String requestUrl,String requestMethod, String outputStr) {
    	
        JSONObject jsonObject = null;
        StringBuffer buffer = new StringBuffer();
        try {
            TrustManager[] tm = { new MyX509TrustManager() };
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
            sslContext.init(null, tm, new java.security.SecureRandom());
            SSLSocketFactory ssf = sslContext.getSocketFactory();
            URL url = new URL(requestUrl);
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
            httpUrlConn.setSSLSocketFactory(ssf);
            httpUrlConn.setDoOutput(true);
            httpUrlConn.setDoInput(true);
            httpUrlConn.setUseCaches(false);
            httpUrlConn.setRequestMethod(requestMethod);
            if ("GET".equalsIgnoreCase(requestMethod))
                httpUrlConn.connect();
            if (null != outputStr) {
                OutputStream outputStream = httpUrlConn.getOutputStream();
                outputStream.write(outputStr.getBytes("UTF-8"));
                outputStream.close();
            }
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            bufferedReader.close();
            inputStreamReader.close();
            inputStream.close();
            inputStream = null;
            httpUrlConn.disconnect();
            jsonObject = JSONObject.fromObject(buffer.toString());
        } catch (ConnectException ce) {
            ce.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    
    /**
     * 获取微信config 的配置信息
     * 
     * @author JhoneZhang
     * @date   2016年12月4日下午4:14:03
     * @param request
     * @return
     */
    public static Map<String, Object> getWxConfig(HttpServletRequest request) {
        Map<String, Object> ret = new HashMap<String, Object>();
      
        String appId = "wx476d18abaeb2bdbc"; // 必填，公众号的唯一标识
        String secret = "dab0a721dffb5cd00f985c08ec88ad88";
        String requestUrl = request.getRequestURL().toString();
        String access_token = "";
        String jsapi_ticket = "";
        String timestamp = Long.toString(System.currentTimeMillis() / 1000); // 必填，生成签名的时间戳
        String nonceStr = UUID.randomUUID().toString(); // 必填，生成签名的随机串
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+ appId + "&secret=" + secret;
        
        JSONObject json = WeixinUtil.httpRequest(url, "GET", null);
        
        if (json != null) {
            //要注意，access_token需要缓存
            access_token = json.getString("access_token");
            
            url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+ access_token + "&type=jsapi";
            json = WeixinUtil.httpRequest(url, "GET", null);
            if (json != null) {
                jsapi_ticket = json.getString("ticket");
            }
        }
        String signature = "";
        // 注意这里参数名必须全部小写，且必须有序
        String sign = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonceStr+ "&timestamp=" + timestamp + "&url=" + requestUrl;
        try {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(sign.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ret.put("appId", appId);
        ret.put("timestamp", timestamp);
        ret.put("nonceStr", nonceStr);
        ret.put("signature", signature);
        return ret;
    }

    
    /**
    * 方法名：byteToHex</br>
    * 详述：字符串加密辅助方法 </br>
    * 开发人员：souvc  </br>
    * 创建时间：2016-1-5  </br>
    * @param hash
    * @return 说明返回值含义
    * @throws 说明发生此异常的条件
     */
    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash) {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;

    }
}