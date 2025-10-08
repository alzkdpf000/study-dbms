package com.example.redis1.service;

import com.example.redis1.domain.dto.MemberDTO;
import com.example.redis1.domain.vo.MemberVO;
import com.example.redis1.repository.MemberDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberDAO memberDAO;

    @Override
    public void join(MemberDTO memberDTO) {
        memberDAO.save(toVO(memberDTO));
    }

    @Override
    public Optional<MemberDTO> login(String memberEmail, String memberPassword) {
        return memberDAO.findByMemberEmailAndMemberPassword(memberEmail, memberPassword);
    }
}
