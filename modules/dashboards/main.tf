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

resource "google_monitoring_dashboard" "consumed_api_request_count" {
  project        = var.project_id
  dashboard_json = <<EOF
{
  "displayName": "Consumed API - Request count [SUM] over the last 28 days",
  "mosaicLayout": {
    "columns": 12,
    "tiles": [
      {
        "height": 21,
        "widget": {
          "timeSeriesTable": {
            "dataSets": [
              {
                "minAlignmentPeriod": "2419200s",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "2419200s",
                      "crossSeriesReducer": "REDUCE_SUM",
                      "groupByFields": [
                        "resource.label.\"service\"",
                        "resource.label.\"method\""
                      ],
                      "perSeriesAligner": "ALIGN_SUM"
                    },
                    "filter": "metric.type=\"serviceruntime.googleapis.com/api/request_count\" resource.type=\"consumed_api\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s"
                    }
                  }
                }
              }
            ],
            "metricVisualization": "NUMBER"
          },
          "title": "Consumed API - Request count [SUM] over the last 28 days"
        },
        "width": 12
      }
    ]
  }
}
EOF
}
