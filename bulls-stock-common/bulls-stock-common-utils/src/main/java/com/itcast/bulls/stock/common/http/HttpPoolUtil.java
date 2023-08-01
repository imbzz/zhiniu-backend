package com.itcast.bulls.stock.common.http;

import org.apache.http.Consts;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.SSLException;
import java.io.*;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * HTTP线程池连接工具
 */

public class HttpPoolUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(HttpPoolUtil.class);

    /**
     * 连接管理器
     */
	private PoolingHttpClientConnectionManager connectionManager;

    /**
     * http client 客户端
     */
	private CloseableHttpClient client ;


    /**
     * 连接配置 -- 全局最大并发数
     */
	private final static Integer maxTotalConn = 100;

    /**
     * 连接配置 -- 每主机最大并发数
     */
	private final static Integer maxConnPerHost = 30;

    /**
     * 连接配置 -- 连接超时时间, 20s
     */
	private final static Integer connectionTimeout = 20 * 1000;

    /**
     * 单例的封装, 避免并发的原子性问题
     */
	private volatile static HttpPoolUtil httpPoolUtil = null;

    /**
     * 模拟的浏览器代理标识
     */
    public static String defaultUserAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";


    /**
     * HTTP连接池管理工具的初始化
     */
	private HttpPoolUtil() {
		
		connectionManager = new PoolingHttpClientConnectionManager();

        //最大连接数
        connectionManager.setMaxTotal(maxTotalConn);
        //默认的每个路由的最大连接数
        connectionManager.setDefaultMaxPerRoute(maxConnPerHost);


        RequestConfig defaultRequestConfig = RequestConfig.custom()
                .setConnectTimeout(connectionTimeout)         //连接超时时间
                .setSocketTimeout(connectionTimeout)          //读超时时间（等待数据超时时间）
                .setConnectionRequestTimeout(500)    //从池中获取连接超时时间(时间单位是毫秒)
                .build();

        // 连接存活的配置策略
        ConnectionKeepAliveStrategy connectionKeepAliveStrategy = new ConnectionKeepAliveStrategy() {
            @Override
            public long getKeepAliveDuration(org.apache.http.HttpResponse httpResponse,
                                             HttpContext httpContext) {
                return 20 * 1000; // 20 seconds,because tomcat default keep-alive timeout is 20s
            }
        };

        // 创建 http client 连接
        client = HttpClients.custom()
                .setConnectionManager(connectionManager)             //连接管理器
                .setDefaultRequestConfig(defaultRequestConfig) //默认请求配置
                .setRetryHandler(getDefaultRequestRetryHandler()) //重试策略
                .setKeepAliveStrategy(connectionKeepAliveStrategy)  // 连接池存活策略
                .build();

	}


    /**
     * http 请求的重试策略
     * @return
     */
	public HttpRequestRetryHandler getDefaultRequestRetryHandler() {

        HttpRequestRetryHandler myRetryHandler = new HttpRequestRetryHandler() {

            @Override
            public boolean retryRequest(IOException exception, int executionCount, HttpContext context) {
                //Do not retry if over max retry count
                if (executionCount >= 3) {
                    return false;
                }
                //Timeout
                if (exception instanceof InterruptedIOException) {
                    return false;
                }
                //Unknown host
                if (exception instanceof UnknownHostException) {
                    return false;
                }
                //Connection refused
                if (exception instanceof ConnectTimeoutException) {
                    return false;
                }
                //SSL handshake exception
                if (exception instanceof SSLException) {
                    return false;
                }

                if (exception instanceof org.apache.http.NoHttpResponseException) {
                    logger.warn("No response from server on " + executionCount + " call");
                    return true;
                }

                HttpClientContext clientContext = HttpClientContext.adapt(context);
                HttpRequest request = clientContext.getRequest();
                boolean idempotent = !(request instanceof HttpEntityEnclosingRequest);
                //Retry if the request is considered idempotent
                //如果请求类型不是HttpEntityEnclosingRequest，被认为是幂等的，那么就重试
                //HttpEntityEnclosingRequest指的是有请求体的request，比HttpRequest多一个Entity属性
                //而常用的GET请求是没有请求体的，POST、PUT都是有请求体的
                //Rest一般用GET请求获取数据，故幂等，POST用于新增数据，故不幂等
                if (idempotent) {
                    return true;
                }

                return false;
            }
        };

        return myRetryHandler;
    }


    /**
	 * 单例（能够保障线程的安全性）
	 * 方法用途: <br>
	 * 实现步骤: <br>
	 * @return
	 */
	public static HttpPoolUtil getSingleton() {  
    	
	    if (httpPoolUtil == null) {  
	        synchronized (HttpPoolUtil.class) {  
		        if (httpPoolUtil == null) {  
		        	httpPoolUtil = new HttpPoolUtil();  
		        }  
	        }  
	    }  
	    return httpPoolUtil;
    }


    /**
     * HTTP POST 调用
     * 方法用途: <br>
     * 实现步骤: <br>
     * @return
     * @throws Exception
     */
    public HttpResult postEntityWithAgent(String url, String params) throws Exception {

        return postEntity(url, params, defaultUserAgent);
    }

    /**
     * HTTP POST 调用
     * 方法用途: <br>
     * 实现步骤: <br>
     * @return
     * @throws Exception
     */
    public  HttpResult postEntity(String url, String params) throws Exception {
        return postEntity(url, params, null);
    }

    /**
     * HTTP POST 调用
     * 方法用途: <br>
     * 实现步骤: <br>
     * @return
     * @throws Exception
     */
    private  HttpResult postEntity(String url, String params, String agent) throws Exception {

        HttpResult ret = new HttpResult();

        HttpPost method = new HttpPost(url);
        InputStream is = null;
        CloseableHttpResponse httpResponse = null;
        try {
            if(null != agent) {
                method.setHeader("User-Agent", agent);
            }
            method.setEntity(new StringEntity(params, Consts.UTF_8));
            long begin = System.currentTimeMillis();

            httpResponse = client.execute(method);

            ret.setResponseCode(httpResponse.getStatusLine().getStatusCode());

            // 如果返回的是200，则正常处理
            if (null != httpResponse.getEntity()&& null != httpResponse.getEntity().getContent()) {

                is = httpResponse.getEntity().getContent();
                BufferedReader br= new BufferedReader(new InputStreamReader(is, "utf-8"));
                StringBuffer buf = new StringBuffer(1024);
                String returnMsg="";
                while (null != (returnMsg = br.readLine()))
                {
                    buf.append(returnMsg);
                }

                ret.setBody(buf.toString());

            }

            logger.info("HttpPoolUtil 远程调用 耗费时间:" +  (System.currentTimeMillis() - begin) + "毫秒, URL地址: " + url);

        }catch(Exception e) {
            logger.error(e.getMessage(), e);
            throw e;
        }finally {

            if(is != null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            if(httpResponse != null){
                try {
                    httpResponse.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            method.releaseConnection();

        }

        return ret;
    }


    /**
     * HTTP GET 调用
     * 方法用途: <br>
     * 实现步骤: <br>
     * @return
     * @throws Exception
     */
    public HttpResult get(String url, Map<String, String> params) throws Exception {

        HttpResult ret = new HttpResult();

        HttpGet method = new HttpGet();
        InputStream is = null;
        CloseableHttpResponse httpResponse = null;
        try {

            if(null != params && params.size() > 0) {
                List<NameValuePair> listParams = new ArrayList<>();
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    // 设置参数
                    listParams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
                }

                String urlParams = EntityUtils.toString(new UrlEncodedFormEntity(listParams, Consts.UTF_8));

                url = url + "?" + urlParams;

            }
            long begin = System.currentTimeMillis();
            method.setURI(URI.create(url));
            httpResponse = client.execute(method);

            ret.setResponseCode(httpResponse.getStatusLine().getStatusCode());

            // 如果返回的是200，则正常处理
            if (null != httpResponse.getEntity()&& null != httpResponse.getEntity().getContent()) {

                is = httpResponse.getEntity().getContent();
                BufferedReader br= new BufferedReader(new InputStreamReader(is, "utf-8"));
                StringBuffer buf = new StringBuffer(1024);
                String returnMsg="";
                while (null != (returnMsg = br.readLine()))
                {
                    buf.append(returnMsg);
                }

                ret.setBody(buf.toString());

            }

            logger.info("HttpPoolUtil 远程调用 耗费时间:" +  (System.currentTimeMillis() - begin) + "毫秒, URL地址: " + url);

        }catch(Exception e) {
            logger.error(e.getMessage(), e);
            throw e;
        }finally {

            if(is != null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            if(httpResponse != null){
                try {
                    httpResponse.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            method.releaseConnection();

        }

        return ret;
    }


    /**
     * HTTP POST 调用
     * 方法用途: <br>
     * 实现步骤: <br>
     * @return
     * @throws Exception
     */
    public HttpResult post(String url, Map<String, String> params) throws Exception {
        return post(url, params, null);
    }

    /**
     * HTTP POST 调用, 附带agent信息
     * 方法用途: <br>
     * 实现步骤: <br>
     * @return
     * @throws Exception
     */
    public HttpResult postWithAgent(String url, Map<String, String> params) throws Exception {
        return post(url, params, defaultUserAgent);
    }

    /**
	 * HTTP POST 调用
	 * 方法用途: <br>
	 * 实现步骤: <br>
	 * @return
	 * @throws Exception
	 */
	private HttpResult post(String url, Map<String, String> params, String userAgent) throws Exception {
		
		HttpResult ret = new HttpResult();
		
		HttpPost method = new HttpPost(url);
        InputStream is = null;
        CloseableHttpResponse httpResponse = null;
		try {
            if(null != userAgent) {
                method.setHeader("User-Agent", userAgent);
            }
		    if(null != params && params.size() > 0) {
                List<NameValuePair> listParams = new ArrayList<>();
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    // 设置参数
                    listParams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
                }

                method.setEntity(new UrlEncodedFormEntity(listParams, Consts.UTF_8));
            }
            long begin = System.currentTimeMillis();

            httpResponse = client.execute(method);

			ret.setResponseCode(httpResponse.getStatusLine().getStatusCode());

			// 如果返回的是200，则正常处理
			if (null != httpResponse.getEntity()&& null != httpResponse.getEntity().getContent()) {

                is = httpResponse.getEntity().getContent();
                BufferedReader br= new BufferedReader(new InputStreamReader(is, "utf-8"));
				StringBuffer buf = new StringBuffer(1024);
				String returnMsg="";
				while (null != (returnMsg = br.readLine()))
				{
					buf.append(returnMsg);
				}

				ret.setBody(buf.toString());

			}

			logger.info("HttpPoolUtil 远程调用 耗费时间:" +  (System.currentTimeMillis() - begin) + "毫秒, URL地址: " + url);
			
		}catch(Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}finally {

            if(is != null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            if(httpResponse != null){
                try {
                    httpResponse.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            method.releaseConnection();

		}
		
		return ret;
	}


	/**
	 * 封装HTTP返回值
	 * @author gongchao
	 * @version Revision: 0.01  Date: 2011-12-21 下午3:09:18
	 */
	public static class HttpResult
	{
		private String body;

		private int responseCode;

		public String getBody()
		{

			return body;
		}

		public void setBody(String body)
		{

			this.body = body;
		}

		public int getResponseCode()
		{

			return responseCode;
		}

		public void setResponseCode(int responseCode)
		{

			this.responseCode = responseCode;
		}

	}

    public static void main(String[] args) throws Exception{
        Long start = System.currentTimeMillis();
        Thread.sleep(3000L);
        System.out.println(System.currentTimeMillis() - start);
    }
}
