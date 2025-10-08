package com.example.redis1.domain.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Getter
@ToString
@NoArgsConstructor
public class MemberVO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;

    @Builder
    public MemberVO(Long id, String memberEmail, String memberPassword, String memberName) {
        this.id = id;
        this.memberEmail = memberEmail;
        this.memberPassword = memberPassword;
        this.memberName = memberName;
    }
}
