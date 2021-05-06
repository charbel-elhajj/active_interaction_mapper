module ActiveInteractionExample
  class ActiveInteractionB < ActiveInteraction::Base

    def execute
      puts 'B'
      ActiveInteractionD.run
      ActiveInteractionE.run
      true
    end

  end
end