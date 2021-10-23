package recipe;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("recipeservice")
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	RecipeDAO dao;

	@Override
	public List<RecipeVO> getRecipeList() {
		return dao.getRecipeList();
	}

	@Override
	public List<RecipeVO> moreRecipeList(int number) {
		// TODO Auto-generated method stub
		return dao.moreRecipeList(number);
	}

	@Override
	public List<RecipeVO> SearchTitle(String search) {
		search = "%" + search + "%";
		return dao.SearchTitle(search);
	}

	@Override
	public List<RecipeVO> SearchName(String search) {
		search = "%" + search + "%";
		return dao.SearchName(search);
	}
	@Override
	public List<RecipeVO> SearchIngredient(String search) {
		search = "%" + search + "%";
		return dao.SearchIngredient(search);
	}
	@Override
	public List<RecipeVO> SearchNation(String search) {
		search = "%" + search + "%";
		return dao.SearchNation(search);
	}
	@Override
	public void addRecipe(RecipeVO vo) {
		dao.addRecipe(vo);
		
	}
	public RecipeVO getRecipeDetail(int no){
		return dao.getRecipeDetail(no);
	}
	public void deleteRecipe(int recipe_no) {
		dao.deleteRecipe(recipe_no);
	}
	public void modifyRecipe(RecipeVO vo) {
		dao.modifyRecipe(vo);
	}
	public List<RecipeVO> getCateRecipeList(String nation, String emotion, String ingred){
		nation = "%" + nation + "%";
		emotion = "%" + emotion + "%";
		ingred = "%" + ingred + "%";
		return dao.getCateRecipeList(nation, emotion, ingred);
	}
}
