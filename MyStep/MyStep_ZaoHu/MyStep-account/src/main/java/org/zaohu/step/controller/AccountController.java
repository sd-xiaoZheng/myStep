package org.zaohu.step.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.step.dto.AccountDTO;
import org.zaohu.step.service.AccountService;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;


@RestController
@RequestMapping("/account")
@CrossOrigin
public class AccountController {

	@Autowired
	private AccountService accountService;

	@PostMapping("/reduce-balance")
	public Result<?> reduceBalance(@RequestBody AccountDTO accountDTO) {
		try {
			accountService.reduceBalance(accountDTO.getUserId(), accountDTO.getPrice());
		}
		catch (BusinessException e) {
			return Result.failed(e.getMessage());
		}
		return Result.success("");
	}

	@GetMapping("/")
	public Result<?> getRemainAccount(@RequestParam("userId") String userId) {
		return accountService.getRemainAccount(userId);
	}

}
