package com.example.postgresql.domain;

import com.example.postgresql.enumeration.Status;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

@Component
@Getter @Setter @ToString
public class MemberVO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private Status memberStatus;
    private String createdDate;
    private String updatedDate;
}
