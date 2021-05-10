# ActiveInteractionMapper

This gem allows the tracking of ActiveInteractions interactions. 
This is done by tracking the .execute methode that is overridden in each class inheriting from ActiveInteraction. 
To be able to trace function calls, I used Ruby's TracePoint class and to draw the graphs I used the 'ruby-graphviz' gem. 
Note that you need to install GraphViz in your environment and have its path in your path environment variable to be able to draw graphs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_interaction_mapper'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_interaction_mapper

Note: You also need to install the gem : [ruby-graphviz](https://rubygems.org/gems/ruby-graphviz/) and install [graphviz](https://graphviz.org/download/) in your environment.

## Usage

Generating a graph and outputting as text to STDOUT:

```ruby
ActiveInteractionMapper.trace(output_image: false) do
  # Code to trace
end
```

You can choose to output your result as a png as follows:

```ruby
ActiveInteractionMapper.trace(output_image: true, folder_name:'', file_name:'') do
  # Code to trace
end
```
By default, the files are generated in the tmp folder.
If the folder_name and file_name are left empty, the code will create a directory and a file using the current date and time.

You can also choose where the graph should start by using the start_at argument with the full name of the interaction you want to start at.

```ruby
ActiveInteractionMapper.trace(output_image: true, folder_name:'', file_name:'', start_at: 'ActiveInteractionA') do
  # Code to trace
end
```

Here's an example of a code I worked on. It runs an interaction in an Rspec test and puts the graph in the directory 'tmp/spec/.../test_file_name' and in a file with the name of the test running and the date it was run at.

```ruby
require 'active_interaction_mapper'

RSpec.describe Test do
  
  around do |example|
    path = example.metadata[:example_group][:file_path]
    ActiveInteractionMapper.trace(folder_name: path.split('.')[1], file_name: example.metadata[:description]) do
      example.call
    end
  end
  it "does something useful" do
    outcome = Test::ActiveInteractionA.run()
    expect(outcome.result).to eq(true)
  end
end
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_interaction_mapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/active_interaction_mapper/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveInteractionMapper project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/active_interaction_mapper/blob/master/CODE_OF_CONDUCT.md).
