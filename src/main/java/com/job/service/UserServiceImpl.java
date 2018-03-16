package com.job.service;

import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.job.constants.Role;
import com.job.dao.UserRepository;
import com.job.model.WebUser;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepo;

	@Autowired
	private AuthenticationManager authenticationManager;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		WebUser user = userRepo.findByUserName(userName);
		return user != null ? user : new WebUser();
	}

	@Override
	public WebUser getUserByUserName(String userName) {
		return userRepo.findByUserName(userName);
	}

	@Override
	public void saveOrUpdateUser(WebUser user) {
		userRepo.save(user);
	}

	@Override
	public List<Role> getAllRoles() {
		return Arrays.asList(Role.values());
	}

	@Override
	public void saveOrUpdateRole(Role role) {
	}

	@Override
	public List<WebUser> getUsers() {
		List<WebUser> users = (List<WebUser>) userRepo.findAll();
		return users;
	}

	@Override
	public WebUser findUserById(Long id) {
		return userRepo.findOne(id);
	}

	@Override
	public void enableUser(Long id) {
		WebUser user = userRepo.findOne(id);
		user.setEnabled(true);
		userRepo.save(user);
	}

	@Override
	public void disableUser(Long id) {
		WebUser user = userRepo.findOne(id);
		user.setEnabled(false);
		userRepo.save(user);
	}

	@Override
	public boolean checkUser(String userName) {
		return userRepo.findByUserName(userName) != null ? true : false;
	}

	@Override
	public void changeCurrentUserPassword(String passwd) {
		WebUser user = (WebUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		user.setPassword(passwd);
		saveOrUpdateUser(user);
	}

	@Override
	public void changeUserPassword(Long id, String passwd) {
		WebUser user = userRepo.findOne(id);
		user.setPassword(passwd);
		userRepo.save(user);
	}

	@Override
	public void autoLogin(String userName, String password) {
		UserDetails userDetails = loadUserByUsername(userName);
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
				userDetails, password, userDetails.getAuthorities());

		authenticationManager.authenticate(usernamePasswordAuthenticationToken);

		if (usernamePasswordAuthenticationToken.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
		}
	}

}
