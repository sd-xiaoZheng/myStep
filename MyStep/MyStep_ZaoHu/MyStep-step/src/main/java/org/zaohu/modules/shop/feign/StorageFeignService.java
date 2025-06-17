package org.zaohu.modules.shop.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.zaohu.config.feign.FeignLogConfig;
import org.zaohu.modules.shop.entity.StorageDTO;
import org.zaohu.zaohucommon.Result;


/**
 * @author Zaohu
 * FeignClient开启openfeign name参数是指定调用rest接口对应的微服务名称 path是coller类上面的接口前缀
 */
@FeignClient(name = "MyStep-storage",path = "/storage",configuration = FeignLogConfig.class)
public interface StorageFeignService {
    @PostMapping("/reduce-stock")
    public Result<?> reduceStock(@RequestBody StorageDTO storageDTO);
}
