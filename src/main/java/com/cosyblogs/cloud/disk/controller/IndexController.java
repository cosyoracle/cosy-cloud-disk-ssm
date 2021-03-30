package com.cosyblogs.cloud.disk.controller;

import com.cosyblogs.cloud.disk.model.Fpage;
import com.cosyblogs.cloud.disk.model.User;
import com.cosyblogs.cloud.disk.service.FpageService;
import com.cosyblogs.cloud.disk.service.IndexService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;
	@Autowired
	private FpageService fapgeService;

	@RequestMapping("/login")
	public String login(String username, String password, HttpSession session) {
		User user = this.indexService.login(username, password);
		if (user == null) {
			return "/index";

		}
		Fpage fpage = this.fapgeService.search(Integer.parseInt(user.getId()));
		session.setAttribute("user", user);
		session.setAttribute("fpage", fpage);
		return "/index";
	}

	@RequestMapping("/index")
	public String index(HttpSession session) {
		User user = (User) session.getAttribute("user");
		Fpage fpage = (Fpage) session.getAttribute("fpage");
		Fpage newfpage = this.fapgeService.searchtotal(Integer.parseInt(user.getId()), fpage);
		fpage.setTpicture(newfpage.getTpicture());
		fpage.setTfile(newfpage.getTfile());
		fpage.setTmusic(newfpage.getTmusic());
		fpage.setTvideo(newfpage.getTvideo());
		session.setAttribute("fpage", fpage);
		return "/index";

	}

}
