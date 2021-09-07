#!/usr/bin/env bash

set -e

sleep 2

echo "Starting script for data"

ruby ./bin/start.rb

echo "Ready to start!"

bundle exec rackup --host 0.0.0.0 -p 4567
