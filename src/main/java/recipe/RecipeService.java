package recipe;

import java.util.List;


public interface RecipeService {
	public List<RecipeVO> getRecipeList(); 
	public List<RecipeVO> moreRecipeList(int number);
	public List<RecipeVO> SearchTitle(String search);
	public List<RecipeVO> SearchDesc(String search);
	public List<RecipeVO> SearchTitleDesc(String search);
	public void addRecipe(RecipeVO vo);
}
