package org.zaohu.modules.step.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.step.service.IFunQuestionService;


/**
 * 该接口类是测试功能的，
 */
@RestController
@RequestMapping("/step")
@CrossOrigin//TODO ？什么东西
@RequiredArgsConstructor
public class FunQuestionController {

	private final IFunQuestionService funQuestionMapper;

	@GetMapping("Hello")
	public Result<?> reduceBalance() {
		return funQuestionMapper.getQuestion();
	}
}
