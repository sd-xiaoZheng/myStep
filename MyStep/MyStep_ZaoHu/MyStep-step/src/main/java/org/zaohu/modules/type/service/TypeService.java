package org.zaohu.modules.type.service;

import org.zaohu.modules.type.entity.Type;
import com.baomidou.mybatisplus.extension.service.IService;
import org.zaohu.modules.type.entity.vo.TypeVO;

/**
 * <p>
 * 类型表 服务类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:53
 */
public interface TypeService extends IService<Type> {
    void addOrUpdateSynthesis(TypeVO typeVO);
}
