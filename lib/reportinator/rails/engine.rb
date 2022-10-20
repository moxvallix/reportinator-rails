require "reportinator"

module Reportinator
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Reportinator::Rails
    end
  end
end
