//package org.zaohu.ai.config;
//
//import dev.langchain4j.model.openai.OpenAiChatModel;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class CommonConfig {
//    @Autowired
//    private OpenAiChatModel model;
//
//    @Bean
//    public ConsultantService consultantService(){
//        ConsultantService build = AiServices.builder(ConsultantService.class)
//                .chatModel(model)
//                .build();
//        return build;
//    }
//}
