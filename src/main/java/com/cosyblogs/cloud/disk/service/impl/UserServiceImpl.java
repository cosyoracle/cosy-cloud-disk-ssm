package com.cosyblogs.cloud.disk.service.impl;

import com.cosyblogs.cloud.disk.common.ApiResult;
import com.cosyblogs.cloud.disk.dao.UserDao;
import com.cosyblogs.cloud.disk.model.Pagination;
import com.cosyblogs.cloud.disk.model.User;
import com.cosyblogs.cloud.disk.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public ApiResult insertUser(User user) {
		int result = this.userDao.insertUser(user);
		return result > 0 ? ApiResult.success("Your imaginary data has been inserted.")
				: ApiResult.failure("Database operate failure !");
	}

}
