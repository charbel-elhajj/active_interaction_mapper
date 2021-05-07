
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
