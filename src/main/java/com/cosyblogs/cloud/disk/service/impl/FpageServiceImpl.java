package com.cosyblogs.cloud.disk.service.impl;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosyblogs.cloud.disk.dao.FpageDao;
import com.cosyblogs.cloud.disk.model.Fpage;
import com.cosyblogs.cloud.disk.model.Fsearch;
import com.cosyblogs.cloud.disk.service.FpageService;

@Service
public class FpageServiceImpl implements FpageService {

	@Autowired
	FpageDao fpageDao;

	@Override
	public Fpage search(int fowner) {
		// TODO Auto-generated method stub
		Fpage fpage = this.fpageDao.searchToatl(fowner);
		String[] arr = new String[7];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = null;
		for (int i = 0; i < 7; i++) {
			c = Calendar.getInstance();
			c.add(Calendar.DAY_OF_MONTH, -i - 1);
			arr[6 - i] = sdf.format(c.getTime());
		}
		fpage.setDate(arr);
		Fsearch index = null;
		String[] abc = new String[4];
		for (int ftype = 1; ftype < 5; ftype++) {

			index = this.fpageDao.search(ftype, fowner);
			abc[ftype - 1] = index.ftoSting();
		}
		fpage.setAbc(abc);
		return fpage;
	}

	@Override
	public Fpage searchtotal(int fowner, Fpage fpage) {
		// TODO Auto-generated method stub
		fpage = this.fpageDao.searchToatl(fowner);
		return fpage;
	}

}
