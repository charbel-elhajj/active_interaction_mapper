require 'active_interaction_example/active_interaction_a'
require 'active_interaction_example/active_interaction_b'
require 'active_interaction_example/active_interaction_c'
require 'active_interaction_example/active_interaction_d'
require 'active_interaction_example/active_interaction_e'

RSpec.describe ActiveInteractionExample do
  before do |example|
    puts example.metadata[:example_group][:file_path]
  end
  around do |example|
    ActiveInteractionMapper.trace(folder_name: 'xxx', file_name: 'yyy') do
      example.call
    end
  end
  it "works" do



      outcome = ActiveInteractionExample::ActiveInteractionA.run()
      expect(outcome.result).to eq(true)



  end
end
