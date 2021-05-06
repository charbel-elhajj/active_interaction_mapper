module ActiveInteractionExample
  class ActiveInteractionC < ActiveInteraction::Base

    def execute
      puts 'C'
      true
    end

  end
end