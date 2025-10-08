package com.example.redis1.mapper;

import com.example.redis1.domain.dto.MemberDTO;
import com.example.redis1.domain.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface MemberMapper {
//    회원가입
    public void insert(MemberVO memberVO);

//    로그인
    public Optional<MemberDTO> selectByMemberEmailAndMemberPassword(String memberEmail, String memberPassword);
}
