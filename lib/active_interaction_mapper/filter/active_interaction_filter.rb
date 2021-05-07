module ActiveInteractionMapper
  module Filter
    class ActiveInteractionFilter
      def initialize
      end

      def keep?(tp, normalized_class_name)
        class_and_method = "#{normalized_class_name}.#{tp.method_id}"
        (class_and_method.end_with? '.execute')

      end
    end
  end
end
