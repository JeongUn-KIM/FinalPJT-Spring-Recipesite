package recipe;


import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ingredservice")
public class IngredientServiceImpl implements IngredientService {
	@Autowired
	IngredientDAO dao;

	@Override
	public List<IngredientVO> getIngredientList() {
		System.out.println("서비스 임플~");
		return dao.getIngredientList();
	}

	@Override
	public void addIngredient(IngredientVO vo) {
		dao.addIngredient(vo);
	}
	@Override
	public List<String> getColumn_nameList() {
		List<String> list = dao.getColumn_nameList();
		list.remove("recipe_no");
		list.remove("user_no");
		return list;
				
	}
	
}
