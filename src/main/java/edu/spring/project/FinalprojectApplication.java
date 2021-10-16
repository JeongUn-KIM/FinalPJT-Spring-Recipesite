package edu.spring.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import chatbot.ChatbotController;
import main.MainController;
import main.UserController;
import main.UserDAO;
import recipe.IngredientDAO;
import recipe.RecipeController;
import recipe.RecipeDAO;

@SpringBootApplication

@ComponentScan
@ComponentScan(basePackageClasses = ChatbotController.class)
@ComponentScan(basePackageClasses = UserController.class)
@ComponentScan(basePackageClasses = MainController.class)
@ComponentScan(basePackageClasses = RecipeController.class)
@MapperScan(basePackageClasses = UserDAO.class)
@MapperScan(basePackageClasses = RecipeDAO.class)
@MapperScan(basePackageClasses = IngredientDAO.class)
public class FinalprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalprojectApplication.class, args);
		System.out.println("ai 9009서버 시작");
		
	}

}
