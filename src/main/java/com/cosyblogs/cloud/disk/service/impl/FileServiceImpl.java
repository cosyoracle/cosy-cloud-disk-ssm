package com.cosyblogs.cloud.disk.service.impl;

import com.cosyblogs.cloud.disk.common.ApiResult;
import com.cosyblogs.cloud.disk.dao.FileDao;
import com.cosyblogs.cloud.disk.model.File;
import com.cosyblogs.cloud.disk.model.Pagination;
import com.cosyblogs.cloud.disk.service.FileService;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDao fileDao;

	@Override
	public Pagination<File> getFiles(Pagination page, int ffolder, int fowner) {
		// TODO Auto-generated method stub
		int start = (page.getPageNum() - 1) * page.getPageSize();
		int total = this.fileDao.getCount(ffolder, fowner);
		List<File> rows = this.fileDao.getFiles(start, page.getPageSize(), ffolder, fowner);
		page.setTotal(total);
		page.setRows(rows);
		return page;
	}

	@Override
	public int insertFile(File file) {
		// TODO Auto-generated method stub
		int result = this.fileDao.insertFile(file);
		return result;
	}

	@Override
	public ApiResult deleteFile(int fid) {
		// TODO Auto-generated method stub
		int result = this.fileDao.deleteFile(fid);
		return result > 0 ? ApiResult.success("Your file data has been deleted.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public ApiResult updateFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int result = this.fileDao.updateFile(map);
		return result > 0 ? ApiResult.success("Your file data has been updated.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public ApiResult deleteFiles(String fids) {
		// TODO Auto-generated method stub
		int result = this.fileDao.deleteFiles(fids);
		return result > 0 ? ApiResult.success("Your file data has been updated.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public Pagination<File> getRecycleFiles(Pagination page, int fowner) {
		// TODO Auto-generated method stub
		int start = (page.getPageNum() - 1) * page.getPageSize();
		int total = this.fileDao.getRecycleCount(fowner);
		List<File> rows = this.fileDao.getRecycleFiles(start, page.getPageSize(), fowner);
		page.setTotal(total);
		page.setRows(rows);
		return page;
	}

	@Override
	public int dropFile(int fid) {
		// TODO Auto-generated method stub
		int result = this.fileDao.dropFile(fid);
		return result;
	}

	@Override
	public ApiResult recoveryFile(int fid) {
		// TODO Auto-generated method stub
		int result = this.fileDao.recoveryFile(fid);
		return result > 0 ? ApiResult.success("Your file data has been updated.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public ApiResult collectFile(int fid) {
		// TODO Auto-generated method stub
		int result = this.fileDao.collectFile(fid);
		return result > 0 ? ApiResult.success("Your file data has been updated.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public Pagination<File> getCollectFiles(Pagination page, int fowner) {
		// TODO Auto-generated method stub
		int start = (page.getPageNum() - 1) * page.getPageSize();
		int total = this.fileDao.getCollectCount(fowner);
		List<File> rows = this.fileDao.getCollectFiles(start, page.getPageSize(), fowner);
		page.setTotal(total);
		page.setRows(rows);
		return page;
	}

	@Override
	public ApiResult dislikeFile(int fid) {
		// TODO Auto-generated method stub
		int result = this.fileDao.dislikeFile(fid);
		return result > 0 ? ApiResult.success("Your file data has been updated.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public ApiResult recoveryFiles(String fids) {
		// TODO Auto-generated method stub
		int result = this.fileDao.recoveryFiles(fids);
		return result > 0 ? ApiResult.success("Your file data has been updated.")
				: ApiResult.failure("Database operate failure !");
	}

	@Override
	public int insertDir(File file) {
		// TODO Auto-generated method stub
		int result = this.fileDao.insertDir(file);
		return result;
	}

	@Override
	public int dropDir(int fid) {
		// TODO Auto-generated method stub
		int result = this.fileDao.dropDir(fid);
		return result;
	}

}
