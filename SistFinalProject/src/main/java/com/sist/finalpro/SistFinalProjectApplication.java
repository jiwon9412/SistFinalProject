package com.sist.finalpro;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*","com.sist.finalpro"})
@MapperScan("data.*")
public class SistFinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SistFinalProjectApplication.class, args);
	}

}
