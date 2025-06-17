package org.zaohu.zaohuorder.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.zaohu.zaohucommon.Result;
import org.zaohu.zaohuorder.feign.dto.AccountDTO;


@FeignClient(name = "MyStep-account")//这里配置openFeign的调用地址，也就是服务名称，这里会根据名字去nacos服务列表里拉取地址
public interface AccountServiceFeignClient {

	@PostMapping("/account/reduce-balance")
    Result<?> reduceBalance(@RequestBody AccountDTO accountReduceBalanceDTO);
}
