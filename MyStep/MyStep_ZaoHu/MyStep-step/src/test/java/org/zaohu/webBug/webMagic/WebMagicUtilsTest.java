package org.zaohu.webBug.webMagic;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.zaohu.utils.webBugUtils.webMagic.WebMagicUtils;

/**
 * 利用webmagic 网络爬虫 爬取弱智吧的发言标题示例
 *
 * =============在注解中添加 webEnvironment 属性，给WebSocket提供测试环境：===============
 */
//@RequiredArgsConstructor//Test中不能使用他 Autowired
@Disabled//类或方法加了 @Disabled / @Ignore	会被跳过类里面的@Test测试代码
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class WebMagicUtilsTest {
    @Autowired
    private WebMagicUtils webMagicUtils;

    @Test
    public void executeBug4Test() {
        String s = webMagicUtils.executeBug4Test();
        System.out.println(s);
    }
}
