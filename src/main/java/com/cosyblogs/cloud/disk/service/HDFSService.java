package com.cosyblogs.cloud.disk.service;

import java.io.InputStream;

import com.cosyblogs.cloud.disk.common.ApiResult;

public interface HDFSService {

	ApiResult mkdirs(String dirs);

	ApiResult upload(String fileName, InputStream input);

	ApiResult delete(String fileName);

	ApiResult rename(String oldStr, String newStr);

	ApiResult exists(String fileName);

	InputStream download(String fileName);

	ApiResult list(String path);

	void getFileLocation(String fileName);

}
