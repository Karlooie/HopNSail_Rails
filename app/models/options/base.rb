module Options
  class Base
    class << self
      attr_accessor :options

      def all
        @options
      end

      def all_as_sym
        @options.map(&:to_sym)
      end

      # Converts it to an array of arrays
      # [0]
      #   [0] 'tradesperson_assistant'
      #   [1] 'Tradesperson's Assistant'
      #
      def all_as_select
        @options.map { |x| [self.new(x).try(:to_s), x] }
      end
    end
  end
end
