package org.zaohu.zaohuorder.service.impl;


import io.seata.core.context.RootContext;
import io.seata.spring.annotation.GlobalTransactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;
import org.zaohu.zaohuorder.entity.Order;
import org.zaohu.zaohuorder.feign.AccountServiceFeignClient;
import org.zaohu.zaohuorder.feign.StorageServiceFeignClient;
import org.zaohu.zaohuorder.feign.dto.AccountDTO;
import org.zaohu.zaohuorder.feign.dto.StorageDTO;
import org.zaohu.zaohuorder.mapper.OrderMapper;
import org.zaohu.zaohuorder.service.OrderService;

import java.sql.Timestamp;
import java.util.List;

import static org.zaohu.zaohucommon.ResultEnum.COMMON_FAILED;


@Service
public class OrderServiceImpl implements OrderService {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private AccountServiceFeignClient accountService;

	@Autowired
	private StorageServiceFeignClient storageService;

	@Override
	@GlobalTransactional(name="createOrder",rollbackFor = Exception.class)
	public Result<?> createOrder(String userId, String commodityCode, Integer count) {

		logger.info("[createOrder] current XID: {}", RootContext.getXID());

		// deduct storage
		StorageDTO storageDTO = new StorageDTO();
		storageDTO.setCommodityCode(commodityCode);
		storageDTO.setCount(count);
//		String storage_url="http://tlmall-storage/storage/reduce-stock";
//		Integer storageCode = restTemplate.postForObject(storage_url, storageDTO, Result.class).getCode();

		Integer storageCode = storageService.reduceStock(storageDTO).getCode();
		if (storageCode.equals(COMMON_FAILED.getCode())) {
			throw new BusinessException("stock not enough");
		}

		// deduct balance
		int price = count * 2;
		AccountDTO accountDTO = new AccountDTO();
		accountDTO.setUserId(userId);
		accountDTO.setPrice(price);
//		String account_url="http://tlmall-account/account/reduce-balance";
//		Integer accountCode = restTemplate.postForObject(account_url, accountDTO, Result.class).getCode();

		Integer accountCode = accountService.reduceBalance(accountDTO).getCode();
		if (accountCode.equals(COMMON_FAILED.getCode())) {
			throw new BusinessException("balance not enough");
		}

		// save order
		Order order = new Order();
		order.setUserId(userId);
		order.setCommodityCode(commodityCode);
		order.setCount(count);
		order.setMoney(price);
		order.setCreateTime(new Timestamp(System.currentTimeMillis()));
		order.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		orderMapper.saveOrder(order);
		logger.info("[createOrder] orderId: {}", order.getId());

		return Result.success(order);
	}

	@Override
	public Result<?> getOrderByUserId(String userId) {
		List<Order> list = orderMapper.getOrderByUserId(userId);

		return Result.success(list);
	}

}
