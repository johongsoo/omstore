package com.web.spring.boardController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	
	// http://localhost:8080/boardlist
	@RequestMapping("boardlist")
	public String Boardlist() {
		return "WEB-INF\\board\\board.jsp";
	}
}
