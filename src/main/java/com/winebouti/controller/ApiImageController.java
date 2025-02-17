package com.winebouti.controller;

import static com.winebouti.util.FileUtils.BASE_PATH;
import static com.winebouti.util.FileUtils.THUMBNAIL_FOLDER;
import static com.winebouti.util.FileUtils.decodeImagePath;
import static com.winebouti.util.FileUtils.decodeRealFileName;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("api/image")
@Log4j
public class ApiImageController {
	
	// 썸네일 이미지 반환
	// 요청 예시: GET /api/image/thumbnail/{path}/{filename}
	@GetMapping("thumbnail/{path}/{filename}")
	public ResponseEntity<byte[]> getThumbnail(
		@PathVariable("path") String path,
		@PathVariable("filename") String filename
	){
		path = decodeImagePath(path);
		filename = decodeRealFileName(filename);
		
		// 썸네일 폴더 위치
		File dir = new File(BASE_PATH, path + File.separator + THUMBNAIL_FOLDER);
		File file = new File(dir, filename);
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			return ResponseEntity.ok()
					.headers(headers)
					.body(FileCopyUtils.copyToByteArray(file));
		} catch(IOException e) {
		  log.warn("env var $UPLOAD_DIR: " + System.getenv("UPLOAD_DIR"));
		  log.warn("Upload base dir: " + BASE_PATH);
		  log.error(e.getMessage());
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	// 원본 이미지 제공 API
	// 요청 예시: GET /api/image/{path}/{filename}
	@GetMapping("{path}/{filename}")
	public ResponseEntity<byte[]> getImage(
		@PathVariable("path") String path,
		@PathVariable("filename") String filename
	){
		path = decodeImagePath(path);
		filename = decodeRealFileName(filename);
		
		// 이미지 파일의 전체 경로 설정
		File dir = new File(BASE_PATH, path);
		File file = new File(dir, filename);
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			return ResponseEntity.ok()
					.headers(headers)
					.body(FileCopyUtils.copyToByteArray(file));
		} catch(IOException e) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
}
