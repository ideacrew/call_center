# frozen_string_literal: true

module CallCenter

  # Make this gem accessible to Rails as an Engine
  class Engine < Rails::Engine
    isolate_namespace CallCenter
  end
end