package org.zaohu.modules.weather.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import org.zaohu.modules.weather.entity.Weather;

/**
 * @author myStep
 * @since 2025/12/24
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WeatherVO extends Weather {
    private MultipartFile iconFile;
}
