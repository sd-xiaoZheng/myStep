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

package org.zaohu.zaohuorder.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;
import org.zaohu.zaohuorder.service.OrderService;


@CrossOrigin
@RestController
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@PostMapping("/create")
	public Result<?> createOrder(@RequestParam("userId") String userId,
			@RequestParam("commodityCode") String commodityCode,
			@RequestParam("count") Integer count) {
		Result<?> res = null;
		try {
			res = orderService.createOrder(userId, commodityCode, count);
		}
		catch (BusinessException e) {
			return Result.failed(e.getMessage());
		}
		return res;
	}


	@GetMapping("/getOrder")
	public Result<?> getOrder(@RequestParam("userId") String userId) {
		Result<?> res = null;
		try {
			res = orderService.getOrderByUserId(userId);
		}
		catch (BusinessException e) {
			return Result.failed(e.getMessage());
		}
		return res;
	}

}
