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

module "dashboards" {
  source     = "./modules/dashboards"
  project_id = var.project_id
}

module "notifications" {
  source                 = "./modules/notifications"
  project_id             = var.project_id
  pubsub_allowed_regions = var.pubsub_allowed_regions
  notification_channels  = var.notification_channels
}

module "slos" {
  source                = "./modules/slos"
  project_id            = var.project_id
  service_id            = var.service_id
  service_display_name  = var.service_display_name
  notification_channels = module.notifications.notification_channels
  availability          = var.api_availability
  latency               = var.api_latency
}
