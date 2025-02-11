package com.winebouti.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter @Setter
public class OpenApiPaymentDTO {
  private String status;
  private Amount amount;

  @JsonIgnoreProperties(ignoreUnknown = true)
  @Getter @Setter
  public static class Amount {
    private int total;
  }
}
