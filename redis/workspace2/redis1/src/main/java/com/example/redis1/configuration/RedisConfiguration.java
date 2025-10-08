package com.example.redis1.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.repository.configuration.EnableRedisRepositories;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

// CMD: redis-cli
// keys *
@Configuration
// Spring Data Redis 활성화
@EnableRedisRepositories
public class RedisConfiguration {
    @Value("${spring.data.redis.host}")
    private String redisHost;

    @Value("${spring.data.redis.port}")
    private int redisPort;

    @Bean
//    RedisConnectionFactory: Redis와 연결을 설정하는 핵심 객체
    public RedisConnectionFactory redisConnectionFactory() {
//        단일 Redis 객체를 사용할 경우의 설정
        RedisStandaloneConfiguration redisConfiguration = new RedisStandaloneConfiguration();
        redisConfiguration.setHostName(redisHost);
        redisConfiguration.setPort(redisPort);
        LettuceConnectionFactory lettuceConnectionFactory = new LettuceConnectionFactory(redisConfiguration);
        return lettuceConnectionFactory;
    }

    @Bean
//    RedisTemplate: Redis에 데이터를 저장/조회/삭제할 수 있는 주요 클래스
//    String 타입의 key와 value 사용
    public RedisTemplate<String, String> redisTemplate() {
//    public RedisTemplate<String, Object> redisTemplate() { // JSON
        RedisTemplate<String, String> redisTemplate = new RedisTemplate<>();
//        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();

//        StringRedisSerializer: Redis의 key와 value를 문자열(String)로 직렬화/역직렬화
//        데이터를 그대로 문자열(String) 로 저장하는 방식으로서,
//        매우 간단하고 빠르다.
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new StringRedisSerializer());
//        redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer());
        redisTemplate.setConnectionFactory(redisConnectionFactory());

        return redisTemplate;
    }
}
