package com.moonbam.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

//@Configuration
//public class Config {
//    @Bean
//    MappingJackson2JsonView jsonView() {
//        //
//        return new MappingJackson2JsonView();
//    }
//}

//@Configuration
//public class FileConfiguration implements WebMvcConfigurer {
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/images/**")
//                .addResourceLocations("file:uploaded-images/");
//    }
//}