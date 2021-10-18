package recipe;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface IngredientDAO {
	public List<IngredientVO> getIngredientList();
	public void addIngredient(IngredientVO vo);
	public List<String> getColumn_nameList();
}
