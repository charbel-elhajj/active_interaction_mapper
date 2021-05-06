
RSpec.describe ActiveInteractionExample do

  it "works" do

    ActiveInteractionMapper.trace() do
      outcome = ActiveInteractionExample::ActiveInteractionA.run()
      expect(outcome.result).to eq(true)
    end


  end
end
