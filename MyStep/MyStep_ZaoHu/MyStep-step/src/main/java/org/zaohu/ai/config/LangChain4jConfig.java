package org.zaohu.ai.config;

import dev.langchain4j.model.ollama.OllamaStreamingChatModel;
import dev.langchain4j.service.AiServices;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.zaohu.ai.service.ConsultantService;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class LangChain4jConfig {

    @Bean
    public OllamaStreamingChatModel ollamaStreamingChatModel() {
        Map<String, String> customheaders = new HashMap<>();
        customheaders.put("Content-Type", "application/json; charset=UTF-8");
        return OllamaStreamingChatModel.builder()
                .baseUrl("http://localhost:11434") // Ollama 默认地址
                .modelName("qwen3")               // 你本地跑的模型名
                .temperature(0.7)
                .topK(40) // 选择高概率词汇
                .topP(0.9) // 控制采样范围
                .logRequests(true)
                .logResponses(true)
                .customHeaders(customheaders)//加上这个才能用中文发送问题 不然乱码
                .build();
    }

    @Bean
    public ConsultantService consultantService(OllamaStreamingChatModel ollamaStreamingChatModel) {
        return AiServices.builder(ConsultantService.class)
                .streamingChatModel(ollamaStreamingChatModel)
                .build();
    }
}
