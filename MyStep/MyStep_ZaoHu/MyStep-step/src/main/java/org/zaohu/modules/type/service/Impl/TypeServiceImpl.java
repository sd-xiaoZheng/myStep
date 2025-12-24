package org.zaohu.modules.type.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.type.entity.Type;
import org.zaohu.modules.type.entity.vo.TypeVO;
import org.zaohu.modules.type.mapper.TypeMapper;
import org.zaohu.modules.type.service.TypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.utils.FileUtils;

import java.util.Objects;

/**
 * <p>
 * 类型表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:53
 */
@Service
@RequiredArgsConstructor
public class TypeServiceImpl extends ServiceImpl<TypeMapper, Type> implements TypeService {
    private final TypeMapper typeMapper;

    @Override
    public void addOrUpdateSynthesis(TypeVO typeVO) {
        Type type = new Type();
        BeanUtil.copyProperties(typeVO, type);
        MultipartFile iconFile = typeVO.getIconFile();
        if (Objects.nonNull(iconFile) && !iconFile.isEmpty()) {
            String iconPath = FileUtils.uploadImage(iconFile);
            if (!iconPath.isEmpty()) {
                type.setIcon(iconPath);
            }
        }
        typeMapper.insertOrUpdate(type);
    }
}
