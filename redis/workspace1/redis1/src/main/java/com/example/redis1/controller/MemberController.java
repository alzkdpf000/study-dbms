package com.example.redis1.controller;

import com.example.redis1.domain.dto.MemberDTO;
import com.example.redis1.domain.vo.MemberVO;
import com.example.redis1.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/*")
public class MemberController {
    private final MemberService memberService;
    private final HttpSession session;

//    회원가입
    @GetMapping("join")
    public void goToJoinForm(MemberDTO memberDTO){}

    @PostMapping("join")
    public RedirectView join(MemberDTO memberDTO){
        memberService.join(memberDTO);
        return new RedirectView("/member/login");
    }

//    로그인
    @GetMapping("login")
    public void goToLoginForm(MemberDTO memberDTO){}

    @PostMapping("login")
    public RedirectView login(String memberEmail, String memberPassword){
        Optional<MemberDTO> foundMember = memberService.login(memberEmail, memberPassword);
        MemberDTO memberDTO = foundMember.orElseThrow(() -> {
            throw new RuntimeException();
        });

        session.setAttribute("member", memberDTO);
        return new RedirectView("http://localhost:10001/");
    }

//    로그아웃
    @GetMapping("logout")
    public RedirectView logout(){
        session.removeAttribute("member");
        return new RedirectView("http://localhost:10000/member/login");
    }
}
