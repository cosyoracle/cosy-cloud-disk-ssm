package com.cosyblogs.cloud.disk.dao;



import org.apache.ibatis.annotations.Param;

import com.cosyblogs.cloud.disk.model.Fpage;
import com.cosyblogs.cloud.disk.model.Fsearch;

public interface FpageDao {
	Fpage searchToatl(int fowner);
	
	Fsearch search(@Param("ftype")int ftype,@Param("fowner")int fowner);

}
