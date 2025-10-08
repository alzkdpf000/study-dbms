package com.example.redis1.domain.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Getter @Setter @ToString
@NoArgsConstructor
public class MemberDTO implements Serializable {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
}
