package com.cosyblogs.cloud.disk.dao;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cosyblogs.cloud.disk.model.File;

public interface FileDao {
	
	int getCount(@Param("ffolder")int ffolder,@Param("fowner")int fowner);

	List<File> getFiles(@Param("start") Integer start, @Param("pageSize") Integer pageSize,@Param("ffolder")int ffolder,@Param("fowner")int fowner);

    int insertFile(File file);
    
    int deleteFile(int fid);
    
    int deleteFiles(String fids);
    
    int updateFile(HashMap <String,Object> map);
    
    int getRecycleCount(@Param("fowner")int fowner);
    
    List<File> getRecycleFiles(@Param("start") Integer start, @Param("pageSize") Integer pageSize,@Param("fowner")int fowner);

    int dropFile(int fid);
    
    int recoveryFile(int fid);
    
    int recoveryFiles(String fids);
    
    int collectFile(int fid);
    
    int getCollectCount(@Param("fowner")int fowner);
    
    List<File> getCollectFiles(@Param("start") Integer start, @Param("pageSize") Integer pageSize,@Param("fowner")int fowner);
    
    int dislikeFile(int fid);
    
    int insertDir(File file);
    
    int dropDir(int fid);
    
    
    
    
    
    

}
