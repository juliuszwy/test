package cp.pay.mj.utils.qxt;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
public class HttpUtils {
	private static CloseableHttpClient httpclient=null;
	
	public static CloseableHttpClient getHttpclient() {
		return httpclient;
	}

	public static void setHttpclient(CloseableHttpClient httpclient) {
		HttpUtils.httpclient = httpclient;
	}
	static final int timeOut = 10 * 1000;
	static {
		PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
		cm.setDefaultMaxPerRoute(200);
		cm.setMaxTotal(1000);
		cm.closeExpiredConnections();
		cm.closeIdleConnections(2, TimeUnit.SECONDS);
		SocketConfig cc = SocketConfig.custom().setSoTimeout(5000).build();
		cm.setDefaultSocketConfig(cc);
		httpclient =HttpClients.custom().setConnectionManager(cm).build();
	}
	

	/**
	 * 发送 post请求访问本地应用并根据传递参数不同返回不同结果
	 */
	// public String post(String url,String respEncoding) {
	// return post(url,"UTF-8",respEncoding,new ArrayList<NameValuePair>());
	// }
	private static void config(HttpRequestBase httpRequestBase) {
        // 设置Header等
        // httpRequestBase.setHeader("User-Agent", "Mozilla/5.0");
        // httpRequestBase
        // .setHeader("Accept",
        // "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
        // httpRequestBase.setHeader("Accept-Language",
        // "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3");// "en-US,en;q=0.5");
        // httpRequestBase.setHeader("Accept-Charset",
        // "ISO-8859-1,utf-8,gbk,gb2312;q=0.7,*;q=0.7");

        // 配置请求的超时设置
        RequestConfig requestConfig = RequestConfig.custom()
                .setConnectionRequestTimeout(timeOut)
                .setConnectTimeout(timeOut).setSocketTimeout(timeOut).build();
        httpRequestBase.setConfig(requestConfig);
    }
	public static void config(HttpRequestBase httpRequestBase,int timeOut) {
        // 设置Header等
        // httpRequestBase.setHeader("User-Agent", "Mozilla/5.0");
        // httpRequestBase
        // .setHeader("Accept",
        // "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
        // httpRequestBase.setHeader("Accept-Language",
        // "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3");// "en-US,en;q=0.5");
        // httpRequestBase.setHeader("Accept-Charset",
        // "ISO-8859-1,utf-8,gbk,gb2312;q=0.7,*;q=0.7");

        // 配置请求的超时设置
        RequestConfig requestConfig = RequestConfig.custom()
                .setConnectionRequestTimeout(timeOut)
                .setConnectTimeout(timeOut).setSocketTimeout(timeOut).build();
        httpRequestBase.setConfig(requestConfig);
    }
	
	/* public static CloseableHttpClient getHttpClient(String url) {
	        String hostname = url.split("/")[2];
	        int port = 80;
	        if (hostname.contains(":")) {
	            String[] arr = hostname.split(":");
	            hostname = arr[0];
	            port = Integer.parseInt(arr[1]);
	        }
	        if (httpclient == null) {
	            synchronized (syncLock) {
	                if (httpClient == null) {
	                    httpClient = createHttpClient(200, 40, 100, hostname, port);
	                }
	            }
	        }
	        return httpclient;
		 return null;
	    }*/
	 
	 
	 public static CloseableHttpClient createHttpClient(int maxTotal,
	            int maxPerRoute, int maxRoute, String hostname, int port) {
	        ConnectionSocketFactory plainsf = PlainConnectionSocketFactory
	                .getSocketFactory();
	        LayeredConnectionSocketFactory sslsf = SSLConnectionSocketFactory
	                .getSocketFactory();
	        Registry<ConnectionSocketFactory> registry = RegistryBuilder
	                .<ConnectionSocketFactory> create().register("http", plainsf)
	                .register("https", sslsf).build();
	        PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager(
	                registry);
	        // 将最大连接数增加
	        cm.setMaxTotal(maxTotal);
	        // 将每个路由基础的连接增加
	        cm.setDefaultMaxPerRoute(maxPerRoute);
	        //HttpHost httpHost = new HttpHost(hostname, port);
	        // 将目标主机的最大连接数增加
	        //cm.setMaxPerRoute(new HttpRoute(httpHost), maxRoute);

	        // 请求重试处理
	        /*HttpRequestRetryHandler httpRequestRetryHandler = new HttpRequestRetryHandler() {
	            public boolean retryRequest(IOException exception,
	                    int executionCount, HttpContext context) {
	                if (executionCount >= 5) {// 如果已经重试了5次，就放弃
	                    return false;
	                }
	                if (exception instanceof NoHttpResponseException) {// 如果服务器丢掉了连接，那么就重试
	                    return true;
	                }
	                if (exception instanceof SSLHandshakeException) {// 不要重试SSL握手异常
	                    return false;
	                }
	                if (exception instanceof InterruptedIOException) {// 超时
	                    return false;
	                }
	                if (exception instanceof UnknownHostException) {// 目标服务器不可达
	                    return false;
	                }
	                if (exception instanceof ConnectTimeoutException) {// 连接被拒绝
	                    return false;
	                }
	                if (exception instanceof SSLException) {// SSL握手异常
	                    return false;
	                }

	                HttpClientContext clientContext = HttpClientContext
	                        .adapt(context);
	                HttpRequest request = clientContext.getRequest();
	                // 如果请求是幂等的，就再次尝试
	                if (!(request instanceof HttpEntityEnclosingRequest)) {
	                    return true;
	                }
	                return false;
	            }
	        };*/

	        CloseableHttpClient httpClient = HttpClients.custom()
	                .setConnectionManager(cm).build();
	        return httpClient;
	    }

	
	public static CloseableHttpResponse post(String url) {
		return post(url, "UTF-8", "UTF-8", new ArrayList<NameValuePair>());
	}

