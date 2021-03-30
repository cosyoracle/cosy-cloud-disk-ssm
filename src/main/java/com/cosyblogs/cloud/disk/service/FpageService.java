package com.cosyblogs.cloud.disk.service;

import com.cosyblogs.cloud.disk.model.Fpage;

public interface FpageService {
	Fpage search(int fowner);

	Fpage searchtotal(int fowner, Fpage fpage);

}
