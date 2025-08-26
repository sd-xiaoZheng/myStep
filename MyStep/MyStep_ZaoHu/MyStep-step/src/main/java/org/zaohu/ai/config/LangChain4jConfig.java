package org.zaohu.ai.config;

import dev.langchain4j.data.message.ChatMessage;
import dev.langchain4j.data.message.CustomMessage;
import dev.langchain4j.data.message.SystemMessage;
import dev.langchain4j.data.message.UserMessage;
import dev.langchain4j.model.chat.request.ChatRequest;
import dev.langchain4j.model.chat.response.ChatResponse;
import dev.langchain4j.model.ollama.OllamaStreamingChatModel;
import dev.langchain4j.service.AiServices;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.zaohu.ai.service.ConsultantService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class LangChain4jConfig {

    @Bean
    public OllamaStreamingChatModel ollamaStreamingChatModel() {
        Map<String, String> customheaders = new HashMap<>();
        customheaders.put("Content-Type", "application/json; charset=UTF-8");
        OllamaStreamingChatModel qwen3 = OllamaStreamingChatModel.builder()
                .baseUrl("http://localhost:11434") // Ollama 默认地址
                .modelName("qwen3")               // 你本地跑的模型名
                .temperature(0.4)//越低越确定 越准
                .topP(0.9) // 控制采样范围 例如 0.9 表示只从概率前90%内的词中采样
                .topK(40) // 选择高概率词汇 控制从概率最高的前 K 个词中采样，比如设置为 50 表示只从前 50 个可能词中选一个
                .logRequests(true)
                .logResponses(true)
                .customHeaders(customheaders)//加上这个才能用中文发送问题 不然乱码
                .build();

        String retrievedContext = "条约制定的一个重要部分是，签署条约意味着承认对方是主权国家，并且所考虑的协议在国际法下是可执行的。因此，各国在将协议称为条约时可能非常谨慎。例如，在美国，州之间的协议是契约，而州与联邦政府之间或政府机构之间的协议是谅解备忘录。";


        List<ChatMessage> messages = List.of(
                SystemMessage.from("context_relevance"),
                UserMessage.from("条约制定的历史是什么？"),
                CustomMessage.from(Map.of(
                        "role", "context",
                        "content", retrievedContext
                ))
        );
//        ChatRequest build = ChatRequest.builder().messages(messages).build();

//        ChatResponse chatResponse = qwen3.chat(build);
        return qwen3;
    }

    @Bean
    public ConsultantService consultantService(OllamaStreamingChatModel ollamaStreamingChatModel) {
        return AiServices.builder(ConsultantService.class)
                .streamingChatModel(ollamaStreamingChatModel)
                .build();
    }
}
