package org.zaohu.modules.todo.service.Impl;

import org.zaohu.modules.todo.entity.Todo;
import org.zaohu.modules.todo.mapper.TodoMapper;
import org.zaohu.modules.todo.service.TodoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 待办表 服务实现类
 * </p>
 *
 * @author 铁汉柔情
 * @since 2025-11-26 17:15:32
 */
@Service
public class TodoServiceImpl extends ServiceImpl<TodoMapper, Todo> implements TodoService {

}
