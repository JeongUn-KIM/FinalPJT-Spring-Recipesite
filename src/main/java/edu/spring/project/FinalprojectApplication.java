package edu.spring.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import chatbot.ChatbotController;

@SpringBootApplication

@ComponentScan
@ComponentScan(basePackageClasses = ChatbotController.class)
public class FinalprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalprojectApplication.class, args);
		System.out.println("ai 9003서버 시작");
		
	}

}
