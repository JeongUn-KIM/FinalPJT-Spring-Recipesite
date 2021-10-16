package recipe;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class RecipeVO {
	int recipe_no, user_no;
	Date recipe_date;
	String recipe_title, recipe_name, recipe_emotion, recipe_desc; 
	String recipe_img1, recipe_img2, recipe_img3, recipe_img4, recipe_img5, recipe_img6, recipe_img7, recipe_img8, recipe_img9, recipe_img10;
	String recipe_cate;
	
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getRecipe_date() {
		return recipe_date;
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
	public String getRecipe_desc() {
		return recipe_desc;
	}
	public void setRecipe_desc(String recipe_desc) {
		this.recipe_desc = recipe_desc;
	}

	public String getRecipe_img1() {
		return recipe_img1;
	}
	public void setRecipe_img1(String recipe_img1) {
		this.recipe_img1 = recipe_img1;
	}
	public String getRecipe_img2() {
		return recipe_img2;
	}
	public void setRecipe_img2(String recipe_img2) {
		this.recipe_img2 = recipe_img2;
	}
	public String getRecipe_img3() {
		return recipe_img3;
	}
	public void setRecipe_img3(String recipe_img3) {
		this.recipe_img3 = recipe_img3;
	}
	public String getRecipe_img4() {
		return recipe_img4;
	}
	public void setRecipe_img4(String recipe_img4) {
		this.recipe_img4 = recipe_img4;
	}
	public String getRecipe_img5() {
		return recipe_img5;
	}
	public void setRecipe_img5(String recipe_img5) {
		this.recipe_img5 = recipe_img5;
	}
	public String getRecipe_img6() {
		return recipe_img6;
	}
	public void setRecipe_img6(String recipe_img6) {
		this.recipe_img6 = recipe_img6;
	}
	public String getRecipe_img7() {
		return recipe_img7;
	}
	public void setRecipe_img7(String recipe_img7) {
		this.recipe_img7 = recipe_img7;
	}
	public String getRecipe_img8() {
		return recipe_img8;
	}
	public void setRecipe_img8(String recipe_img8) {
		this.recipe_img8 = recipe_img8;
	}
	public String getRecipe_img9() {
		return recipe_img9;
	}
	public void setRecipe_img9(String recipe_img9) {
		this.recipe_img9 = recipe_img9;
	}
	public String getRecipe_img10() {
		return recipe_img10;
	}
	public void setRecipe_img10(String recipe_img10) {
		this.recipe_img10 = recipe_img10;
	}
	public String getRecipe_cate() {
		return recipe_cate;
	}
	public void setRecipe_cate(String recipe_cate) {
		this.recipe_cate = recipe_cate;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return recipe_no + " " + user_no + " " + recipe_date + " " + recipe_title + " " + recipe_name + " " + recipe_emotion + " " + recipe_desc;
	}
	
	
}
