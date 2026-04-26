resource "google_pubsub_topic" "playback_session_started" { name = "playback.session.started" }
resource "google_pubsub_topic" "playback_session_ended"   { name = "playback.session.ended"   }
resource "google_pubsub_topic" "qoe_event"                { name = "qoe.event.recorded"      }
resource "google_pubsub_topic" "ad_break_inserted"        { name = "ad.break.inserted"      }
resource "google_pubsub_topic" "drm_licence_issued"       { name = "drm.licence.issued"     }
