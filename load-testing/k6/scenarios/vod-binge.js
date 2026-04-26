import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 5000,
  duration: '30m',
  thresholds: { http_req_duration: ['p(95)<1500'] },
};

export default function () {
  http.get(`${__ENV.API}/v1/catalogue/trending`);
  http.get(`${__ENV.API}/v1/recommendations`);
  http.post(`${__ENV.API}/v1/playback/session`, JSON.stringify({ title_id: 'vod-001' }), { headers: { 'Content-Type': 'application/json' } });
  sleep(45 * 60); // emulate watching for 45 minutes
}
