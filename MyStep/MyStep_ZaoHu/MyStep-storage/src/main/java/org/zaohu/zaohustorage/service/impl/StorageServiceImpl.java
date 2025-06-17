/*
 * Copyright 2013-2023 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.zaohu.zaohustorage.service.impl;


import io.seata.core.context.RootContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;
import org.zaohu.zaohustorage.mapper.StorageMapper;
import org.zaohu.zaohustorage.service.StorageService;

import java.sql.Timestamp;


@Service
public class StorageServiceImpl implements StorageService {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private StorageMapper storageMapper;

	/**
	 * 扣减库存
	 * @param commodityCode
	 * @param count
	 * @throws BusinessException
	 */
	@Override
	@Transactional
	public void reduceStock(String commodityCode, Integer count)
			throws BusinessException {
		logger.info("扣减库存");
		logger.info("[reduceStock] current XID: {}", RootContext.getXID());

		checkStock(commodityCode, count);

		Timestamp updateTime = new Timestamp(System.currentTimeMillis());
		int updateCount = storageMapper.reduceStock(commodityCode, count, updateTime);
		if (updateCount == 0) {
			throw new BusinessException("deduct stock failed");
		}
	}

	/**
	 * 剩余库存
	 * @param commodityCode
	 * @return
	 */
	@Override
	public Result<?> getRemainCount(String commodityCode) {
		Integer stock = storageMapper.getStock(commodityCode);
		if (stock == null) {
			return Result.failed("commodityCode wrong,please check commodity code");
		}
		return Result.success(stock);
	}

	private void checkStock(String commodityCode, Integer count)
			throws BusinessException {
		Integer stock = storageMapper.getStock(commodityCode);
		if (stock < count) {
			throw new BusinessException("no enough stock");
		}
	}

}
