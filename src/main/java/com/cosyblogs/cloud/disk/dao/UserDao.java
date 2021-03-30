package com.cosyblogs.cloud.disk.dao;

import org.apache.ibatis.annotations.Param;

import com.cosyblogs.cloud.disk.model.User;

import java.util.List;

public interface UserDao {

    int getCount();

    int insertUser(User user);
}
