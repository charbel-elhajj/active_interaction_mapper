
RSpec.describe ActiveInteractionExample do

  it "works" do
    outcome = ActiveInteractionExample::ActiveInteractionA.run()
    expect(outcome.result).to eq(true)
  end
end
