package org.zaohu.modules.photo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.page.TableDataInfo;
import org.zaohu.constant.controller.BaseController;
import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.service.PhotoService;
import org.zaohu.modules.photoType.entity.PhotoType;
import org.zaohu.modules.photoType.service.PhotoTypeService;

import java.util.List;

import static org.zaohu.utils.PageUtils.startPageNoCount;

/**
 * <p>
 * 照片信息表 前端控制器
 * </p>
 *
 * @author zaohu
 * @since 2025-05-30 20:49:25
 */
@RestController
@RequestMapping("/step/photo")
public class PhotoController extends BaseController {
    @Autowired
    private PhotoService photoService;

    @GetMapping("/getPhoto")
    public TableDataInfo getPhoto(Integer typeId) {
        startPageNoCount();
        List<Photo> photoList = photoService.getPhoto(typeId);
        Long total = photoService.selectCount(typeId);
        TableDataInfo dataTable = getDataTableNoTotal(photoList);
        dataTable.setTotal(total);
        return dataTable;
    }
}
