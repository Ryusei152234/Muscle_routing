#!/bin/bash

bundle config set force_ruby_platform true
bundle install

yarn install  # ← 追加
bundle exec rake db:migrate
bundle exec rake assets:precompile
