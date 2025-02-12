package com.winebouti.setup;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.winebouti.mapper.MemberMapper;
import com.winebouti.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
    "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
    "file:src\\main\\webapp\\WEB-INF\\spring\\security-context.xml",
})
@Log4j
public class memberSetup {
  @Autowired private MemberMapper mapper;
  @Autowired private PasswordEncoder passwordEncoder;
  
  /*
   * IMPORTANT: Not test but register dummy users.
   * Uncomment @Test while only registering users
   */
//  @Test
  @Transactional @Commit
  public void signupSetup() {
    for(int i = 21; i <= 40; i++ ) {
      MemberVO memberVO = new MemberVO();
      memberVO.setUsername("user" + i);
      memberVO.setPassword(passwordEncoder.encode("password" + i));
      memberVO.setEmail("user" + i + "@example.com");
      memberVO.setPhoneNumber(String.format("010203040%2d", i));
      memberVO.setAddress("Address " + i);
      memberVO.setZipcode(String.valueOf(i/10) + String.valueOf(i%10).repeat(4));
      memberVO.setProfileImageName("user" + i + "_profile.png");
      memberVO.setRealProfileImageName("user" + i + "_profile_DOT_png");
      mapper.save(memberVO);
      if(i < 25) {
        mapper.grantAdmin(memberVO);
      }else {
        mapper.grantAuth(memberVO);
      }
    }
    
  }
}
