module ActiveInteractionExample
  class ActiveInteractionE < ActiveInteraction::Base

    def execute
      puts 'E'
      true
    end

  end
end