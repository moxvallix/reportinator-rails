require "reportinator"

module Reportinator
  module Rails
    class Engine < ::Rails::Engine
      require_rel "."
      isolate_namespace Reportinator::Rails
    end
  end
end
