package com.gerry.c2csystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author gerry
 */
@SpringBootApplication
@MapperScan("com.gerry.c2csystem.dao")
public class C2csystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(C2csystemApplication.class, args);
    }

}
