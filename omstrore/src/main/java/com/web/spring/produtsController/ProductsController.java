package com.web.spring.produtsController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.spring.productsService.ProductsService;
import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;

@Controller
public class ProductsController {
	
	@Autowired(required=false)
	private ProductsService service;
	
	//http://localhost:8080/odunglist
	@RequestMapping("odunglist")
	public String odunglist(OdungStore odung, Model model ) {
		model.addAttribute("odunglist", service.odunglist(odung));
		return "WEB-INF\\products\\odungstore.jsp";
	}
	
	
	
	
	
	//http://localhost:8080/mangbunglist
	@RequestMapping("mangbunglist")
	public String mangbunglist(MangbungStore mangbung, Model model) {
		model.addAttribute("mangbunglist", service.mangbunglist(mangbung));
		return "WEB-INF\\products\\mangbungstore.jsp";
	}
	
	//http://localhost:7070/odungdetail
	@GetMapping("odungdetail")
	public String odungdetail(@RequestParam("productsid") int productsid, Model model){
		model.addAttribute("odung", service.getodungdetail(productsid));
		return "WEB-INF\\products\\odung-detail.jsp";
	}
	
	//http://localhost:7070/mangbungdetail
	@GetMapping("mangbungdetail")
	public String mangbungdetail(@RequestParam("productsid") int productsid, Model model){
		model.addAttribute("mangbung", service.getmangbungdetail(productsid));
		return "WEB-INF\\products\\mangbung-detail.jsp";
	}

	
	//http://localhost:8080/ranklist
	@RequestMapping("ranklist")
	public String ranklist() {
		return "WEB-INF\\products\\ranklist.jsp";
	}
	
	
	//http://localhost:8080/cartlist
	@RequestMapping("cartlist")
	public String cartlist() {
		
		return "WEB-INF\\products\\product-cart.jsp";
	}
	
	
}
