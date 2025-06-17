package org.zaohu.utils.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author My-step
 * @since 2025/4/29
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class IpRegion {
    String country;//中国
    String area;//0
    String province;//山东省
    String city;//潍坊市
    String isp;//电信
}
