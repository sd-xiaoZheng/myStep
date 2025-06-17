package org.zaohu.webBug.httpClient;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * 该功能运行只能获取html页面简单数据
 *
 *
 */
public class httpClient {
    public static void main(String[] args) {
        CloseableHttpClient aDefault = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=0");
        CloseableHttpResponse response=null;
        try {
            response = aDefault.execute(httpGet);

            if (response.getStatusLine().getStatusCode()==200){
                String contest = EntityUtils.toString(response.getEntity(), "utf-8");
                System.out.println(contest);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                response.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
