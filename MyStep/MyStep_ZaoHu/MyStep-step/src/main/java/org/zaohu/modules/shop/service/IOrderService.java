package org.zaohu.modules.shop.service;

import org.zaohu.modules.shop.entity.StorageDTO;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;

public interface IOrderService {

    Result<?> createOrder(StorageDTO storageDTO)
            throws BusinessException;

    Result<?> getOrderByUserId(String userId);
}
