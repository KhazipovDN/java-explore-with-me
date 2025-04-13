package ru.practicum.ewm.stats.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ViewStatsDTO {
    private String app;
    private String uri;
    private Long hits;
}
