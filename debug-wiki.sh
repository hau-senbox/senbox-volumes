#!/bin/bash

echo "=== 1. Container Status ==="
docker ps | grep wiki-service

echo -e "\n=== 2. Container Logs (last 50 lines) ==="
docker logs --tail 50 wiki-service

echo -e "\n=== 3. Test port in container ==="
docker exec wiki-service sh -c "netstat -tulpn | grep 8023 || echo 'netstat not found'"

echo -e "\n=== 4. Test localhost in container ==="
docker exec wiki-service sh -c "wget -O- http://localhost:8023/health 2>&1 || curl http://localhost:8023/health 2>&1 || echo 'Cannot connect'"

echo -e "\n=== 5. Test from host ==="
curl -s -o /dev/null -w "HTTP Status: %{http_code}\n" http://192.0.2.72:8023/health 2>&1 || echo "Connection failed"

echo -e "\n=== 6. Consul registration ==="
curl -s http://localhost:8500/v1/catalog/service/wiki-service | jq -r '.[] | "Service: \(.ServiceName), Address: \(.ServiceAddress), Port: \(.ServicePort)"'

echo -e "\n=== 7. Consul health check ==="
curl -s http://localhost:8500/v1/health/service/wiki-service | jq -r '.[] | .Checks[] | "Status: \(.Status), Output: \(.Output)"'

echo -e "\n=== 8. Test from KrakenD ==="
docker exec krakend sh -c "wget -O- http://192.0.2.72:8023/health 2>&1 || curl http://192.0.2.72:8023/health 2>&1 || echo 'Cannot connect from KrakenD'"

echo -e "\n=== 9. DNS from KrakenD ==="
docker exec krakend nslookup wiki-service.service.consul 2>&1 || echo "DNS lookup failed"