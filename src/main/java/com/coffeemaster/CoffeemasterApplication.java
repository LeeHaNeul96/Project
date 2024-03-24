package com.coffeemaster;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.coffeemaster"})
@MapperScan(basePackages= {"com.coffeemaster"})
public class CoffeemasterApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoffeemasterApplication.class, args);
	}
}
