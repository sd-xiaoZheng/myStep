package org.zaohu.ai.config;

import dev.langchain4j.model.ollama.OllamaStreamingChatModel;
import dev.langchain4j.service.AiServices;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.zaohu.ai.service.ConsultantService;

@Configuration
public class LangChain4jConfig {

    @Bean
    public OllamaStreamingChatModel ollamaStreamingChatModel() {
        return OllamaStreamingChatModel.builder()
                .baseUrl("http://localhost:11434") // Ollama 默认地址
                .modelName("qwen3")               // 你本地跑的模型名
                .temperature(0.7)
                .topK(40) // 选择高概率词汇
                .topP(0.9) // 控制采样范围
                .build();
    }

    @Bean
    public ConsultantService consultantService(OllamaStreamingChatModel ollamaStreamingChatModel) {
        return AiServices.builder(ConsultantService.class)
                .streamingChatModel(ollamaStreamingChatModel)
                .build();
    }
}
