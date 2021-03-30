package com.cosyblogs.cloud.disk.service.impl;

import com.cosyblogs.cloud.disk.dao.IndexDao;
import com.cosyblogs.cloud.disk.model.User;
import com.cosyblogs.cloud.disk.service.IndexService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private IndexDao indexDao;

    @Override
    public User login(String username, String password) {
        return this.indexDao.login(username, password);
    }
}
