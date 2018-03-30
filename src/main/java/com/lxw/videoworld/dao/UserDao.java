package com.lxw.videoworld.dao;

import com.lxw.videoworld.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao extends Dao<User> {


    @Override
    int add(User user);


        User findOneByNamePwd(@Param("userName") String userName, @Param("password") String password);
//    User findOneByNamePwd(String userName, String password);


}
