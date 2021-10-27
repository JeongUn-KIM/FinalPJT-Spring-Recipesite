package recipe;


import java.util.HashMap;
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
	public List<RecipeVO> SearchTitle(String nation, String emotion, String cate, String search) {
		nation = "%" + nation + "%";
		emotion = "%" + emotion + "%";
		cate = "%" + cate + "%";
		search = "%" + search + "%";
		return dao.SearchTitle(nation, emotion, cate, search);
	}

	@Override
	public List<RecipeVO> SearchName(String nation, String emotion, String cate, String search) {
		nation = "%" + nation + "%";
		emotion = "%" + emotion + "%";
		cate = "%" + cate + "%";
		search = "%" + search + "%";
		return dao.SearchName(nation, emotion, cate, search);
	}
	@Override
	public List<RecipeVO> SearchIngredient(String nation, String emotion, String cate, String search) {
		nation = "%" + nation + "%";
		emotion = "%" + emotion + "%";
		cate = "%" + cate + "%";
		search = "%" + search + "%";
		return dao.SearchIngredient(nation, emotion, cate, search);
	}
	@Override
	public void addRecipe(RecipeVO vo) {
		dao.addRecipe(vo);
		
	}
	public RecipeVO getRecipeDetail(int no){
		return dao.getRecipeDetail(no);
	}
	public void raiseRecipeHits(int no) {
		dao.raiseRecipeHits(no);
	}
	public void deleteRecipe(int recipe_no) {
		dao.deleteRecipe(recipe_no);
	}
	public void modifyRecipe(RecipeVO vo) {
		dao.modifyRecipe(vo);
	}
	public List<RecipeVO> getCateRecipeList(String nation, String emotion, String cate){
		nation = "%" + nation + "%";
		emotion = "%" + emotion + "%";
		cate = "%" + cate + "%";
		return dao.getCateRecipeList(nation, emotion, cate);
	}
	public List<RecipeVO> findRecipe(RecipeVO vo) {
		HashMap<String, String> map = new HashMap<String, String>();
		String emotion = "%" + vo.getRecipe_emotion() + "%";
		String nation = "%" + vo.getRecipe_nation() + "%";
		String cate = "%" + vo.getRecipe_cate() + "%";
		/*
		 * map.put("emotion", emotion); map.put("nation", nation); map.put("cate",
		 * cate);
		 */
		/*
		 * String[] not_eat = {"","","","","",""}; String[] ingredient =
		 * vo.getRecipe_ingredient().split(","); for(int i = 0 ; i < ingredient.length ;
		 * i++) { ingredient[i] = "%" + ingredient[i] + "%"; not_eat[i] = ingredient[i];
		 * } map.put("not_eat1", not_eat[0]); map.put("not_eat2", not_eat[1]);
		 * map.put("not_eat3", not_eat[2]); map.put("not_eat4", not_eat[3]);
		 * map.put("not_eat5", not_eat[4]); map.put("not_eat6", not_eat[5]);
		 */
		return dao.findRecipe(emotion, nation, cate);
	}
}
