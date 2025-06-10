#!/bin/bash
bundle config set force_ruby_platform true
bundle install
bundle exec rake db:migrate
