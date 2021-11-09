package com.lytear.lytear;

import org.springframework.boot.SpringApplication;
//import org.springframework.boot.autoconfigure.EnableAutoConfiguration;//삭제 211105
import org.springframework.boot.autoconfigure.SpringBootApplication;//삭제 211105
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
//import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class LytearRealtyApplication extends SpringBootServletInitializer { // 211105 추가 : extends SpringBootServletInitializer

	public static void main(String[] args) {
		SpringApplication.run(LytearRealtyApplication.class, args);
	}
	
}
