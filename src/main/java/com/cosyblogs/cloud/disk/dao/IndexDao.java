package com.cosyblogs.cloud.disk.dao;

import org.apache.ibatis.annotations.Param;

import com.cosyblogs.cloud.disk.model.User;

public interface IndexDao {

    User login(@Param("username") String username, @Param("password") String password);

}
