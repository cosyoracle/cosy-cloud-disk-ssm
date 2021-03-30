package com.cosyblogs.cloud.disk.service;

import com.cosyblogs.cloud.disk.common.ApiResult;
import com.cosyblogs.cloud.disk.model.Pagination;
import com.cosyblogs.cloud.disk.model.User;


public interface UserService {

    ApiResult insertUser(User user);

}
