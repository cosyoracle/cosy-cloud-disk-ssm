package com.cosyblogs.cloud.disk.service;

import java.util.HashMap;

import com.cosyblogs.cloud.disk.common.ApiResult;
import com.cosyblogs.cloud.disk.model.File;
import com.cosyblogs.cloud.disk.model.Pagination;

public interface FileService {
	Pagination<File> getFiles(Pagination page, int ffolder, int fowner);

	int insertFile(File file);

	ApiResult deleteFile(int fid);

	ApiResult deleteFiles(String fids);

	ApiResult updateFile(HashMap<String, Object> map);

	Pagination<File> getRecycleFiles(Pagination page, int fowner);

	int dropFile(int fid);

	ApiResult recoveryFile(int fid);

	ApiResult recoveryFiles(String fids);

	ApiResult collectFile(int fid);

	Pagination<File> getCollectFiles(Pagination page, int fowner);

	ApiResult dislikeFile(int fid);

	int insertDir(File file);

	int dropDir(int fid);

}
