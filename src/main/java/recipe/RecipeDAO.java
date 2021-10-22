package recipe;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface RecipeDAO {
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
