package org.zaohu.modules.accessRecord.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.modules.accessRecord.entity.AccessRecord;
import org.zaohu.modules.accessRecord.mapper.AccessRecordMapper;
import org.zaohu.modules.accessRecord.service.IAccessRecordService;

@Service
public class AccessRecordServiceImpl extends ServiceImpl<AccessRecordMapper, AccessRecord> implements IAccessRecordService {
}
