package com.web.spring.mainController;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.spring.mainService.MainService;
import com.web.spring.productsService.ProductsService;
import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;
import com.web.spring.vo.Users;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired(required=false)
	private MainService service;
	@Autowired(required=false)
	private ProductsService service2;
	

	
	
	//http://localhost:8080/odung
	@RequestMapping("odung")
	public String odung() {
		return "WEB-INF\\products\\odung.jsp";
	}
	
	@RequestMapping("userlist")
	public String userlist(Users user, Model model) {
		model.addAttribute("userlist", service.userlist(user));
		return "";
	}
	
	@GetMapping("loginPage")
	public String loginPage(HttpSession session) {
	    session.removeAttribute("users");
	    return "WEB-INF\\mainpage\\login.jsp";
	}

	@PostMapping("loginPage")
	public String login(Users users, Model model, HttpSession session, 
			RedirectAttributes redirectAttributes) {
	    Users loguser = service.login(users);
	    if (loguser != null) {
	    	redirectAttributes.addFlashAttribute("msg", "로그인 성공");
	        session.setAttribute("users", loguser); 
	        return "redirect:/MainPage";
	    } else {
	        model.addAttribute("msg", "로그인 실패");
	        return "WEB-INF\\mainpage\\login.jsp";
	    }
	}
	
    @RequestMapping("logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.removeAttribute("users"); 
        redirectAttributes.addFlashAttribute("msg", "로그아웃 성공"); 
        return "redirect:/MainPage";
    }
	
	
	//http://localhost:8080/MainPage
	@GetMapping("MainPage")
	public String MainPage(MangbungStore mangbung, OdungStore odung , Model model) {
		model.addAttribute("odung", service2.odunglist(odung));
		model.addAttribute("mangbung", service2.mangbunglist(mangbung));
		return "WEB-INF\\mainpage\\mainpage.jsp";
	}
	
	
	//http://localhost:7070/register
	@RequestMapping("register")
	public String register() {
		return "WEB-INF\\mainpage\\register.jsp";
	}
	
	
    @PostMapping("ConfirmId")
    public ResponseEntity<Boolean> confirmId(@RequestParam String userid) {
        boolean result = true;

        try {
            if (userid.trim().isEmpty()) {
                result = false;
            } else {
                // ID가 데이터베이스에 있는지 확인하는 로직
                boolean idExists = service.selectId(userid); // 실제 존재 여부 확인
                result = !idExists; // ID가 존재하면 false, 존재하지 않으면 true
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        return ResponseEntity.ok(result);
    }
    

    @PostMapping("/sendVerificationEmail")
    @ResponseBody
    public ResponseEntity<String> sendVerificationEmail(@RequestParam String email, HttpSession session) throws jakarta.mail.MessagingException {
        String code = service.generateVerificationCode();
        session.setAttribute("verificationCode", code);

        try {
            service.sendVerificationEmail(email, code);
            return ResponseEntity.ok("인증 코드가 이메일로 발송되었습니다.");
        } catch (MessagingException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("이메일 발송 실패");
        }
    }

    @PostMapping("/verifyEmailCode")
    @ResponseBody
    public ResponseEntity<String> verifyEmailCode(@RequestParam String code, HttpSession session) {
        String storedCode = (String) session.getAttribute("verificationCode");
        if (storedCode != null && storedCode.equals(code)) {
            return ResponseEntity.ok("이메일 인증 성공");
        } else {
            return ResponseEntity.status(400).body("인증 코드가 올바르지 않습니다.");
        }
    }
    
    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute Users user, HttpSession session, Model model) {
        String storedCode = (String) session.getAttribute("verificationCode");
        if (storedCode == null || !storedCode.equals(user.getEmailVerificationCode())) {
            model.addAttribute("msg", "이메일 인증을 완료해주세요.");
            return "WEB-INF/mainpage/register.jsp";
        }

        try {
            service.registerUser(user);
            session.removeAttribute("verificationCode");
            return "redirect:/loginPage";
        } catch (Exception e) {
            model.addAttribute("msg", "회원가입 중 오류 발생");
            return "WEB-INF/mainpage/register.jsp";
        }
    }
    
    // 회원 등록 처리 메서드
    @PostMapping("/register")
    public String registerUser(@ModelAttribute Users user, Model model) {
        try {
            // 회원 정보를 데이터베이스에 저장
            service.registerUser(user);

            // 성공 메시지를 모델에 추가
            model.addAttribute("message", "회원가입이 성공적으로 완료되었습니다!");

            return "redirect:/loginPage"; // 회원가입 후 로그인 페이지로 이동
        } catch (Exception e) {
            // 예외 처리 및 에러 메시지를 모델에 추가
            model.addAttribute("error", "회원가입 중 오류가 발생했습니다. 다시 시도해 주세요.");
            return "register"; // 에러 발생 시 회원가입 페이지로 이동
        }
    }
    
}
