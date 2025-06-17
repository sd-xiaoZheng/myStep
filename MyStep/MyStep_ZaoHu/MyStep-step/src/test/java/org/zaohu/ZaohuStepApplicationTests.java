package org.zaohu;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class ZaohuStepApplicationTests {

    @Test
    void contextLoads() {
        System.out.println(123);
    }
}
