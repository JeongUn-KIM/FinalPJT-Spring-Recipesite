package edu.spring.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import admin.AdminController;
import admin.AdminDAO;
import chatbot.ChatbotController;
import main.MainController;
import main.UserController;
import main.UserDAO;
import mypage.MypageController;
import mypage.MypageDAO;
import recipe.RecipeController;
import recipe.RecipeDAO;
import recipe.RecipeDescDAO;
import recipe.RecipeImgDAO;
import notice.NoticeController;
import notice.NoticeDAO;


@SpringBootApplication

@ComponentScan
@ComponentScan(basePackageClasses = ChatbotController.class)
@ComponentScan(basePackageClasses = UserController.class)
@ComponentScan(basePackageClasses = MainController.class)
@ComponentScan(basePackageClasses = RecipeController.class)
@ComponentScan(basePackageClasses = MypageController.class)
@ComponentScan(basePackageClasses = AdminController.class)
@ComponentScan(basePackageClasses = NoticeController.class)
@MapperScan
@MapperScan(basePackageClasses = UserDAO.class)
@MapperScan(basePackageClasses = RecipeDAO.class)
@MapperScan(basePackageClasses = RecipeDescDAO.class)
@MapperScan(basePackageClasses = RecipeImgDAO.class)
@MapperScan(basePackageClasses = NoticeDAO.class)
@MapperScan(basePackageClasses = MypageDAO.class)
@MapperScan(basePackageClasses = AdminDAO.class)
@MapperScan(basePackageClasses = NoticeDAO.class)


public class FinalprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalprojectApplication.class, args);
		System.out.println("ai 9009서버 시작");
		
	}

}
