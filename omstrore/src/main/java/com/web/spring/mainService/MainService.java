package com.web.spring.mainService;



import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;
import com.web.spring.mainDao.MainDao;
import com.web.spring.vo.Users;

import jakarta.mail.internet.MimeMessage;




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


    public boolean selectId1(String userid) {
        // 쿼리 결과를 int로 받고, 1일 경우 true, 0일 경우 false로 변환
        return dao.selectId(userid) > 0;
    }
    
    @Autowired
    private JavaMailSender mailSender;

    public String generateVerificationCode() {
        Random random = new Random();
        return String.valueOf(100000 + random.nextInt(900000)); // 6자리 인증 코드 생성
    }

    public void sendVerificationEmail(String email, String code) throws MessagingException, jakarta.mail.MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        helper.setTo(email);
        helper.setSubject("이메일 본인 인증 코드");
        helper.setText("인증 코드: " + code);
        mailSender.send(message);
    }

    public boolean selectId(String userid) {
        return dao.selectId(userid) > 0;
    }
    
    public void registerUser(Users user) {
        dao.registerUser(user);
    }


    
}

	

