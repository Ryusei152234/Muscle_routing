#!/bin/bash
bundle config set force_ruby_platform true
bundle exec rake db:migrate
bundle install
bundle exec rake assets:precompile
