package com.wbx.video_upload.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.wbx.video_upload.entity.User;

public interface UserRepository extends JpaRepository<User,Long>{
	
	public User findByPhoneAndPassword(String phone,String password);
	
	@Query("Select count(name) from User where id=?1")
	public int isFinish(long id);
}
