package org.zaohu.utils;

import com.alibaba.fastjson.JSONObject;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.lionsoul.ip2region.xdb.Searcher;
import org.zaohu.utils.entity.IpRegion;

import java.io.IOException;
import java.util.Objects;

@Slf4j
public class GetIPAddrUtil {
    //2025/4.29弃用，调用第三方的接口有限制，各种缺点，so，自己实现一个
//    public static String getIpAddr(String ip) {
//        if (ip.equals("localhost")) {
//            ip="127.0.0.1";
//        }
//        CloseableHttpClient aDefault = HttpClients.createDefault();
//                CloseableHttpResponse response=null;
//                try {
//                    response = aDefault
//                            .execute(new HttpGet("https://searchplugin.csdn.net/api/v1/ip/get?ip="+ip));
//                    if (response.getStatusLine().getStatusCode()==200){
//                        String contest = EntityUtils.toString(response.getEntity(), "utf-8");
//                        if (Objects.nonNull(contest)){
//                            JSONObject respObject = JSONObject.parseObject(contest);
//                            Object data = respObject.get("data");
//                            if (Objects.isNull(data)) {
//                                return "未知 未知";
//                            }
//                            JSONObject dataObject = JSONObject.parseObject(data.toString());
//                            Object address = dataObject.get("address");
//                            return address.toString();
//                        }
//                    }
//                } catch (IOException e) {
//                    throw new RuntimeException(e);
//                }
//        return "未知 未知";
//    }
    private static String IP_DATA_PATH="D:\\dev\\idea_project\\My-step\\MyStep\\MyStep_ZaoHu\\file\\ip2region.xdb";
    private static  byte[] contentBuff;

    static {
        try {
            // 从 dbPath 加载整个 xdb 到内存。
            contentBuff = Searcher.loadContentFromFile(IP_DATA_PATH);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 根据ip查询归属地，固定格式：中国|0|浙江省|杭州市|电信
     * @param ip
     * @return
     */
    public static IpRegion getIpRegion(String ip) {
        Searcher searcher = null;
        IpRegion ipRegion = new IpRegion();
        try {
            searcher = Searcher.newWithBuffer(contentBuff);
            String region = searcher.search(ip);
            String[] info = region.split("\\|");
            ipRegion.setCountry(info[0]);
            ipRegion.setArea(info[1]);
            ipRegion.setProvince(info[2]);
            ipRegion.setCity(info[3]);
            ipRegion.setIsp(info[4]);
        } catch (Exception e) {
            log.error("get ip region error: ", e);
        } finally {
            if (searcher != null) {
                try {
                    searcher.close();
                } catch (IOException e) {
                    log.error("close searcher error:", e);
                }
            }
        }
        return ipRegion;
    }

    public static String getIpAddr(String ip) {
        if (ip.equals("localhost")) {
            ip="127.0.0.1";
        }
        CloseableHttpClient aDefault = HttpClients.createDefault();
                CloseableHttpResponse response=null;
                try {
                    response = aDefault
                            .execute(new HttpGet("https://searchplugin.csdn.net/api/v1/ip/get?ip="+ip));
                    if (response.getStatusLine().getStatusCode()==200){
                        String contest = EntityUtils.toString(response.getEntity(), "utf-8");
                        if (Objects.nonNull(contest)){
                            JSONObject respObject = JSONObject.parseObject(contest);
                            Object data = respObject.get("data");
                            if (Objects.isNull(data)) {
                                return "未知 未知";
                            }
                            JSONObject dataObject = JSONObject.parseObject(data.toString());
                            Object address = dataObject.get("address");
                            return address.toString();
                        }
                    }
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
        return "未知 未知";
    }

    public static String getClientIp(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-Forwarded-For");

        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }

        // 对于通过多个代理的情况，第一个IP为客户端真实IP
        if (ipAddress != null && ipAddress.indexOf(",") > 0) {
            ipAddress = ipAddress.split(",")[0];
        }

        return ipAddress;
    }
}
