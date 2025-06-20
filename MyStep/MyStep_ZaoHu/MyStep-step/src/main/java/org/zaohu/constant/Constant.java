package org.zaohu.constant;

public class Constant {
    //接口访问数量
    public static final String REDIS_VISIT_NUM = "visit:num";
    //接口访问信息
    public static final String REDIS_VISIT_INFO = "visitor:info";


    //rocketMQ 邮箱发送消息Topic:Tag
    public static final String ROCKET_EMAIL_LOGIN_CODE_TOPICTAG = "rocket_topic_email:tag_loginCode";
    //rocketMQ 邮箱发送消息Topic
    public static final String ROCKET_EMAIL_LOGIN_CODE_TOPIC = "rocket_topic_email";    //rocketMQ 邮箱发送消息Topic
    //rocketMQ 图片转换缩略图消费者Topic
    public static final String ROCKET_IMAGE_THUMB_TOPIC = "rocket_ImageThumb";


    //图片头路径
    public static final String FILE_PATH = "D:\\step\\file\\image\\";
    //照片类型图片路径
    public static final String PHOTO_TYPE_PATH = "/photoType/";
    //图片路径
    public static final String PHOTO_PATH = "/photo/";
    //上传照片原图缓存位置
    public static final String PHOTO_TYPE_TEMP_PATH = "/photoType/Temp/";
    //上传照片资源前缀
    public static final String RESOURCE_PREFIX = "/step/Zaohu";
}