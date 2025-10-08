package com.example.postgresql.mybatis.converter;

import com.example.postgresql.enumeration.Status;
import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class StringToStatusConverter implements Converter<String, Status> {
    @Override
    public Status convert(@NonNull String source) {
        Map<String, Status> statusMap =
                Stream.of(Status.values())
                        .collect(Collectors.toMap(Status::getValue, Function.identity()));

        return statusMap.get(source);
    }
}
