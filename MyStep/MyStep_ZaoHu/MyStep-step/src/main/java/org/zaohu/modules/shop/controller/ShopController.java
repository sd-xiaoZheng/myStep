package org.zaohu.modules.shop.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zaohu.modules.shop.entity.StorageDTO;
import org.zaohu.modules.shop.feign.StorageFeignService;
import org.zaohu.modules.shop.service.impl.OrderServiceImpl;
import org.zaohu.modules.userLogin.entity.User;
import org.zaohu.security.entity.LoginUserDetails;
import org.zaohu.zaohucommon.Result;

/**
 * @author Zaohu
 * @since 2025/2/16
 **/
@Slf4j
@RestController
@RequestMapping("/step")
public class ShopController {
    @Autowired
    private OrderServiceImpl orderService;
    @PostMapping("/create")
    public Result<?> createOrder(@RequestBody StorageDTO storageDTO) {
        LoginUserDetails principal = (LoginUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = principal.getUser();
        orderService.createOrder(storageDTO);
        return Result.success(user);
    }
}
