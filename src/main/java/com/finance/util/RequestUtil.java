package com.finance.util;

/**
 * Created By: Comwave Project Team Created Date: Dec 21, 2015
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * The Class RequestUtil.
 */
public class RequestUtil {

  // private static ServletOutputStream outputStream;

  private final static Logger logger = LoggerFactory.getLogger(RequestUtil.class);

  public static void main(String[] args) {
    Map<String, String> parms = new HashMap<String, String>();
    parms.put("userId", "bpmadmin");
    parms.put("sysCode", "bpm");
    parms.put("userKey", "+sadf+234fds+asf");
    // try {
    // RequestUtil.httpClientPost("http://localhost:8080/portal/eaiservice/fetchUser?",parms);
    // } catch (Exception e) {
    // // TODO Auto-generated catch block
    // e.printStackTrace();
    // }
  }

  //
  // public static String httpClientPost(String url, Map<String, String> paramsMap) throws Exception
  // {
  // CloseableHttpClient client = HttpClients.createDefault();
  // try {
  // HttpPost httpPost = new HttpPost(url);
  // if (paramsMap != null) {
  // List<NameValuePair> params = new ArrayList<NameValuePair>();
  // for (String key : paramsMap.keySet()) {
  // params.add(new BasicNameValuePair(key, paramsMap.get(key)));
  // }
  // httpPost.setEntity(new UrlEncodedFormEntity(params));
  // }
  // CloseableHttpResponse response = client.execute(httpPost);
  // return IOUtils.toString(response.getEntity().getContent());
  // } finally {
  // try {
  // client.close();
  // } catch (Exception e) {
  // }
  // }
  // }

  /**
   * 向指定URL发送GET方法的请求.
   * 
   * @param url 发送请求的URL
   * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
   * @return URL 所代表远程资源的响应结果
   */
  public static String sendGet(String url, String param) {
    String result = "";
    BufferedReader in = null;
    try {
      String urlNameString = url + "?" + param;
      URL realUrl = new URL(urlNameString);
      logger.info("urlNameString:" + urlNameString);
      // 打开和URL之间的连接
      URLConnection connection = realUrl.openConnection();
      // 设置通用的请求属性
      connection.setRequestProperty("accept", "*/*");
      connection.setRequestProperty("connection", "Keep-Alive");
      connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
      // 建立实际的连接
      connection.connect();
      // 获取所有响应头字段
      Map<String, List<String>> map = connection.getHeaderFields();
      // 遍历所有的响应头字段
      for (String key : map.keySet()) {
        System.out.println(key + "--->" + map.get(key));
      }
      // 定义 BufferedReader输入流来读取URL的响应
      in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
      String line;
      while ((line = in.readLine()) != null) {
        result += line;
      }
    } catch (Exception e) {
      //System.out.println("发送GET请求出现异常！" + e);
      logger.error("发送GET请求出现异常！",e);
      //e.printStackTrace();
    }
    // 使用finally块来关闭输入流
    finally {
      try {
        if (in != null) {
          in.close();
        }
      } catch (Exception e2) {
        //e2.printStackTrace();
        logger.error("发送GET请求出现异常！",e2);
      }
    }
    return result.trim();
  }

  /**
   * 向指定 URL 发送POST方法的请求.
   * 
   * @param postUrl the post url
   * @return 所代表远程资源的响应结果
   */
  public static String sendPost(String postUrl) {
    String[] urlArr = postUrl.split("\\?");
    String url = urlArr[0];
    String param = urlArr.length > 1 ? urlArr[1] : "";
    PrintWriter out = null;
    BufferedReader in = null;
    String result = "";
    try {
      URL realUrl = new URL(url);
      // 打开和URL之间的连接
      URLConnection conn = realUrl.openConnection();
      // 设置通用的请求属性
      conn.setRequestProperty("accept", "*/*");
      conn.setRequestProperty("connection", "Keep-Alive");
      conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
      // 发送POST请求必须设置如下两行
      conn.setDoOutput(true);
      conn.setDoInput(true);
      // 获取URLConnection对象对应的输出流
      out = new PrintWriter(conn.getOutputStream());
      // 发送请求参数
      out.print(param);
      // flush输出流的缓冲
      out.flush();
      // 定义BufferedReader输入流来读取URL的响应
      in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line;
      while ((line = in.readLine()) != null) {
        result += line;
      }
    } catch (Exception e) {
      //System.out.println("发送 POST 请求出现异常！" + e);
      logger.error("发送POST请求出现异常！",e.getMessage());
      //e.printStackTrace();
    }
    // 使用finally块来关闭输出流、输入流
    finally {
      try {
        if (out != null) {
          out.close();
        }
        if (in != null) {
          in.close();
        }
      } catch (IOException ex) {
        //ex.printStackTrace();
        logger.error("发送POST请求出现异常！",ex);
      }
    }
  //  logger.info("post url" + postUrl + ",result:" + result);
    return result;
  }

  
  /**  
   * 根据名字获取cookie  
   * @param request  
   * @param name cookie名字  
   * @return  
   */  
  public static Cookie getCookieByName(HttpServletRequest request,String name){  
      Map<String,Cookie> cookieMap = ReadCookieMap(request);  
      if(cookieMap.containsKey(name)){  
          Cookie cookie = (Cookie)cookieMap.get(name);  
          return cookie;  
      }else{  
          return null;  
      }    
  }  
  
  public static void delCookieByName(HttpServletResponse response,String name){  
	  Cookie killMyCookie = new Cookie(name, null);
      killMyCookie.setMaxAge(0);
      killMyCookie.setPath("/");
      response.addCookie(killMyCookie);
  } 
      
      
      
  /**  
   * 将cookie封装到Map里面  
   * @param request  
   * @return  
   */  
  private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){    
      Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();  
      Cookie[] cookies = request.getCookies();  
      if(null!=cookies){  
          for(Cookie cookie : cookies){  
              cookieMap.put(cookie.getName(), cookie);  
          }  
      }  
      return cookieMap;  
  }  


  /**
   * 向指定URL发送GET方法的请求.
   * 
   * @param url 发送请求的URL
   * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
   * @return URL 所代表远程资源的响应结果
   */
  public static void sendGetStream(String url, String param, OutputStream os) {

    InputStream in = null;
    try {
      String urlNameString = url + "?" + param;
      URL realUrl = new URL(urlNameString);
      logger.info("request url:" + urlNameString);
      // 打开和URL之间的连接
      URLConnection connection = realUrl.openConnection();
      // 设置通用的请求属性
      connection.setRequestProperty("accept", "*/*");
      connection.setRequestProperty("connection", "Keep-Alive");
      connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
      // 建立实际的连接
      connection.connect();
      // 获取所有响应头字段
      Map<String, List<String>> map = connection.getHeaderFields();
      // 遍历所有的响应头字段
      for (String key : map.keySet()) {
        System.out.println(key + "--->" + map.get(key));
      }
      // 定义 BufferedReader输入流来读取URL的响应
      in = connection.getInputStream();
      int i = 0;
      OutputStream outputStream = os;
      while ((i = in.read()) != -1) {
        outputStream.write(i);
      }
    } catch (Exception e) {
      logger.error("发送GET请求出现异常！",e);
      //e.printStackTrace();
    }
    // 使用finally块来关闭输入流
    finally {
      try {
        if (in != null) {
          in.close();
        }
      } catch (Exception e2) {
        //e2.printStackTrace();
        logger.error("发送GET请求出现异常！",e2);
      }
    }
  }
}