	public static CloseableHttpResponse post(String url, String body)
			throws ClientProtocolException, IOException {
		CloseableHttpResponse response = null;
		// 创建httppost
		HttpPost httppost = new HttpPost(url);
		//config(httppost);
		if(body.contains("{"))
			httppost.setHeader("Content-Type", "application/json");
		else if(body.contains("<"))
			httppost.setHeader("Content-Type","text/xml");
		// 创建参数队列
		StringEntity entity = new StringEntity(body, "UTF-8");
		httppost.setEntity(entity);
		response = httpclient.execute(httppost);
		return response;
	}
	/**
	 * 发送 post请求,设置请求等待时间
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public static  CloseableHttpResponse post(String url,String body,int ReqTime,int respTime ) throws ClientProtocolException, IOException {
		System.out.println(url);
		CloseableHttpResponse response = null;
		String resStr = "";
			// 创建httpget.
			HttpPost httppost = new HttpPost(url);
			//设置请求时间
			RequestConfig  requestConfig=RequestConfig.custom().setSocketTimeout(ReqTime).setConnectTimeout(respTime).build();
			if(body.contains("{"))
				httppost.setHeader("Content-Type", "application/json");
			else if(body.contains("<"))
				httppost.setHeader("Content-Type","text/xml");
			// 创建参数队列
			StringEntity entity = new StringEntity(body, "UTF-8");
			httppost.setEntity(entity);
			response = httpclient.execute(httppost);
		return response;
	}
	
	public static CloseableHttpResponse post(String url, String body,Map<String,String> heards)
			throws ClientProtocolException, IOException {
		CloseableHttpResponse response = null;
		// 创建httppost
		HttpPost httppost = new HttpPost(url);
		for(String key:heards.keySet()){
			httppost.setHeader(key, heards.get(key));
		}
		//config(httppost);
		if(body.contains("{"))
			httppost.setHeader("Content-Type", "application/json");
		else if(body.contains("<"))
			httppost.setHeader("Content-Type","text/xml");
		// 创建参数队列
		StringEntity entity = new StringEntity(body, "UTF-8");
		httppost.setEntity(entity);
		response = httpclient.execute(httppost);
		return response;
	}
	
	public static CloseableHttpResponse post(String url, List<NameValuePair> param)
			throws ClientProtocolException, IOException {
		return post(url, "UTF-8", "UTF-8", param);
	}

	/**
	 * 发送 post请求访问本地应用并根据传递参数不同返回不同结果
	 */
	public static CloseableHttpResponse post(String url, String reqEncoding, String respEncoding, List<NameValuePair> param) {
		CloseableHttpResponse response = null;
		// 创建httppost
		HttpPost httppost = new HttpPost(url);
		//config(httppost);
		// 创建参数队列
		List<NameValuePair> formparams = param;
		UrlEncodedFormEntity uefEntity;
		try {
			uefEntity = new UrlEncodedFormEntity(formparams, reqEncoding);
			httppost.setEntity(uefEntity);
			response = httpclient.execute(httppost);
			// HttpEntity entity = response.getEntity();
			// if (entity != null) {
			// resStr = EntityUtils.toString(entity,respEncoding);
			// }
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
		}
		return response;
	}

	/**
	 * 发送 get请求
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public static  CloseableHttpResponse get(String url) throws ClientProtocolException, IOException {
		System.out.println(url);
		CloseableHttpResponse response = null;
		String resStr = "";
			// 创建httpget.
			HttpGet httpget = new HttpGet(url);
			//config(httpget);
			// 执行get请求.
			response = httpclient.execute(httpget);
		return response;
	}
	/**
	 * 发送 get请求,设置请求等待时间
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public static  CloseableHttpResponse get(String url,int ReqTime,int respTime ) throws ClientProtocolException, IOException {
		System.out.println(url);
		CloseableHttpResponse response = null;
		String resStr = "";
			// 创建httpget.
			HttpGet httpget = new HttpGet(url);
			//config(httpget);
			RequestConfig  requestConfig=RequestConfig.custom().setSocketTimeout(ReqTime).setConnectTimeout(respTime).build();
			httpget.setConfig(requestConfig);
			// 执行get请求.
			response = httpclient.execute(httpget);
			
		return response;
	}
	
	public static  CloseableHttpResponse get(String url,Map<String,String> heards) throws ClientProtocolException, IOException {
		System.out.println(url);
		CloseableHttpResponse response = null;
		String resStr = "";
			// 创建httpget.
			HttpGet httpget = new HttpGet(url);
			for(String key:heards.keySet()){
				httpget.setHeader(key, heards.get(key));
			}
			//config(httpget);
			// 执行get请求.
			response = httpclient.execute(httpget);
		return response;
	}
}