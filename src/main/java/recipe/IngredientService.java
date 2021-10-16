package recipe;

import java.util.List;


public interface IngredientService {
	public List<IngredientVO> getIngredientList(); 
	public void addIngredient(IngredientVO vo);
	public List<String> getColumn_nameList();
}
