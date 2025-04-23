package ru.practicum.ewm.stats.server.mapper;

import org.springframework.stereotype.Component;
import ru.practicum.ewm.stats.server.model.EndpointHit;
import ru.practicum.ewm.stats.dto.EndpointHitDTO;

@Component
public class StatsMapper {
    public EndpointHit toEntity(EndpointHitDTO dto) {
        return EndpointHit.builder()
                .id(dto.getId())
                .app(dto.getApp())
                .uri(dto.getUri())
                .ip(dto.getIp())
                .timestamp(dto.getTimestamp())
                .build();
    }
}