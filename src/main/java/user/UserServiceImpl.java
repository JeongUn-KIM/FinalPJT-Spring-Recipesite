package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO dao;
	
	@Override
	public void signup(UserVO vo) {
		dao.signup(vo);

	}
	
	@Override
	public void update(UserVO vo) {
		dao.update(vo);

	}

}
