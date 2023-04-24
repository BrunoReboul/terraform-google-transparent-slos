
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

# terraform {
#   backend "gcs" {
#     bucket = "<your-bucket-name>"
#     prefix = "transparent-slos"
#   }
# }

# module "transparent-slos" {
#   source                  = "BrunoReboul/realtime-asset-monitor/google"
#   version                 = "0.0.1"
#   project_id             = var.project_id
#   pubsub_allowed_regions = var.pubsub_allowed_regions
#   notification_channels  = var.notification_channels
#   api_availability       = var.api_availability
#   api_latency            = var.api_latency
# }
