package com.web.spring.mainDao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.spring.vo.Users;

@Mapper
public interface MainDao {
	
    @Select("SELECT *\r\n"
            + "FROM USERS \r\n"
            + "WHERE userid LIKE '%'||#{userid}||'%'\r\n"
            + "AND pwd LIKE '%'||#{pwd}||'%'")
    List<Users> userlist(Users user);
    
    @Select("SELECT *\r\n"
            + "FROM USERS\r\n"
            + "WHERE userid LIKE '%'||#{userid}||'%'\r\n"
            + "AND pwd LIKE '%'||#{pwd}||'%'")
    Users login(Users users);
    
    @Select("SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END FROM USERS WHERE userid = #{userid}")
    int selectId(String userid);
    
    @Insert("INSERT INTO Users (" +
            "userid, name, pwd, email, birthdate, address, address1, address2, phone, rating, point" +
            ") VALUES (" +
            "#{userid}, #{name}, #{pwd}, #{email}, #{birthdate}, #{address}, #{address1}, #{address2}, #{phone}, #{rating}, #{point}" +
            ")")
    void registerUser(Users user);
}
