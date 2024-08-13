package com.web.spring.productsService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.spring.productsDao.ProductsDao;
import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;

@Service
public class ProductsService {

	
	@Autowired(required=false)
	private ProductsDao dao;

	
// ======================================================================
	public List<OdungStore> odunglist(OdungStore odung){
		if(odung.getName()==null) odung.setName("");
		if(odung.getCategory()==null) odung.setCategory("");
	
		
		odung.setName("%"+odung.getName()+"%");
		odung.setCategory("%"+odung.getCategory()+"%");
		return dao.odunglist(odung);
	}
	
	public OdungStore getodungdetail(int productsid) {
		return dao.getodungdetail(productsid);
	}

	
// ======================================================================
	public List<MangbungStore> mangbunglist(MangbungStore mangbung){
		if(mangbung.getName()==null) mangbung.setName("");
		if(mangbung.getCategory()==null) mangbung.setCategory("");
	
		
		mangbung.setName("%"+mangbung.getName()+"%");
		mangbung.setCategory("%"+mangbung.getCategory()+"%");
		return dao.mangbunglist(mangbung);
	}
	
	public MangbungStore getmangbungdetail(int productsid) {
		return dao.getmangbungdetail(productsid);
	}
}
