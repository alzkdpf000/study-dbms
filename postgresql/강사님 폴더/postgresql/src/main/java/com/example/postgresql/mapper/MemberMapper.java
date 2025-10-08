package com.example.postgresql.mapper;

import com.example.postgresql.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
//    추가
    public void insert(MemberVO memberVO);
}
