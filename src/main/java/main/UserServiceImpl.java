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
	
}
