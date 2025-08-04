package org.zaohu.ai.service;

import dev.langchain4j.service.spring.AiService;

//@AiService(
//        wiringMode = AiServiceWiringMode.EXPLICIT,//手动装配模型 也可以自动 会自动去ioc模型里面去找一个
//        chatModel = "openAiChatModel"//指定模型,
//)
@AiService
public interface ConsultantService {
    //用于聊天的方法
    public String chat(String message);
}
