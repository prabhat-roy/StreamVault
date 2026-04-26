import http from 'k6/http';
export const options = { vus: 2000, duration: '5m', thresholds: { http_req_duration: ['p(95)<300'] } };
const queries = ['stranger', 'oppenheimer', 'cup final', 'comedy', 'animation 2026'];
export default function () {
  const q = queries[Math.floor(Math.random() * queries.length)];
  http.get(`${__ENV.API}/v1/search?q=${encodeURIComponent(q)}`);
}
