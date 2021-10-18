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
	public List<RecipeVO> SearchDesc(String search) {
		search = "%" + search + "%";
		return dao.SearchDesc(search);
	}

	@Override
	public List<RecipeVO> SearchTitleDesc(String search) {
		search = "%" + search + "%";
		return dao.SearchTitleDesc(search);
	}

	@Override
	public void addRecipe(RecipeVO vo) {
		dao.addRecipe(vo);
		
	}
	
	
}
