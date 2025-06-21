package org.zaohu.utils.photoutils;

import com.luciad.imageio.webp.WebPWriteParam;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @author myStep
 * @since 2025/6/19
 **/
public class PhotoDisposeUtils {

    /**
     * @param imagePath  原图路径
     * @param outputPath 输出路径
     */
    public static void convertWebpLossless(String imagePath, String outputPath) {
        try {
            BufferedImage image = ImageIO.read(new File(imagePath));
            ImageWriter writer = ImageIO.getImageWritersByMIMEType("image/webp").next();
            WebPWriteParam writeParam = new WebPWriteParam(writer.getLocale());
            writeParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            // 设置无损
            writeParam.setCompressionType(writeParam.getCompressionTypes()[WebPWriteParam.LOSSLESS_COMPRESSION]);
            // 保存图片

            //先尝试创建父目录
            File outputFile = new File(outputPath);
            File parentDir = outputFile.getParentFile();
            if (parentDir != null && !parentDir.exists()) {
                boolean created = parentDir.mkdirs();
                if (!created) {
                    throw new IOException("无法创建目录: " + parentDir.getAbsolutePath());
                }
            }
            writer.setOutput(new FileImageOutputStream(outputFile));
            writer.write(null, new IIOImage(image, null, null), writeParam);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * @param imagePath  原图路径
     * @param outputPath 输出路径
     * @param quality    有损压缩 压缩率 压缩质量 0.8f  设置范围 0-1  值越大图像质量越好，文件越大；值越小图像质量越差，文件越小。
     */
    public static void convertWebpWithLossyCompression(String imagePath, String outputPath, float quality) {
        try {
            File file = new File(imagePath);
            if (!file.exists()) {
                System.out.println("文件不存在: " + file.getAbsolutePath());
                return;
            }
            BufferedImage image = ImageIO.read(file);
            ImageWriter writer = ImageIO.getImageWritersByMIMEType("image/webp").next();
            WebPWriteParam writeParam = new WebPWriteParam(writer.getLocale());
            writeParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            // 设置有损压缩
            writeParam.setCompressionType(writeParam.getCompressionTypes()[WebPWriteParam.LOSSY_COMPRESSION]);
            writeParam.setCompressionQuality(quality);

            //先尝试创建父目录
            File outputFile = new File(outputPath);
            File parentDir = outputFile.getParentFile();
            if (parentDir != null && !parentDir.exists()) {
                boolean created = parentDir.mkdirs();
                if (!created) {
                    throw new IOException("无法创建目录: " + parentDir.getAbsolutePath());
                }
            }
            writer.setOutput(new FileImageOutputStream(outputFile));
            writer.write(null, new IIOImage(image, null, null), writeParam);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
