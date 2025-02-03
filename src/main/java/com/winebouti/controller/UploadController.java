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

@RestController
@RequestMapping("/upload")
public class UploadController {

    private final String uploadDir = "C:/upload/review/";

    @PostMapping("/image")
    public ResponseEntity<Map<String, String>> uploadImage(@RequestParam("uploadFile") MultipartFile file) {
        Map<String, String> response = new HashMap<>();

        // ✅ 업로드할 폴더가 없으면 생성
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        // ✅ 파일 검증 (확장자, 크기 제한)
        if (!isValidImageFile(file.getOriginalFilename())) {
            return ResponseEntity.badRequest().body(Map.of("error", "허용되지 않은 파일 형식입니다."));
        }
        if (file.getSize() > 5 * 1024 * 1024) {
            return ResponseEntity.badRequest().body(Map.of("error", "파일 크기가 5MB를 초과할 수 없습니다."));
        }

        try {
            String originalFilename = file.getOriginalFilename();
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
            File destFile = new File(uploadDir + uniqueFilename);
            file.transferTo(destFile);

            response.put("fileName", uniqueFilename);
            response.put("uploadPath", uploadDir);
            return ResponseEntity.ok(response);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "파일 업로드 실패"));
        }
    }

    // ✅ 이미지 확장자 검증
    private boolean isValidImageFile(String filename) {
        String[] allowedExtensions = {".jpg", ".jpeg", ".png", ".gif"};
        return Arrays.stream(allowedExtensions).anyMatch(filename.toLowerCase()::endsWith);
    }
}
		