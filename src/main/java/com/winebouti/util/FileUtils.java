package com.winebouti.util;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUtils {
	
    public static final String BASE_PATH = System.getenv("UPLOAD_DIR") != null
	    ? System.getenv("UPLOAD_DIR")
	    : "C:\\upload";
    public static final String REVIEW_PATH = "review";
    public static final String THUMBNAIL_FOLDER = "thumbnail";
	
    public static String getPathByDate() {
		return new SimpleDateFormat("yy-MM-dd")
				.format(new Date())
				.replace("-", File.separator);
	}
	public static boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch(Exception e) {
			log.error(e.getMessage());
			log.error("non-image file is stored: " + file.toString());
		}
		return false;
	}
	
	
	/* 파일 경로를 URL로 직접 전달 시 escape 문자를 사용해도 스프링에서 인식하지 않는 문제 발생
	 * 수동으로 File Separator, Dot 문자를 인코딩하여 문제 해결 
	 * 다른 해결방법: Base64 인코딩을 사용할 수 있음 */
	public static String decodeImagePath(String imagePath) {
		return imagePath.replace("_SLASH_", File.separator);
	}
	public static String decodeRealFileName(String realFileName) {
		return realFileName.replace("_DOT_", ".");
	}
	public static String encodeImagePath(String imagePath) {
		return imagePath.replace(File.separator, "_SLASH_");
	}
	public static String encodeRealFileName(String realFileName) {
		return realFileName.replace(".", "_DOT_");
	}
}
