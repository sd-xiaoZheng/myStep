package org.zaohu.utils.photoutils;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.lang.GeoLocation;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.GpsDirectory;
import org.zaohu.modules.photo.entity.Photo;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import java.io.File;
import java.io.IOException;

/**
 * @author myStep
 * @since 2025/6/21
 **/
public class PhotoInfo {
    public static void getPhotoInfo(File imageFile, Photo photo) throws ImageProcessingException, IOException {
        Metadata metadata = ImageMetadataReader.readMetadata(imageFile);

        // 拍摄时间
        for (Directory directory : metadata.getDirectories()) {
            for (Tag tag : directory.getTags()) {
                if (tag.getTagName().equals("Date/Time Original")) {
                    //拍摄时间
                    photo.setShotTime(tag.getDescription());
                }
                if (tag.getTagName().equals("Model")) {
                    //拍摄设备
                    photo.setDevice(tag.getDescription());
                }
                if (tag.getTagName().equals("GPS Altitude")) {
                    //拍摄海拔
                    photo.setAltitude(Double.parseDouble(tag.getDescription().split(" ")[0]));
                }
            }
        }

        // GPS 信息
        GpsDirectory gpsDir = metadata.getFirstDirectoryOfType(GpsDirectory.class);
        if (gpsDir != null) {
            GeoLocation geoLocation = gpsDir.getGeoLocation();
            if (geoLocation != null) {
                photo.setLocation(geoLocation.getLatitude() + "," + geoLocation.getLongitude());
            } else {
                System.out.println("没有 GPS 位置信息。");
            }
        } else {
            System.out.println("未找到 GPS 信息。");
        }
    }
}
