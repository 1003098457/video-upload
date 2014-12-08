package com.wbx.video_upload.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wbx.video_upload.dao.UserRepository;
import com.wbx.video_upload.entity.User;

@Service
public class UserService {
	
	@Inject
	UserRepository userRepoditory;
	
	public User findByPhoneAndPassword(String phone,String password){
		return userRepoditory.findByPhoneAndPassword(phone, password);
	};
	
	public User Regist(String phone,String password){
		User user = new User();
		user.setPhone(phone);
		user.setPassword(password);
		return userRepoditory.save(user);
	}
	
	public boolean isFinish(long id){
		if(userRepoditory.isFinish(id)==1)
			return true;
		else
			return false;
	}
}
