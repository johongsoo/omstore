package com.web.spring.mainController;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	
	//http://localhost:7070/MainPage
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
}
