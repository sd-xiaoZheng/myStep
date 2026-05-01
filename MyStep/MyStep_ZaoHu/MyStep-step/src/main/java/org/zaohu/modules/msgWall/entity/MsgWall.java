package org.zaohu.modules.msgWall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author Zaohu
 * @since 2025-04-28 19:59:53
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("msg_wall")
public class MsgWall {

    /**
     *     //IdType.ID_WORKER_STR 默认的;底层使用了雪花算法；类型为Integer
     *     //IdType.AUTO 数据库自增；数据库上也要勾上自增
     *     //IdType.NONE 没有设置主键类型；跟随全局；全局的主键策略如果没有设置，默认是雪花算法
     *     //IdType.INPUT 手动输入;必须手动输入，数据库自增也没用；
     *     //IdType.UUID 全局唯一id；无序;字符串；
     *     //ID_WORKER_STR 全局唯一（idWorker的字符串表示)；
     */
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    @TableField("leave_msg")
    private String leaveMsg;

    @TableField("leave_from")
    private String leaveFrom;

    @TableField("leave_time")
    private Date leaveTime;

    @TableField("place")
    private String place;

    @TableField("anonymity")
    private Byte anonymity;

    @TableField("ip")
    private String ip;

    @TableField("head")
    private String head;
}