package com.cosyblogs.cloud.disk.service.impl;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IOUtils;
import org.springframework.stereotype.Service;

import com.cosyblogs.cloud.disk.common.ApiResult;
import com.cosyblogs.cloud.disk.service.HDFSService;

import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@Service
public class HDFSServiceImpl implements HDFSService {

	private static final String HDFS_URI = "hdfs://192.168.119.136:9000";

	/**
	 * 获取 HDFS 文件系统对象
	 */
	private static FileSystem getFileSystem() {
		System.setProperty("HADOOP_USER_NAME", "root");
		FileSystem fs = null;
		try {
			fs = FileSystem.get(URI.create(HDFS_URI), new Configuration());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return fs;
	}

	/**
	 * 创建文件夹
	 */
	public ApiResult mkdirs(String dirs) {
		boolean flag = false;
		try {
			flag = this.getFileSystem().mkdirs(new Path(dirs));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag ? ApiResult.success() : ApiResult.failure("Operate Failure !");
	}

	/**
	 * 创建文件
	 */
	public ApiResult upload(String fileName, InputStream input) {
		boolean flag = false;
		FSDataOutputStream fos = null;
		try {
			fos = this.getFileSystem().create(new Path(fileName));
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = input.read(buffer)) != -1) {
				fos.write(buffer, 0, len);
			}
			IOUtils.closeStream(fos);
			flag = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag ? ApiResult.success() : ApiResult.failure("Operate Failure !");
	}

	/**
	 * 删除文件夹 or 文件
	 */
	public ApiResult delete(String fileName) {
		boolean flag = false;
		try {
			flag = this.getFileSystem().delete(new Path(fileName), true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag ? ApiResult.success() : ApiResult.failure("Operate Failure !");
	}

	/**
	 * 重命名文件夹 or 文件
	 */
	public ApiResult rename(String oldStr, String newStr) {
		boolean flag = false;
		try {
			flag = this.getFileSystem().rename(new Path(oldStr), new Path(newStr));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag ? ApiResult.success() : ApiResult.failure("Operate Failure !");
	}

	/**
	 * 文件是否存在
	 */
	public ApiResult exists(String fileName) {
		boolean flag = false;
		try {
			flag = this.getFileSystem().exists(new Path(fileName));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag ? ApiResult.success("File exists !", true) : ApiResult.success("File not exists !", false);
	}

	/**
	 * 下载
	 */
	public InputStream download(String fileName) {
		FSDataInputStream fis = null;
		try {
			fis = this.getFileSystem().open(new Path(fileName));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return fis;
	}

	/**
	 * 遍历指定路径下的文件
	 */
	public ApiResult list(String path) {
		List<String> list = new ArrayList<String>();
		try {
			// 方式一
			RemoteIterator<LocatedFileStatus> iterator = this.getFileSystem().listFiles(new Path(path), true);
			while (iterator.hasNext()) {
				LocatedFileStatus ls = iterator.next();
				list.add(ls.getPath().getName());
			}
			// 方式二
			FileStatus[] fileStatus = this.getFileSystem().listStatus(new Path(path));
			for (int i = 0; i < fileStatus.length; i++) {
				System.out.println(fileStatus[i].getPath().toString());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ApiResult.success(list);
	}

	/**
	 * 查找某个文件在集群中的位置
	 */
	public void getFileLocation(String fileName) {
		try {
			FileStatus fileStatus = this.getFileSystem().getFileStatus(new Path(fileName));
			BlockLocation[] blockLocation = this.getFileSystem().getFileBlockLocations(fileStatus, 0,
					fileStatus.getLen());
			for (int i = 0; i < blockLocation.length; i++) {
				String[] hosts = blockLocation[i].getHosts();
				System.out.println("block_" + i + "_location:" + hosts[0]);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
