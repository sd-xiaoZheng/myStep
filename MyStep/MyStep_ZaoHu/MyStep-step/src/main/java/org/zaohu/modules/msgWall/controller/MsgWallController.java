package org.zaohu.modules.msgWall.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.common.ResultCommon.Result;
import org.zaohu.modules.msgWall.entity.MsgWall;
import org.zaohu.modules.msgWall.mapper.MsgWallMapper;
import org.zaohu.utils.FileUtils;
import org.zaohu.utils.GetIPAddrUtil;
import org.zaohu.utils.entity.IpRegion;
import org.zaohu.utils.text.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Zaohu
 * @since 2025-04-28 19:59:53
 */
@Slf4j
@RestController
@RequestMapping("/step/msgWall")
public class MsgWallController {
    @Autowired
    private MsgWallMapper msgWallMapper;

    @PostMapping("/addMsg")
    public Result addMsg(
            HttpServletRequest request,
            @RequestParam("nickname") String nickname,
            @RequestParam("content") String content,
            @RequestParam("avatar") MultipartFile avatar
    ) {
        String clientIp = GetIPAddrUtil.getClientIp(request);
        MsgWall msgWall = new MsgWall();
        msgWall.setLeaveMsg(content);
        msgWall.setLeaveFrom(nickname);
        msgWall.setLeaveTime(new Date());
        IpRegion ipRegion = GetIPAddrUtil.getIpRegion(clientIp);
        String province = StringUtils.isEmpty(ipRegion.getProvince()) ? "未知" : ipRegion.getProvince();
        String city = StringUtils.isEmpty(ipRegion.getCity()) ? "未知" : ipRegion.getCity();
        msgWall.setPlace(province + " " + city);
        msgWall.setIp(clientIp);
        String s = FileUtils.uploadImage(avatar);
        if (StringUtils.isNotEmpty(s)) {
            msgWall.setHead(s);
        }
        msgWallMapper.insert(msgWall);
        return Result.success("您起的名字好美，我收录咯~");
    }

    @GetMapping("/getmsg")
    public Result getmsgWall() {
        //家乡的麦地金黄璀璨阵阵香，妈妈说这是菩萨保佑的~
        List<MsgWall> msgWalls = msgWallMapper.selectList(null);
        return Result.success(msgWalls);
    }
}
