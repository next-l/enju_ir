require 'attr_json'

module EnjuIr
  class Engine < ::Rails::Engine
    isolate_namespace EnjuIr

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
