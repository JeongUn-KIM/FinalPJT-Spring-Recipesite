package edu.spring.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import chatbot.ChatbotController;
import main.MainController;
import main.UserController;
import main.UserDAO;
import recipe.RecipeController;
import recipe.RecipeDAO;
<<<<<<< HEAD
import recipe.RecipeDescDAO;
import recipe.RecipeImgDAO;
=======
import notice.NoticeController;
import notice.NoticeDAO;
>>>>>>> branch 'pang' of https://github.com/mellunk/FinalPJT-Spring-Recipesite.git

@SpringBootApplication

@ComponentScan
@ComponentScan(basePackageClasses = ChatbotController.class)
@ComponentScan(basePackageClasses = UserController.class)
@ComponentScan(basePackageClasses = MainController.class)
@ComponentScan(basePackageClasses = RecipeController.class)
@MapperScan
@MapperScan(basePackageClasses = UserDAO.class)
@MapperScan(basePackageClasses = RecipeDAO.class)
<<<<<<< HEAD
@MapperScan(basePackageClasses = RecipeDescDAO.class)
@MapperScan(basePackageClasses = RecipeImgDAO.class)
=======
@MapperScan(basePackageClasses = IngredientDAO.class)
@MapperScan(basePackageClasses = NoticeDAO.class)
>>>>>>> branch 'pang' of https://github.com/mellunk/FinalPJT-Spring-Recipesite.git
public class FinalprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalprojectApplication.class, args);
		System.out.println("ai 9009서버 시작");
		
	}

}
