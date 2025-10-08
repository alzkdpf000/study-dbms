package com.example.redis1.service;

import com.example.redis1.domain.dto.MemberDTO;
import com.example.redis1.domain.vo.MemberVO;

import java.util.Optional;

public interface MemberService {
    public void join(MemberDTO memberDTO);
    public Optional<MemberDTO> login(String memberEmail, String memberPassword);

    default MemberVO toVO(MemberDTO memberDTO){
        return MemberVO.builder().id(memberDTO.getId())
                .memberEmail(memberDTO.getMemberEmail())
                .memberPassword(memberDTO.getMemberPassword())
                .memberName(memberDTO.getMemberName()).build();
    }
}
