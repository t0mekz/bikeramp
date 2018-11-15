#!/bin/sh
bundle check || bundle install

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

bin/rails s -b 0.0.0.0
