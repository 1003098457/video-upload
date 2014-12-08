package com.wbx.video_upload.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.exception.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wbx.video_upload.entity.User;
import com.wbx.video_upload.service.UserService;
import com.wbx.video_upload.support.MD5;

@Controller
@RequestMapping(value = "/user")

public class UserController {

	private static final Logger LOG = LoggerFactory
			.getLogger(UserController.class);

	@Inject
	UserService userService;

	@RequestMapping(value = "/login")
	@ResponseBody
	public boolean login(HttpServletRequest request,String phone, String password) {
		boolean flag;
		User user = userService.findByPhoneAndPassword(phone.trim(),
				MD5.GetMD5Code(password.trim()));
		if (user != null) {
			HttpSession session  = request.getSession();
			System.out.println(session.getAttribute("userid"));
			session.setAttribute("userid", user.getId());
			flag =  true;
		} else {
			flag =  false;
		}
		return flag;
	}

	@RequestMapping(value = "/regist")
	@ResponseBody
	public boolean regist(HttpServletRequest request,String phone, String password) {
		boolean flag;
		try {
			User user = userService.Regist(phone.trim(),
					MD5.GetMD5Code(password.trim()));
			HttpSession session  = request.getSession();
			session.setAttribute("userid", user.getId());
			flag = true;
		} catch (ConstraintViolationException e) {
			LOG.info(e.getMessage());
			flag = false;
		}
		return flag;
	}
	
	@RequestMapping(value="/isfinish")
	public String isFinish(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(userService.isFinish((Long)session.getAttribute("userid"))){
			return "zuopin_upload";
		}else{
			return "data_upload";
		}
	}
}
