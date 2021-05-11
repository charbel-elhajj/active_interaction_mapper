require 'ruby-graphviz'
require 'fileutils'
require 'date'


module ActiveInteractionMapper
  module Output
    class Dot
      def initialize(folder_name:'', file_name:'', show_duplicated_path: false)
        d = DateTime.now
        d_string = d.strftime("%d%m%Y_%H%M%S")
        if folder_name.empty?
          @folder_name = "dir_#{d_string}"
        else
          @folder_name = "#{folder_name}"
        end
        if file_name.empty?
          @file_name = "img_#{d_string}.png"
        else
          @file_name = "#{file_name}_#{d_string}.png"
        end
        @show_duplicated_path = show_duplicated_path
        @edges = []
        @stack = []
        @graph = GraphViz.new('CodeMapper')

      end

      def push(tp, normalized_class_name)
        node = @graph.add_node("#{normalized_class_name}")


        if @stack != []
          if !@show_duplicated_path
            if !@edges.include? "#{@stack.last};#{node}"
              @graph.add_edge(@stack.last,node)
              @edges << "#{@stack.last};#{node}"
            end
          else
            @graph.add_edge(@stack.last,node)
          end
        end

        @stack << node
      end

      def pop(tp, normalized_class_name)
        @stack.pop
      end

      def done
        full_path = "./tmp/#{@folder_name}/#{@file_name}"
        dirname = File.dirname(full_path)
        unless File.directory?(dirname)
          FileUtils.mkdir_p(dirname)
        end
        @graph.output( :png => full_path)
      end
    end
  end
end
