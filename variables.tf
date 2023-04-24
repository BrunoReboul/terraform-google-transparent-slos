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


variable "project_id" {
  description = "GCP project id where to deploy the resources"
}

variable "pubsub_allowed_regions" {
  type    = list(string)
  default = ["europe-central2", "europe-north1", "europe-west1", "europe-west3", "europe-west4", "europe-west8", "europe-west9", "europe-southwest1"]
}

variable "notification_channels" {
  type    = list(string)
  default = []
}

variable "api_availability" {
  type = map(any)
}

variable "api_latency" {
  type = map(any)
}
