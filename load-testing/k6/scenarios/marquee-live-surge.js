// k6 scenario — 30M-viewer marquee live event surge.
// Validates: API gateway, manifest endpoints, DRM licence issue, packager fan-out.

import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  scenarios: {
    surge: {
      executor: 'ramping-arrival-rate',
      startRate: 1000,
      timeUnit: '1s',
      preAllocatedVUs: 50000,
      maxVUs: 200000,
      stages: [
        { target:    50000, duration: '30s' },   // warm-up
        { target:   500000, duration: '60s' },   // kickoff ramp
        { target:  3000000, duration: '90s' },   // first goal
        { target:  3000000, duration: '2h'  },   // sustained
        { target:        0, duration: '5m'  },   // tail-off
      ],
      exec: 'live_session',
    },
  },
  thresholds: {
    http_req_failed:  ['rate<0.001'],
    http_req_duration:['p(95)<2000'],
    'http_req_duration{name:manifest}': ['p(95)<200'],
    'http_req_duration{name:licence}':  ['p(95)<300'],
  },
};

export function live_session() {
  const token = http.post(`${__ENV.API}/v1/playback/session`, JSON.stringify({ title_id: __ENV.LIVE_EVENT_ID }), {
    headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${__ENV.JWT}` },
    tags: { name: 'session_create' },
  }).json('playback_token');

  const manifest = http.get(`${__ENV.CDN}/live/${__ENV.LIVE_EVENT_ID}/master.m3u8?jwt=${token}`, { tags: { name: 'manifest' } });
  check(manifest, { 'manifest 200': (r) => r.status === 200 });

  const licence = http.post(`${__ENV.LICENCE}/widevine`, manifest.body.slice(0, 64), { tags: { name: 'licence' } });
  check(licence, { 'licence 200': (r) => r.status === 200 });

  for (let i = 0; i < 60; i++) {
    http.get(`${__ENV.CDN}/live/${__ENV.LIVE_EVENT_ID}/seg_${i}.cmfv?jwt=${token}`, { tags: { name: 'segment' } });
    sleep(2);
  }
}
