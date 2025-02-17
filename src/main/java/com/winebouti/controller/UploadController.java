package com.winebouti.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.winebouti.util.FileUtils;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@RequestMapping("/upload")
@Log4j
public class UploadController {

    private final File uploadFolder = new File(FileUtils.BASE_PATH, "review");
    private final File thumbFolder = new File(uploadFolder, "thumbnail");

    @PostMapping("/image")
    public ResponseEntity<Map<String, String>> uploadImage(@RequestParam("uploadFile") MultipartFile file){
    	log.info("파일 업로드 컨트롤러 작동중");
        Map<String, String> response = new HashMap<>();

        // 업로드할 폴더가 없으면 생성
        
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }
        if (!thumbFolder.exists()) {
            thumbFolder.mkdirs();
        }

        // 파일 검증 (확장자, 크기 제한)
        if (!isValidImageFile(file.getOriginalFilename())) {
            return ResponseEntity.badRequest().body(Map.of("error", "허용되지 않은 파일 형식입니다."));
        }
        if (file.getSize() > 5 * 1024 * 1024) {
            return ResponseEntity.badRequest().body(Map.of("error", "파일 크기가 5MB를 초과할 수 없습니다."));
        }

        try {
            String originalFilename = file.getOriginalFilename();
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
            File destFile = new File(uploadFolder, uniqueFilename);
            file.transferTo(destFile);
            
            // 썸네일 생성 (200x200)
            String thumbFilename = uniqueFilename;
            File thumbFile = new File(thumbFolder, thumbFilename);
            Thumbnails.of(destFile)
                      .size(200, 200)
                      .toFile(thumbFile);
            
            response.put("fileName", uniqueFilename);
            response.put("uploadPath", "review");
            response.put("thumbnailUrl", thumbFilename); // 썸네일 URL
            return ResponseEntity.ok(response);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "파일 업로드 실패"));
        }
    }

    // 이미지 확장자 검증
    private boolean isValidImageFile(String filename) {
        String[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif"};
        return filename != null && Arrays.stream(allowedExtensions).anyMatch(filename.toLowerCase()::endsWith);
    }
}
		