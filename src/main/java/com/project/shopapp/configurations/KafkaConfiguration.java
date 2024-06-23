//package com.project.shopapp.configurations;
//
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.kafka.annotation.EnableKafka;
//import org.springframework.kafka.core.*;
//import org.springframework.kafka.listener.CommonErrorHandler;
//import org.springframework.kafka.listener.DeadLetterPublishingRecoverer;
//import org.springframework.kafka.listener.DefaultErrorHandler;
//import org.springframework.util.backoff.FixedBackOff;
//import org.springframework.context.annotation.Configuration;
//import org.apache.kafka.clients.admin.NewTopic;
//
//
//@Configuration
//@EnableKafka
//public class KafkaConfiguration {
//    @Bean
//    public CommonErrorHandler errorHandler(KafkaOperations<Object, Object> template) {
//        return new DefaultErrorHandler(
//                new DeadLetterPublishingRecoverer(template), new FixedBackOff(1000L, 2));
//    }
//
//    @Bean
//    public NewTopic insertACategoryTopic() {
//        return new NewTopic("insert-a-category", 1, (short) 1);
//    }
//    @Bean
//    public NewTopic getAllCategoriesTopic() {
//        return new NewTopic("get-all-categories", 1, (short) 1);
//    }
//}
