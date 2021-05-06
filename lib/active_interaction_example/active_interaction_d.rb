module ActiveInteractionExample
  class ActiveInteractionD < ActiveInteraction::Base

    def execute
      puts 'D'
      true
    end

  end
end