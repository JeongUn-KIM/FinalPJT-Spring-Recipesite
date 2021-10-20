package recipe;

import java.util.List;


public interface RecipeDescService {
	public RecipeDescVO getDescOne(int recipe_no);
	public void addDesc(RecipeDescVO vo);
	public List<Integer> SearchDesc(String search);
	public void deleteDesc(int recipe_no);
}