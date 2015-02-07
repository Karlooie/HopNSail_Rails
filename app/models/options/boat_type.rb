module Options
  class BoatType < Base
    @options = %w( motor sail catamaran )
  
    def initialize(option)
      @option = option
    end

    def to_s
      I18n.t @option, scope: [:simple_form, :options, :boat, :boat_type]
    end
  end
end
