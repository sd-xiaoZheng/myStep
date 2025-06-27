package org.zaohu.modules.photoType.controller;

import com.drew.imaging.ImageProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.common.entity.PhotoBatch;
import org.zaohu.common.entity.PhotoNew;
import org.zaohu.common.page.TableDataInfo;
import org.zaohu.constant.controller.BaseController;
import org.zaohu.modules.photoType.entity.PhotoType;
import org.zaohu.modules.photoType.service.PhotoTypeService;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 * 照片类型表，用于分类照片（如风景、人像等） 前端控制器
 * </p>
 *
 * @author zaohu
 * @since 2025-06-01 15:04:57
 */
@RestController
@RequestMapping("/step/photoType")
@CrossOrigin
public class PhotoTypeController extends BaseController {
    @Autowired
    private PhotoTypeService photoTypeService;

    /**
     * @param photoType
     * @return
     * @ModelAttribute 可以接收表单、URL 参数、multipart/form-data 类型的数据，并把这些值绑定到一个 Java 对象里。
     */
    @PostMapping("/addPhotoType")
    public Result addPhotoType(@ModelAttribute PhotoType photoType) {
        photoTypeService.addPhotoType(photoType);
        return Result.success();
    }

    @PostMapping("/editPhotoType")
    public Result editPhotoType(@ModelAttribute PhotoType photoType) {
        photoTypeService.editPhotoType(photoType);
        return Result.success();
    }

    @GetMapping("/getPhotoTypeAndPhrase")
    public TableDataInfo getPhotoTypeAndPhrase(PhotoType photoType) {
        //这里有个问题就是利用的这个分页没有返回总数total，所以我自己写的查询总数再赋值total，也可以
        //没有利用自动生成的select count(*),自己的在特殊情况下利用好所以可以使sql加速
//        startPage();
        startPageNoCount();
        List<PhotoType> photoTypes = photoTypeService.getPhotoType(photoType, 1);
        Long total = photoTypeService.selectCount(photoType);
        TableDataInfo dataTable = getDataTableNoTotal(photoTypes);
        dataTable.setTotal(total);
        return dataTable;
    }

    @GetMapping("/getPhotoType")
    public TableDataInfo getPhotoType(PhotoType photoType) {
        startPageNoCount();
        List<PhotoType> photoTypes = photoTypeService.getPhotoType(photoType, 0);
        Long total = photoTypeService.selectCount(photoType);
        TableDataInfo dataTable = getDataTableNoTotal(photoTypes);
        dataTable.setTotal(total);
        return dataTable;
    }

    @DeleteMapping("/deletePhotoType")
    public Result deletePhotoType(@RequestBody PhotoType photoType) {
        int i = photoTypeService.deleteById(photoType.getId());
        if (i > 0) {
            return Result.success("删除成功");
        } else {
            return Result.failed("删除失败");
        }
    }


    @PostMapping("/addPhotoBatch")
    public Result addPhotoBatch(@ModelAttribute PhotoBatch photoBatch) throws IOException, ImageProcessingException {
        photoTypeService.addPhotoBatch(photoBatch);
        return Result.success("添加成功");
    }

    /**
     * @ ModelAttribute:
     * Spring MVC 在处理 multipart/form-data 时，只能识别表单字段名是 photo.xxx 的嵌套结构，才能正确映射到 PhotoNew.photo 的子字段。
     * ✅ 你需要这样传字段名：
     * photo.typeId = 29
     * photo.phrase = "xxxxx"
     * photo.memory = "xxxx"
     * file = (二进制)
     */
    @PostMapping("/addPhoto")
    public Result addPhoto(@ModelAttribute PhotoNew photoNew) throws IOException, ImageProcessingException {
        photoTypeService.addPhoto(photoNew);
        return Result.success("添加成功");
    }
}
