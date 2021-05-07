module ActiveInteractionMapper
  module Filter
    class StartAt
      def initialize(start_matcher)
        @start_matcher = start_matcher
        @started = false
        @stack = []
      end

      def keep?(tp, normalized_class_name)


        if !@started && call_event?(tp) && matches?(normalized_class_name)
          @started = true
        end

        if @started && call_event?(tp)
          @stack << normalized_class_name
          return true
        end

        if @started && return_event?(tp)
          @stack.pop

          if @stack.empty?
            @started = false
          end
        end

        @started
      end

      private

      def call_event?(tp)
        tp.event == :call || tp.event == :c_call
      end

      def return_event?(tp)
        tp.event == :return || tp.event == :c_return
      end

      def matches?(normalized_class_name)
        case @start_matcher
        when Regexp
          (@start_matcher =~ normalized_class_name) != nil
        when String
          @start_matcher == normalized_class_name
        end
      end
    end
  end
end
