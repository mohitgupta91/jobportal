package com.job.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.job.constants.Role;
import com.job.model.WebUser;

public interface UserService extends UserDetailsService {

	WebUser getUserByUserName(String userName);

	void saveOrUpdateUser(WebUser user);

	List<Role> getAllRoles();

	void saveOrUpdateRole(Role role);

	List<WebUser> getUsers();

	WebUser findUserById(Long id);

	void enableUser(Long id);

	void disableUser(Long id);

	boolean checkUser(String userName);
	
	void changeCurrentUserPassword(String passwd);

	void changeUserPassword(Long id, String passwd);
	
	void autoLogin(String userName, String password);

}
