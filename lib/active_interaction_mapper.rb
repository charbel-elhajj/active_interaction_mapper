# frozen_string_literal: true

require_relative "active_interaction_mapper/version"


require "active_interaction_mapper/version"
require "active_interaction_mapper/tracer"
require "active_interaction_mapper/filter/start_at"
require "active_interaction_mapper/filter/active_interaction_filter"
require "active_interaction_mapper/output/text"
require "active_interaction_mapper/output/dot"

module ActiveInteractionMapper
  class Error < StandardError; end

  def self.trace(start_at: nil, output_image: true, folder_name:'', file_name:'', show_duplicated_path: false, &block)
    filters = []
    filters << Filter::StartAt.new(start_at) if start_at
    filters << Filter::ActiveInteractionFilter.new

    if output_image
      output = ActiveInteractionMapper::Output::Dot.new(folder_name: folder_name, file_name: file_name, show_duplicated_path: show_duplicated_path)
    else
      output = ActiveInteractionMapper::Output::Text.new($stdout)
    end
    tracer = Tracer.new(filters: filters, output: output)
    tracer.enable

    begin
      yield
    ensure
      tracer.disable
    end
  end
end
