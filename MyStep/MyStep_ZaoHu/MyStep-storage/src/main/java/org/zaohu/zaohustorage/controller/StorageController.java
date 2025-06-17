package org.zaohu.zaohustorage.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.zaohucommon.BusinessException;
import org.zaohu.zaohucommon.Result;
import org.zaohu.zaohustorage.dto.StorageDTO;
import org.zaohu.zaohustorage.service.StorageService;


@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/storage")
public class StorageController {

    @Autowired
    private StorageService storageService;

    @PostMapping("/reduce-stock")
    public Result<?> reduceStock(@RequestBody StorageDTO storageDTO) {
        try {
            log.info("下单成功测试");
        } catch (BusinessException e) {
            return Result.failed(e.getMessage());
        }
        return Result.success("");
    }


}
