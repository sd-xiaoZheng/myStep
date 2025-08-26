package org.zaohu.ai.service;

import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.TokenStream;

//@AiService(
//        wiringMode = AiServiceWiringMode.EXPLICIT,//手动装配模型 也可以自动 会自动去ioc模型里面去找一个
//        chatModel = "ollamaStreamingChatModel"//指定模型,
//)
//@AiService
public interface ConsultantService {
    //用于聊天的方法
//    @SystemMessage("你是一名脾气暴躁的陪聊，你很不喜欢你的工作，每当客户来聊天时，你都不耐烦")
    @SystemMessage("你是一名温柔的陪聊，你很热爱你的工作，特别喜欢与用户聊天,擅长使用表情")
    public TokenStream chat(String message);

    @SystemMessage("你是一名温柔的陪聊，你很热爱你的工作，特别喜欢与用户聊天,擅长使用表情")
    public TokenStream chatWithMemory(String message);
}
