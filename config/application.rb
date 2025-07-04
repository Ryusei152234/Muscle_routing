require_relative "boot"

require "rails/all"
require "tzinfo/data" # ← 無条件で先に読み込むのがポイント！

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Muscle
  class Application < Rails::Application
    config.load_defaults 7.1

    # WindowsならDataSourceをrubyに指定（なくても動くこともあるが念のため）
    TZInfo::DataSource.set(:ruby) if Gem.win_platform?

    config.time_zone = "Tokyo"
  end
end
