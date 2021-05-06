require 'ruby-graphviz'

module ActiveInteractionMapper
  module Output
    class Dot
      def initialize(io)
        @io = io
        @stack = []

        @graph = GraphViz.new('CodeMapper')

      end

      def push(tp, normalized_class_name)
        node = @graph.add_node("#{normalized_class_name}.#{tp.method_id.to_s}")


        if @stack != []
          @stack.last.connect(node)
        end

        @stack << node
      end

      def pop(tp, normalized_class_name)
        @stack.pop
      end

      def done
        @graph.output( :png => "hello_world.png" )
      end
    end
  end
end
