package org.zaohu.modules.photo.controller;

import com.drew.imaging.ImageProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.common.page.TableDataInfo;
import org.zaohu.constant.controller.BaseController;
import org.zaohu.modules.photo.entity.Photo;
import org.zaohu.modules.photo.service.PhotoService;

import java.io.IOException;
import java.util.List;

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

    /**
     * 收藏照片接口
     * @param photoId 相册id
     * @return
     */
    @PostMapping("/likePhoto")
    public Result likePhoto(@RequestBody Integer photoId) {
        photoService.likePhoto(photoId);
        return Result.success();
    }
    /**
     * 收藏照片接口
     * @param photoId 相册id
     * @return
     */
    @PostMapping("/UnLikePhoto")
    public Result UnLikePhoto(@RequestBody Integer photoId) {
        photoService.UnLikePhoto(photoId);
        return Result.success();
    }

    /**
     * 修改照片接口
     * @param photo 相册修改内容
     * @return Result
     */
    @PostMapping("/updatePhoto")
    public Result updatePhoto(@ModelAttribute Photo photo) throws ImageProcessingException, IOException {
        photoService.updatePhoto(photo);
        return Result.success();
    }

    /**
     * 删除照片接口
     * @param photo 删除的照片包括归属的typeId
     * @return Result
     */
    @PostMapping("/deletePhoto")
    public Result deletePhoto(@RequestBody Photo photo){
        photoService.deletePhoto(photo);
        return Result.success();
    }
}
