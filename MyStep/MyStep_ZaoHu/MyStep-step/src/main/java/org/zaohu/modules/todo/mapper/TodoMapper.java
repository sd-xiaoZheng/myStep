package org.zaohu.modules.todo.mapper;

import org.zaohu.modules.todo.entity.Todo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 待办表 Mapper 接口
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:32
 */
@Mapper
public interface TodoMapper extends BaseMapper<Todo> {

}
