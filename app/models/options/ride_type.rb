module Options
  class RideType < Base
    @options = %w( daily cruise party sail dinner regatta holiday )
  
    def initialize(option)
      @option = option
    end

    def to_s
      I18n.t @option, scope: [:simple_form, :options, :ride, :ride_type]
    end
  end
end
