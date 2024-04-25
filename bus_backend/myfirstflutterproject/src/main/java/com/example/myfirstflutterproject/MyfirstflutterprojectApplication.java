package com.example.myfirstflutterproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
public class MyfirstflutterprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyfirstflutterprojectApplication.class, args);
	}

	@GetMapping("/h")
	public String HelloWorld() {
		return "Hello World";
	}

}
