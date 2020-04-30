module CallCenter

require_relative 'operations/queues/list'

require_relative 'validation/queues/list_contract'

  # Define a Queue together with its settings, code hook for dependency injection, and configuration UI attributes 
  #
  # @example Define the queue
  #   Queue.new()
  class Queue < Dry::Struct


  end
end