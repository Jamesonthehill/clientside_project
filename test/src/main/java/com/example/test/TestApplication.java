package com.example.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/*@ComponentScan(basePackages = {"com.example.test"})*/
@SpringBootApplication
public class TestApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(TestApplication.class, args);
	}

}
      