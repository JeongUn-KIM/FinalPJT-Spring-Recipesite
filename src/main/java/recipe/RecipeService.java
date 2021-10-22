package recipe;

import java.util.List;


public interface RecipeService {
	public List<RecipeVO> getRecipeList(); 
	public List<RecipeVO> moreRecipeList(int number);
	public List<RecipeVO> SearchTitle(String Search);
	public List<RecipeVO> SearchName(String Search);
	public List<RecipeVO> SearchIngredient(String Search);
	public List<RecipeVO> SearchNation(String Search);
	public void addRecipe(RecipeVO vo);
	public RecipeVO getRecipeDetail(int no);
	public void deleteRecipe(int recipe_no);
	public void modifyRecipe(RecipeVO vo);
}
