package com.sosna.reservation.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sosna.reservation.entities.AppUsers;
import com.sosna.reservation.repos.AppUserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private AppUserRepository appUserRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		final AppUsers appUsers = appUserRepository.findByUserName(username)
				.orElseThrow(() -> new UsernameNotFoundException("User does not exist"));
		return User.builder().username(appUsers.getUserName()).password(appUsers.getPassword())
				.roles(appUsers.getRole()).build();
	}

}
