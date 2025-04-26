package ru.practicum.ewm.stats.server.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.practicum.ewm.stats.server.mapper.StatsMapper;
import ru.practicum.ewm.stats.server.repository.StatsRepository;
import ru.practicum.ewm.stats.dto.EndpointHitDTO;
import ru.practicum.ewm.stats.dto.ViewStatsDTO;


import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class StatsticsService {

    private final StatsRepository repository;
    private final StatsMapper mapper;

    public void saveHit(EndpointHitDTO hitDto) {
        repository.save(mapper.toEntity(hitDto));
    }

    public List<ViewStatsDTO> getStats(LocalDateTime start, LocalDateTime end, List<String> uris, boolean unique) {
        return unique
                ? repository.findUniqueHits(start, end, uris)
                : repository.findAllHits(start, end, uris);
    }
}
