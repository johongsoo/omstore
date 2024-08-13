package com.web.spring.productsDao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;

@Mapper
public interface ProductsDao {

	@Select("SELECT * \r\n"
			+ "FROM odungstore \r\n"
			+ "WHERE name LIKE '%'||#{name}||'%'\r\n"
			+ "AND category LIKE '%'||#{category}||'%'")
	
	List<OdungStore> odunglist(OdungStore odung);
	
	@Select("SELECT * \r\n"
			+ "FROM odungstore \r\n"
			+ "WHERE productsid = #{productsid} ")
	
	OdungStore getodungdetail(@Param("productsid") int productsid);

/* =============================================================================== */	
	
	@Select("SELECT * \r\n"
			+ "FROM mangbungstore \r\n"
			+ "WHERE name LIKE '%'||#{name}||'%'\r\n"
			+ "AND category LIKE '%'||#{category}||'%'")
	
	List<MangbungStore> mangbunglist(MangbungStore mangbung);

	@Select("SELECT * \r\n"
			+ "FROM mangbungstore \r\n"
			+ "WHERE productsid = #{productsid} ")
	
	MangbungStore getmangbungdetail(@Param("productsid") int productsid);
}
