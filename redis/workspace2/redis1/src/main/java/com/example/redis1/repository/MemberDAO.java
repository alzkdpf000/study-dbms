package com.example.redis1.repository;

import com.example.redis1.domain.dto.MemberDTO;
import com.example.redis1.domain.vo.MemberVO;
import com.example.redis1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class MemberDAO {
    private final MemberMapper memberMapper;

    //    회원가입
    public void save(MemberVO memberVO){
        memberMapper.insert(memberVO);
    }

    //    로그인
    public Optional<MemberDTO> findByMemberEmailAndMemberPassword(String memberEmail, String memberPassword){
        return memberMapper.selectByMemberEmailAndMemberPassword(memberEmail, memberPassword);
    }
}
