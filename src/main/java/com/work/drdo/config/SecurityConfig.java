
package com.work.drdo.config;

import static com.work.drdo.utils.ServiceConstants.ACCESS_DENIED_PAGE;
import static com.work.drdo.utils.ServiceConstants.INVALID_SESSION_URL;
import static com.work.drdo.utils.ServiceConstants.LOGIN_PAGE;
import static com.work.drdo.utils.ServiceConstants.LOGOUT_ACTION;
import static com.work.drdo.utils.ServiceConstants.LOGOUT_SUCCESS_PAGE;
import static com.work.drdo.utils.ServiceConstants.SESSION_EXPIRED_URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	private int maxSessions = 1;
	@Autowired
	private UserDetailsService userAuthService;

	@Autowired
	private AuthenticationResponseHandler authHandler;
	
	@Autowired
	private LogoutSuccessHandler logoutSuccessHandler;
	
    @Bean
	public PasswordEncoder passwordEncoder(){
    	return new BCryptPasswordEncoder();
	}
    
    @Bean
    public AuthenticationProvider authProvider(){
    	DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
    	authProvider.setUserDetailsService(userAuthService);
    	authProvider.setPasswordEncoder(passwordEncoder());
    	return authProvider;
    }
    
	@Autowired
    public void configAuthentication(AuthenticationManagerBuilder authManager) throws Exception {
    	authManager.authenticationProvider(authProvider());
    }
    
	@Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.authorizeRequests()
    		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
    		.antMatchers("/zone/**").access("hasRole('ROLE_CHIEF_ZONAL_COMMISSIONER')")
    		.antMatchers("/cc/**").access("hasRole('ROLE_COMMISSIONER')")
    		.antMatchers("/division/**").access("hasRole('ROLE_DIVISION_OFFICIER')")
    		.antMatchers("/deptHead/**").access("hasRole('ROLE_DEPTHEAD')")    		
    		.antMatchers("/groupHead/**").access("hasRole('ROLE_GROUPHEAD')")
    		.antMatchers("/scientist/**").access("hasRole('ROLE_SCIENTIST')")
    		
    		.antMatchers("/logout").permitAll() 
    		.antMatchers("/admin/updateAdminPassword").access("hasAnyRole('ROLE_DEPTHEAD,ROLE_GROUPHEAD,ROLE_SCIENTIST,ROLE_CHIEF_ZONAL_COMMISSIONER', 'ROLE_ADMIN', 'ROLE_COMMISSIONER', 'ROLE_DIVISION_OFFICIER')")
    		.and()
			.formLogin()
				.loginPage(LOGIN_PAGE)
				.successHandler(authHandler)
				.failureHandler(authHandler)
				.usernameParameter("userId")
				.passwordParameter("password")
		.and()
			.logout()
				.logoutSuccessUrl(LOGOUT_SUCCESS_PAGE)
				.logoutUrl(LOGOUT_ACTION)
				.invalidateHttpSession(Boolean.FALSE)
				.logoutSuccessHandler(logoutSuccessHandler)
				.deleteCookies("JSESSIONID")
		.and()
			.exceptionHandling()
				.accessDeniedPage(ACCESS_DENIED_PAGE)
		.and()
			.csrf()
		.and()
			.sessionManagement()
				.invalidSessionUrl(INVALID_SESSION_URL)
				.maximumSessions(maxSessions)
				.expiredUrl(SESSION_EXPIRED_URL)
		;
    			
    }
    
}

