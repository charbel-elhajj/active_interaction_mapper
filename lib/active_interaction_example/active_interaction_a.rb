require 'active_interaction'
module ActiveInteractionExample
  class ActiveInteractionA < ActiveInteraction::Base

    def execute

      ActiveInteractionB.run
      ActiveInteractionC.run
      true
    end

  end
end