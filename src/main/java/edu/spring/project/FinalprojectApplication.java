package edu.spring.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import chatbot.ChatbotController;
import user.UserDAO;
import user.UserVO;


@SpringBootApplication

@ComponentScan
@ComponentScan(basePackageClasses = ChatbotController.class)
@ComponentScan(basePackageClasses = UserVO.class)
@MapperScan(basePackageClasses = UserDAO.class)
public class FinalprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalprojectApplication.class, args);
		System.out.println("ai 9009서버 시작");
		
	}

}
