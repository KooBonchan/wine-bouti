package com.winebouti.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.winebouti.vo.OpenApiPaymentDTO;
import com.winebouti.vo.PurchaseVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class PurchaseVerificationService {
  private final RestTemplate restTemplate;
  private final String apiUrl = "https://api.portone.io";
  
  @Autowired private String secretKey; // Replace with the actual secret key
    
  public boolean verifyPurchaseData(PurchaseVO purchaseVO) {
    String paymentId = purchaseVO.getPurchaseId().toString();
    String url = UriComponentsBuilder.fromUriString(apiUrl)
        .pathSegment("payments", paymentId)
        .toUriString();
    
    HttpHeaders headers = new HttpHeaders();
    headers.set("Authorization", "Portone " + secretKey);
    headers.setContentType(MediaType.APPLICATION_JSON);
    
    HttpEntity<String> entity = new HttpEntity<>("", headers);
    ResponseEntity<String> response = restTemplate.exchange(
        url, HttpMethod.GET, entity, String.class);
    
    if(response.getStatusCode() == HttpStatus.OK) {
      try {
        ObjectMapper objectMapper = new ObjectMapper();
        OpenApiPaymentDTO paymentDTO = objectMapper.readValue(response.getBody(), OpenApiPaymentDTO.class);
        if(paymentDTO.getStatus().equals("PAID") &&
           paymentDTO.getAmount().getTotal() == purchaseVO.getTotalPrice()) {
          return true;
        } else {
          return false;
        }
      }catch (Exception e) {
        e.printStackTrace();
        throw new RuntimeException("Failed while parsing payment data. " + e.getMessage());
      }
    }
    else {
      throw new RuntimeException("Failed to verify payment data. Status: " + response.getStatusCode());
    }
  }


}
