#!/bin/bash
# Copyright (c) Lakshit Khatkar 
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

# This script updates RNTester Podfile.lock after verifying the CocoaPods environment.
# Usage:
#   source scripts/update_podfile_lock && update_pods

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RNTESTER_DIR="$THIS_DIR/../packages/rn-tester"

# Keep this separate for FB internal access.
validate_env () {
  cd "$RNTESTER_DIR" || exit
  bundle check || exit
  cd "$THIS_DIR" || exit
}

update_pods () {
  cd "$RNTESTER_DIR" || exit
  bundle install || exit
  bundle check || exit
  bundle exec pod install
  cd "$THIS_DIR" || exit
}
