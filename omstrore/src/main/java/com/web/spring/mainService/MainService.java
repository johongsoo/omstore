package com.web.spring.mainService;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.mainDao.MainDao;
import com.web.spring.vo.Users;




@Service
public class MainService {

	@Autowired(required=false)
	private MainDao dao;
	
	public List<Users> userlist(Users user) {
		if(user.getUserid()==null) user.setUserid("");
		if(user.getPwd()==null) user.setPwd("");
		if(user.getRating()==null) user.setRating("");
		
		user.setUserid("%"+user.getUserid()+"%");
		user.setPwd("%"+user.getPwd()+"%");
		user.setRating("%"+user.getRating()+"%");
		return dao.userlist(user);
	}
	
	public Users login(Users users) {
		return dao.login(users);
	}


    public boolean selectId(String userid) {
        // 쿼리 결과를 int로 받고, 1일 경우 true, 0일 경우 false로 변환
        return dao.selectId(userid) > 0;
    }
}

	

