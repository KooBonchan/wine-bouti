package com.winebouti.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AuthVO {
	private String username;
	private String auth;
  public AuthVO(String auth) {
    super();
    this.auth = auth;
  }
}
