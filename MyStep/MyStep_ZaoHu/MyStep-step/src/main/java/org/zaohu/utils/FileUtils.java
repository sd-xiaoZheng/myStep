package org.zaohu.utils;

import cn.hutool.core.util.IdUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.constant.Constant;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;

/**
 * @author My-step
 * @since 2025/4/29
 **/
@Slf4j
public class FileUtils {
    public static String uploadImage(MultipartFile fileName) {
        try {
            LocalDate currentDate = LocalDate.now();//时间戳
            //获取年月日
            String year = String.valueOf(currentDate.getYear());
            String month = String.format("%02d", currentDate.getMonthValue());
            String day = String.format("%02d", currentDate.getDayOfMonth());

            Path directoryPath = Paths.get(Constant.FILE_PATH, year, month, day);
            Files.createDirectories(directoryPath);

            String originalFilename = fileName.getOriginalFilename();
            String filenameBase = IdUtil.fastSimpleUUID();
            String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
            String timestamp = String.valueOf(System.currentTimeMillis());
            String newFilename = filenameBase + "_" + timestamp + extension;
            // Save file上传
            Path filePath = directoryPath.resolve(newFilename);
            fileName.transferTo(filePath.toFile());
            // Optionally save the relative path to database
            return Constant.RESOURCE_PREFIX.replace("/step", "") + "/" + year + "/" + month + "/" + day + "/" + newFilename;
        } catch (IOException e) {
            log.error(e.getMessage());
        }
        return "";
    }

    /**
     *
     * @param fileName 文件
     * @param path 年后面的路径 以/开头结尾 如： /Step/temp/
     * @return
     */
    public static String uploadPhotoImage(MultipartFile fileName,String path) {
        try {
            LocalDate currentDate = LocalDate.now();//时间戳
            //获取年月日
            String year = String.valueOf(currentDate.getYear());

            Path directoryPath = Paths.get(Constant.FILE_PATH, year, path);
            Files.createDirectories(directoryPath);

            String originalFilename = fileName.getOriginalFilename();
            String filenameBase = IdUtil.fastSimpleUUID();//获取一个uuid
            String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));//去掉后缀
            String timestamp = String.valueOf(System.currentTimeMillis());//时间戳Str
            String newFilename = filenameBase + "_" + timestamp + extension;
            // Save file上传
            Path filePath = directoryPath.resolve(newFilename);
            fileName.transferTo(filePath.toFile());//把这个文件创建出来
            //这里返回的是用户前端访问展示的
            return Constant.RESOURCE_PREFIX.replace("/step", "") + "/" + year + path + newFilename;
        } catch (IOException e) {
            log.error(e.getMessage());
        }
        return "";
    }
}
