package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mypage")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDAO dao;

	@Override
	public List<MyrecipeVO> getMyZzimRecipeList(int user_no) {
		return dao.getMyZzimRecipeList(user_no);
	}

	@Override
	public List<MyrecipeVO> getMyZzimRecipeListDesc(int user_no, String recipe_nation) {
		return dao.getMyZzimRecipeListDesc(user_no, recipe_nation);
	}

	@Override
	public List<MyrecipeVO> getMyRecipeList(int user_no) {
		return dao.getMyRecipeList(user_no);
	}

	@Override
	public List<MyrecipeVO> getMyRecipeListDesc(int user_no, String recipe_nation) {
		return dao.getMyRecipeListDesc(user_no, recipe_nation);
	}

	@Override
	public void deleteZzimRecipeOne(int recipe_no, int user_no) {
		dao.deleteZzimRecipeOne(recipe_no, user_no);
	}


	
	
	
	
	
}
