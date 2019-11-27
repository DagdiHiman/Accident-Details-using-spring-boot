package com.JAD.himan.AccidentDetails;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan(basePackages={"com.JAD"})
public class AccidentDetailsApplication {

	public static void main(String[] args) {
		SpringApplication.run(AccidentDetailsApplication.class, args);
	}

}