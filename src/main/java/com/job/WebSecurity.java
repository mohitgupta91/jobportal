package com.job;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.job.constants.Role;

@Configuration
@EnableWebSecurity
public class WebSecurity extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry authRegistry = http.authorizeRequests();
		http.csrf().disable();
		
		authRegistry.antMatchers("/static/**").permitAll()
					.antMatchers("/vendor/**").permitAll()
					.antMatchers("/").permitAll();

		authRegistry.antMatchers("/user/**").access("hasRole('ROLE_ADMIN')")
					.antMatchers("/view/**").access("hasRole('ROLE_ADMIN')");
				
		authRegistry.anyRequest().authenticated()
					.and().formLogin().loginPage("/")
					.defaultSuccessUrl("/home")
		            .loginProcessingUrl("/j_spring_security_check")
		            .usernameParameter("username")
		            .passwordParameter("password").permitAll()
					.and().logout().permitAll()
					.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
					.and().exceptionHandling().accessDeniedPage("/login?error=true");
		
	}
}


