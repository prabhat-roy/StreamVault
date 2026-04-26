CREATE TABLE plan (
  id              UUID PRIMARY KEY,
  code            TEXT NOT NULL UNIQUE,
  name            TEXT NOT NULL,
  price_cents     INT  NOT NULL,
  currency        CHAR(3) NOT NULL,
  max_streams     INT  NOT NULL DEFAULT 2,
  max_quality     TEXT NOT NULL DEFAULT '1080p',
  download_enabled BOOLEAN NOT NULL DEFAULT TRUE,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE subscription (
  id              UUID PRIMARY KEY,
  user_id         UUID NOT NULL,
  plan_id         UUID NOT NULL REFERENCES plan(id),
  status          TEXT NOT NULL CHECK (status IN ('TRIAL','ACTIVE','PAST_DUE','CANCELLED')),
  trial_ends_at   TIMESTAMPTZ,
  current_period_start TIMESTAMPTZ NOT NULL,
  current_period_end   TIMESTAMPTZ NOT NULL,
  cancel_at_period_end BOOLEAN NOT NULL DEFAULT FALSE,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX subscription_user_idx ON subscription(user_id);
CREATE INDEX subscription_status_idx ON subscription(status);
