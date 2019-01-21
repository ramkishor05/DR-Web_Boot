package com.work.drdo.pool;



import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.http.HeaderElement;
import org.apache.http.HeaderElementIterator;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicHeaderElementIterator;
import org.apache.http.protocol.HTTP;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.work.drdo.utils.CommonUtil;


public class ConnectionManager {
	private Logger logger = Logger.getLogger(ConnectionManager.class.getCanonicalName());
	private static ConnectionManager poolingConnectionManager = null;
	private PoolingHttpClientConnectionManager pcm = null;
	private CloseableHttpClient closeableHttpClient = null;
	public static synchronized ConnectionManager getPoolingConnectionManager() {
		if (poolingConnectionManager == null) {
			poolingConnectionManager = new ConnectionManager();
		}
		return poolingConnectionManager;
	}
	
	private ConnectionManager () {
		
	}
	
	public void buildConnectionPool() {
		
		pcm = new PoolingHttpClientConnectionManager();
		pcm.setMaxTotal(200);
		pcm.closeExpiredConnections();
		pcm.closeIdleConnections(1000, TimeUnit.MILLISECONDS);
		pcm.setValidateAfterInactivity(1000);
		ConnectionKeepAliveStrategy connectionKeepAliveStrategy = new ConnectionKeepAliveStrategy() {			
			@Override
			public long getKeepAliveDuration(HttpResponse response, HttpContext httpContext) {
				HeaderElementIterator itr = new BasicHeaderElementIterator(response.headerIterator(HTTP.CONN_KEEP_ALIVE));
				while(itr.hasNext()) {
					HeaderElement headerElement = itr.nextElement();
					String param = headerElement.getName();
					String value = headerElement.getValue();
					if (value!=null && "timeout".equalsIgnoreCase(param)) {
						return Long.parseLong(value) * 1000;
					}
				}
				return 5 * 1000;
			}
		};
		RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(1000).setConnectionRequestTimeout(1000).setConnectionRequestTimeout(1000).setExpectContinueEnabled(true).build();
		closeableHttpClient = HttpClientBuilder.create().setKeepAliveStrategy(connectionKeepAliveStrategy).setMaxConnTotal(100).setMaxConnPerRoute(100).setConnectionManager(pcm).setDefaultRequestConfig(requestConfig).build();
		logger.info("Pooling connection manager has been started successfully  [ " + CommonUtil.getCurrentDate() + " ] ");
	}
	
	public void  closeConncetionPool() throws IOException {		
		closeableHttpClient.close();
		pcm.close();	
		logger.info("Pooling connection manager has been stopped successfully [ " + CommonUtil.getCurrentDate() + " ] ");
	}
	
	public String sendMessage (String mobileNumber , String message , String url){
		String str = null;	
		final HttpGet httpGet = new HttpGet(url);
		CloseableHttpResponse closeableHttpResponse = null;
		try {
			closeableHttpResponse = closeableHttpClient.execute(httpGet);
			str = closeableHttpResponse.getStatusLine().getReasonPhrase();
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("Exception arises while sending data [ " + mobileNumber + " ] , [ " + message + " ] "  , e);
		}  finally {
			if (closeableHttpResponse!=null) {
				try {
					EntityUtils.consume(closeableHttpResponse.getEntity());
					closeableHttpResponse.close();
				} catch (IOException e) {
				}				
			}
		}
		return str;
	}
}
