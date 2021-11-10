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
//		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);// 211109 16h10 Aws로 현 마스터 머지 한 이후에는 다시 죽일 것
		// 웹이나 리눅스는 slash 한 개임. 수정 211105
		.addResourceLocations("file:" + FileManagerService.FILE_UPLOAD_PATH);//211105 "file:/" 가 아니라 "file:"로 수정. FileManagerService에서 uploads 뒤에 / 붙였기 때문// 211109 16h10 Aws로 현 마스터 머지 한 이후에는 다시 살릴 것
		
		
	}
	
	
	
	
	
	
}
