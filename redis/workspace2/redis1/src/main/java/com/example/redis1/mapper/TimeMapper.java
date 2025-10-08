package com.example.redis1.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimeMapper {
//    @Select("SELECT SYSDATE FROM DUAL")
    public String getTime();
}
