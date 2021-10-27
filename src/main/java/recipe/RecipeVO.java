package recipe;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class RecipeVO {
	int recipe_no, user_no;
	Date recipe_date;
	String recipe_img, recipe_title, recipe_name, recipe_ingredient, recipe_emotion;
	String recipe_cate;
	String recipe_nation;

	
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getRecipe_img() {
		return recipe_img;
	}
	public void setRecipe_img(String recipe_img1) {
		this.recipe_img = recipe_img1;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getRecipe_date() {
		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		String date = format1.format(recipe_date);
		return date;
	}
	public void setRecipe_date(Date recipe_date) {
		this.recipe_date = recipe_date;
	}
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_emotion() {
		return recipe_emotion;
	}
	public void setRecipe_emotion(String recipe_emotion) {
		this.recipe_emotion = recipe_emotion;
	}


	public String getRecipe_ingredient() {
		return recipe_ingredient;
	}
	public void setRecipe_ingredient(String recipe_ingredient) {
		this.recipe_ingredient = recipe_ingredient;
	}
	public String getRecipe_nation() {
		return recipe_nation;
	}
	public void setRecipe_nation(String recipe_nation) {
		this.recipe_nation = recipe_nation;
	}

	public String getRecipe_cate() {
		return recipe_cate;
	}
	public void setRecipe_cate(String recipe_cate) {
		this.recipe_cate = recipe_cate;
	}

	public String toString() {
		return recipe_no + ""; 
	}
	
}
