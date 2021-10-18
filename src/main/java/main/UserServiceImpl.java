package main;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userservice")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;
	
	@Override
	public UserVO getUserOne(HashMap<String, String> map) {
		return dao.getUserOne(map);
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

	
	
	
	
}
