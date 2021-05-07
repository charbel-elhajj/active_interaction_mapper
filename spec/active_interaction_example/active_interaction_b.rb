module ActiveInteractionExample
  class ActiveInteractionB < ActiveInteraction::Base

    def execute

      ActiveInteractionD.run
      ActiveInteractionE.run
      true
    end

  end
end