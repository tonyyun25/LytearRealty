package com.lytear.lytear.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lytear.lytear.common.FileManagerService;



@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
//		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
		// 웹이나 리눅스는 slash 한 개임. 수정 211105
		.addResourceLocations("file:/" + FileManagerService.FILE_UPLOAD_PATH);
	}
	
	
	
	
	
	
}
