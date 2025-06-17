package org.zaohu.modules.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zaohu.modules.shop.entity.StorageDTO;
import org.zaohu.modules.shop.feign.StorageFeignService;
import org.zaohu.modules.shop.service.IOrderService;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;

/**
 * @author Zaohu
 * @since 2025/2/16
 **/
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private StorageFeignService storageFeignService;

    @Override
    public Result<?> createOrder(StorageDTO storageDTO) throws BusinessException {
        storageFeignService.reduceStock(storageDTO);
        System.out.println(storageDTO);
        return null;
    }

    @Override
    public Result<?> getOrderByUserId(String userId) {
        return null;
    }
}
