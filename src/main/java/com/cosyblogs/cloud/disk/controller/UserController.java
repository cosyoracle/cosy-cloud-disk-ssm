package com.cosyblogs.cloud.disk.controller;

import com.cosyblogs.cloud.disk.model.User;
import com.cosyblogs.cloud.disk.service.UserService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// http://localhost:8080/disk/user/getUsers

	// http://localhost:8080/disk/user/insertUsers
	@PostMapping("/insertUser")
	@ResponseBody
	public void insertUser(String username, String password, String role, HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String key = "svip" + sdf.format(new Date());
		if (role.equals(key)) {
			User user = new User(username, password, "user");
			this.userService.insertUser(user);
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
