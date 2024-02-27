# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "kubernetes_config_map" "fluentbit_config" {
  metadata {
    name = "fluentbit-config"
    namespace = var.namespace
  }

  data = {
    "fluent-bit.conf" = " |
      [SERVICE]
          Parsers_File parsers.conf
      [INPUT]
          Name tail
          Path /tmp/ray/session_latest/logs/*
          Tag ray
          Path_Key filename
          Refresh_Interval 5
      [FILTERS]
          Name parser
          Match ray
          Key_Name filename
          Parser rayjob
          Reserve_Data On
      [OUTPUT]
          Name stdout
          Format json_lines
          Match *"
    "parsers.conf" = " |
      [PARSER]
          Name rayjob
          Format regex
          Regex (?<job_id>raysubmit_[^.]*)"
  }
}

