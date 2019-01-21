
package com.work.drdo.utils;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.work.drdo.domain.login.LoggedInUser;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.executive.entity.UserRole;
import com.work.drdo.framework.exception.ServiceException;



public class SecurityUtils {

	private static final Logger logger = LoggerFactory.getLogger(SecurityUtils.class);
	
	public static HttpSession getLoggedInSession(){
		final ServletRequestAttributes requestAttribs = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		if(null != requestAttribs && null != requestAttribs.getRequest()){
			return requestAttribs.getRequest().getSession();
		}
		return null;
	}
	
	public static Object getSessionAttrib(String key){
		HttpSession loggedInSession = getLoggedInSession();
		if(null != loggedInSession){
			return loggedInSession.getAttribute(key);
		}
		throw new ServiceException("login.session.expired");
	}

	public static void setSessionAttrib(String key, Object obj){
		HttpSession loggedInSession = getLoggedInSession();
		if(null != loggedInSession){
			loggedInSession.setAttribute(key, obj);
		}
	}
	
	public static LoggedInUser getLoggedInUser(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(null != auth && null != auth.getPrincipal()){
			if(auth.getPrincipal() instanceof LoggedInUser){
				return (LoggedInUser)auth.getPrincipal();
			}
		}
		return null;
	}
	public static LoggedInUser getValidLoggedInUser(){
		LoggedInUser userProfile = getLoggedInUser();
		if(null == userProfile){
			throw new ServiceException("login.session.expired");
		}
		return userProfile;
	}
	
	public static String getUserId(){
	    LoggedInUser userProfile = getLoggedInUser();
		if(null == userProfile){
			throw new ServiceException("login.session.expired");
		}
		return userProfile.getUserId();
	}
	
	public static UserProfile getUserProfile(){
	    LoggedInUser userProfile = getLoggedInUser();
		if(null == userProfile){
			throw new ServiceException("login.session.expired");
		}
		return userProfile.getUserProfile();
	}
	public static UserRole getRole(){
	    LoggedInUser userProfile = getLoggedInUser();
		if(null == userProfile){
			throw new ServiceException("login.session.expired");
		}
		return userProfile.getRole();
	}
	public static Set<String> getGrantedRoles(){
		LoggedInUser userInfo = getLoggedInUser();
		if(null == userInfo || CollectionUtils.isEmpty(userInfo.getAuthorities())){
			throw new ServiceException("login.session.expired");
		}
		
		return AuthorityUtils.authorityListToSet(userInfo.getAuthorities());
	}

	public static Set<String> getGrantedRoles(Authentication auth){
		if(CollectionUtils.isEmpty(auth.getAuthorities())){
			throw new ServiceException("login.session.expired");
		}
		return AuthorityUtils.authorityListToSet(auth.getAuthorities());
	}
		
	
	
	public static ServletRequestAttributes getServletAttributes(){
		return (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
	}
	
	public static String getReportFileLocation(){
		ServletContext servletContext =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getServletContext();
		return servletContext.getRealPath("/");
	}
	
	public static String getRequestURL(){
		return getServletAttributes().getRequest().getRequestURL().toString();
	}
	
	public static String getRequestDomainName(){
		String requestURI = getServletAttributes().getRequest().getRequestURI();
		String requestURL = getRequestURL();
		String domainName = requestURL.substring(0, requestURL.indexOf(requestURI));
		
		logger.debug(String.format("Retrieved Domain Name {%s} from RequestURL {%s} and RequestURI {%s}", domainName, requestURL, requestURI));
		return domainName;
	}

	public static String getCtxPath(){
		return getServletAttributes().getRequest().getContextPath();
	}
	
}
