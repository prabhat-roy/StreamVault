# communications — StreamVault

Notification orchestration: email, push (APNs/FCM), SMS, in-app messaging.

| Service | Language | Port | Description |
|---|---|---|---|
| notification-orchestrator | go | 50150 | Notification fan-out orchestrator |
| email-service | node | 50151 | Transactional email |
| push-service | node | 50152 | APNs / FCM push notifications |
| sms-service | node | 50153 | SMS via Twilio/MessageBird |
| in-app-message | node | 50154 | In-app messaging delivery |
