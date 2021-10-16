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
	public List<RecipeVO> SearchDesc(String Search);
	public List<RecipeVO> SearchTitleDesc(String Search);
	public void addRecipe(RecipeVO vo);
}
