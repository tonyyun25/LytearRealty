package com.lytear.lytear.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {


//	public final static String FILE_UPLOAD_PATH = "C:\\Users\\01.Web개발\\memo\\upload\\images/";
	
	public final static String FILE_UPLOAD_PATH = "D:\\윤진일\\프로젝트\\workspace\\LytearRealty\\upload\\images/";// 컴퓨터 경로 -> 서버에 저장할 경로로 바꿔야 함 211105// 211109 16h10 Aws로 현 마스터 머지 한 이후에는 다시 죽일 것
//	public final static String FILE_UPLOAD_PATH = "/home/ec2-user/uploads/"; // 211109 16h10 Aws로 현 마스터 머지 한 이후에는 다시 살릴 것
	
	public static String saveFile(int userId, MultipartFile file) {
		
//		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
//			logger.error("[FileManagerService saveFile] 디렉토리 생성 에러");
			return null;
		}
		
		// 실제 파일 저장 과정
		try {
			byte[] bytes = file.getBytes();//file.getBytes(): 실제 들어가 있는 파일 그 자체
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);//path(경로) 에 bytes(파일) 저장
			
		} catch (IOException e) {
//			logger.error("[FileManagerService saveFile] 파일 생성 실패");;
			e.printStackTrace();
			return null;
		}
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
	
	public static void removeFile(String filePath) {
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/",""); 
		
		Path path = Paths.get(realFilePath);
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		path = path.getParent();
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	
}
