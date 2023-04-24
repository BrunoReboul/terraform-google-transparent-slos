/**
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  notification_channels = concat(var.notification_channels, [google_monitoring_notification_channel.alerting2pubsub.name])
}

resource "google_pubsub_topic" "alerting" {
  project = var.project_id
  name    = var.alerting_topic_name
  message_storage_policy {
    allowed_persistence_regions = var.pubsub_allowed_regions
  }
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_pubsub_topic_iam_member" "alerting_publisher" {
  project = google_pubsub_topic.alerting.project
  topic   = google_pubsub_topic.alerting.name
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com"
}

resource "google_monitoring_notification_channel" "alerting2pubsub" {
  project      = var.project_id
  display_name = "Alerting to Pub/sub"
  type         = "pubsub"
  labels = {
    "topic" = google_pubsub_topic.alerting.id
  }
}
