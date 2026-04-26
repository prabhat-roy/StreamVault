# subscription — StreamVault

Subscriber lifecycle, plans, payment capture, trials, churn ML.

| Service | Language | Port | Description |
|---|---|---|---|
| subscription-service | java | 50080 | Subscriber lifecycle |
| plan-service | java | 50081 | Plan catalogue, pricing |
| payment-gateway | java | 50082 | Payment capture (Stripe, Adyen, Braintree) |
| trial-service | java | 50083 | Trial / promo entitlement |
| churn-service | python | 50084 | Churn ML scoring + retention triggers |
