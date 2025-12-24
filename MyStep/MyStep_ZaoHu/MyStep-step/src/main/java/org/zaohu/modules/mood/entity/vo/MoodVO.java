package org.zaohu.modules.mood.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.mood.entity.Mood;

/**
 * @author myStep
 * @since 2025/12/24
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MoodVO extends Mood {
    private MultipartFile iconFile;
}
