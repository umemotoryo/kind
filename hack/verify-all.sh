#!/usr/bin/env bash
# Copyright 2018 The Kubernetes Authors.
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

set -o errexit
set -o nounset
set -o pipefail
set -o verbose

# cd to repo root
REPO_ROOT=$(git rev-parse --show-toplevel)
cd "${REPO_ROOT}"

# run all verify scripts
"${REPO_ROOT}"/hack/verify-govet.sh
"${REPO_ROOT}"/hack/verify-gofmt.sh
"${REPO_ROOT}"/hack/verify-golint.sh
"${REPO_ROOT}"/hack/verify-generated.sh
# TODO(bentheelder): this script must be last because it doesn't operate in a tempdir ...
"${REPO_ROOT}"/hack/verify-deps.sh
