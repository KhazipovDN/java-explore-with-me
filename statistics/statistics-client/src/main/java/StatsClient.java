import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import ru.practicum.ewm.stats.dto.EndpointHitDTO;
import ru.practicum.ewm.stats.dto.ViewStatsDTO;
import java.util.List;
import java.util.Map;

@Component
@RequiredArgsConstructor
public class StatsClient {
    private final RestTemplate restTemplate;

    public void saveHit(EndpointHitDTO hit) {
        restTemplate.postForObject("http://stats-server/hit", hit, Void.class);
    }

    public List<ViewStatsDTO> getStats(Map<String, String> params) {
        return List.of(restTemplate.getForObject("http://stats-server/stats", ViewStatsDTO[].class, params));
    }
}