package user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("service")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO dao;

	

	@Override
	public UserVO checkPw(String user_pw) {
		return checkPw(user_pw);
	}

	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
		
	}

	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
		
	}

	@Override
	public void deleteUser(String user_email, String user_pw) {
		dao.deleteUser(user_email, user_pw);
		
	}

	

	@Override
	public List<UserVO> listUser() {
		List<UserVO> list = dao.listUser();
		return list;
	}

	@Override
	public String login(UserVO vo) {
		return dao.login(vo);
	}


	

	
	
	
	
	
	
	
		
	
	

}
