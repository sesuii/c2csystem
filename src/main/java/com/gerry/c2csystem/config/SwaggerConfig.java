package com.gerry.c2csystem.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * swagger Api 在线文档信息配置
 *
 * @author Gerry
 * @email sjiahui27@gmail.com
 * @since 2022/5/21 20:56
 **/
@Configuration
public class SwaggerConfig {

    @Bean
    public Docket docket() {
        ApiInfo info = new ApiInfoBuilder()
                .contact(new Contact("Jiahui Song", "https://www.google.com", "sjiahui27@gmail.com"))
                .title("校园二手交易平台 - 在线API接口文档")
                .version("v1.0.0")
                .description("校园二手交易平台的后端API文档，欢迎前端人员查阅！")
                .build();
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(info)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.gerry.c2csystem.controller"))
                .build();
    }

}