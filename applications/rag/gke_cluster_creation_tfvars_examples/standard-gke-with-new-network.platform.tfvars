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

##common variables
project_id = "<project-id>"

#######################################################
####    PLATFORM
#######################################################
## network values
create_network    = true
network_name      = "demo-network-2"
subnetwork_name   = "demo-subnet-02"
subnetwork_cidr   = "10.100.0.0/16"
subnetwork_region = "us-central1"

## gke variables
private_cluster   = false ## Use true for a private cluster
autopilot_cluster = false # false = standard cluster, true = autopilot cluster
cluster_name      = "demo-cluster-1"
cluster_region    = "us-central1"
cluster_zones     = ["us-central1-a", "us-central1-b"]

cpu_pools = [{
  name                   = "cpu-pool"
  machine_type           = "n2-standard-8"
  node_locations         = "us-central1-b,us-central1-c"
  autoscaling            = true
  min_count              = 1
  max_count              = 3
  local_ssd_count        = 0
  spot                   = false
  disk_size_gb           = 100
  disk_type              = "pd-standard"
  image_type             = "COS_CONTAINERD"
  enable_gcfs            = false
  enable_gvnic           = false
  logging_variant        = "DEFAULT"
  auto_repair            = true
  auto_upgrade           = true
  create_service_account = true
  preemptible            = false
  initial_node_count     = 1
  accelerator_count      = 0
}]