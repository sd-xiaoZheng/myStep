package org.zaohu.jobs.schedulJob;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.jsoup.internal.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.zaohu.utils.GetIPAddrUtil;
import org.zaohu.constant.Constant;
import org.zaohu.modules.accessRecord.entity.AccessRecord;
import org.zaohu.modules.accessRecord.service.impl.AccessRecordServiceImpl;
import org.zaohu.utils.entity.IpRegion;
import org.zaohu.utils.text.StringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;

/**
 * @author Step
 */
@Configuration
@EnableScheduling
@RequiredArgsConstructor
/*是否开启定时任务通过application配置文件中的scheduling.enabled配置**/
//@ConditionalOnProperty(prefix = "scheduling", name = "enabled", havingValue = "true")
public class Redis2Mysql {
    @SuppressWarnings("rawtypes")//抑制警告：使用介绍：https://blog.csdn.net/euyy1029/article/details/52511773
    @Resource
    private RedisTemplate redisTemplate;
    @Autowired
    private AccessRecordServiceImpl accessRecordService;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Scheduled(cron = "0 0/15 * * * ?")//每十5分钟一次
    private void getValueByIdsRealTime() {
        Object o = redisTemplate.opsForList().range(Constant.REDIS_VISIT_INFO, 0, -1);
        JSONArray list = (JSONArray) JSONArray.parse(JSON.toJSONString(o));
        ArrayList<AccessRecord> accessRecords = new ArrayList<>();
        for (Object object : list) {
            JSONObject jsonObject = (JSONObject) object;
            AccessRecord accessRecord = new AccessRecord();

            String host = jsonObject.getString("host");
            String port = jsonObject.getString("port");
            String time = jsonObject.getString("time");
            String path = jsonObject.getString("path");
            String urlParam = jsonObject.getString("url_param");
            String accessDate = jsonObject.getString("access_date");

            if (!StringUtil.isBlank(host)) {
                IpRegion ipRegion = GetIPAddrUtil.getIpRegion(host);
                String province = Objects.nonNull(ipRegion.getProvince()) && ipRegion.getProvince().equals("0") ? "未知" : ipRegion.getProvince();
                String city = Objects.nonNull(ipRegion.getCity()) && ipRegion.getCity().equals("0") ? "未知" : ipRegion.getCity();
                accessRecord.setHost(host);
                String[] s = null;
                accessRecord.setCyberCarrier(ipRegion.getIsp());
                accessRecord.setIpAddr(province + city);
            }
            if (!StringUtil.isBlank(port)) {
                accessRecord.setPort(Long.parseLong(port));
            }
            if (!StringUtil.isBlank(time)) {
                accessRecord.setTime(Long.parseLong(time));
            }
            if (!StringUtil.isBlank(path)) {
                accessRecord.setPath(path);
            }
            if (!StringUtil.isBlank(urlParam)) {
                accessRecord.setUrlParam(urlParam);
            }
            if (!StringUtil.isBlank(accessDate)) {
                accessRecord.setAccessDate(LocalDateTime.parse(accessDate, formatter));
            }
            accessRecords.add(accessRecord);
        }
        if (accessRecordService.saveBatch(accessRecords)) {
            redisTemplate.delete(Constant.REDIS_VISIT_INFO);
        }
    }


    //删除数组最后一个元素
    public static String[] removeLastElement(String[] arr) {
        if (arr == null || arr.length == 0) {
            return arr;  // 返回原始数组（空数组或空指针）
        }
        String[] newArr = new String[arr.length - 1];
        System.arraycopy(arr, 0, newArr, 0, arr.length - 1);
        return newArr;
    }
}
