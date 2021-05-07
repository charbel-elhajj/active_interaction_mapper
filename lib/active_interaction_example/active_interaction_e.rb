module ActiveInteractionExample
  class ActiveInteractionE < ActiveInteraction::Base

    def execute
      ActiveInteractionC.run
      true
    end

  end
end