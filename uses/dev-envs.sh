#!/usr/bin/env bash

set -eux

ruby_target_version="2.6.5"
python2_target_version="2.7.16"
python3_target_version="3.7.4"
node_target_version="10.16.3"

rbenv install -s "$ruby_target_version"
pyenv install -s "$python2_target_version"
pyenv install -s "$python3_target_version"
nodenv install -s "$node_target_version"
