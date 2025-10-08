package com.example.postgresql.mapper;

import com.example.postgresql.domain.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class MemberMapperTests {
    @Autowired
    private MemberMapper memberMapper;

    @Test
    public void testInsert(){
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberEmail("test@gmail.com");
        memberVO.setMemberPassword("1234");
        memberVO.setMemberName("test");

        memberMapper.insert(memberVO);
        log.info("#########{}", memberVO);
    }
}














