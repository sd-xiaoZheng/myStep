package org.zaohu.modules.type.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.type.entity.Type;

/**
 * @author myStep
 * @since 2025/12/23
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TypeVO extends Type {
    private MultipartFile iconFile;
}
