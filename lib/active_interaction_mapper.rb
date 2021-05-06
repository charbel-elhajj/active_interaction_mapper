# frozen_string_literal: true

require_relative "active_interaction_mapper/version"
require_relative "active_interaction_example/active_interaction_a"
require_relative "active_interaction_example/active_interaction_b"
require_relative "active_interaction_example/active_interaction_c"
require_relative "active_interaction_example/active_interaction_d"
require_relative "active_interaction_example/active_interaction_e"
require 'active_interaction'


require "active_interaction_mapper/version"
require "active_interaction_mapper/tracer"
require "active_interaction_mapper/filter/start_at"
require "active_interaction_mapper/filter/callee"
require "active_interaction_mapper/filter/max_depth"
require "active_interaction_mapper/output/text"
require "active_interaction_mapper/output/dot"

module ActiveInteractionMapper
  class Error < StandardError; end
  # Your code goes here...

  def self.trace(filter: nil, start_at: nil, max_depth: nil, output: ActiveInteractionMapper::Output::Text.new($stdout), &block)
    filters = []
    filters << Filter::Callee.new(filter) if filter
    filters << Filter::StartAt.new(start_at) if start_at
    filters << Filter::MaxDepth.new(max_depth) if max_depth

    tracer = Tracer.new(filters: filters, output: output)
    tracer.enable

    begin
      yield
    ensure
      tracer.disable
    end
  end
end
