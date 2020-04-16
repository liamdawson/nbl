#!/usr/bin/env bash

set -eu

ruby_target_version="2.7.1"
python2_target_version="2.7.17"
python3_target_version="3.8.2"
node_target_version="12.16.2"

set -x

rbenv install -s "$ruby_target_version"
pyenv install -s "$python2_target_version"
pyenv install -s "$python3_target_version"
nodenv install -s "$node_target_version"

rbenv global "$ruby_target_version"
pyenv global "$python3_target_version" "$python2_target_version"
nodenv global "$node_target_version"
