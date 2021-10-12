package user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public void signup(UserVO vo) {
		sqlsession.insert("sql.mapping.insertuser", vo);
	}
	
	public void update(UserVO vo) {
		sqlsession.update("sql.mapping.updateuser", vo);
	}
}
