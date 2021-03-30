package com.cosyblogs.cloud.disk.service;

import com.cosyblogs.cloud.disk.model.User;

public interface IndexService {

	User login(String username, String password);
}
