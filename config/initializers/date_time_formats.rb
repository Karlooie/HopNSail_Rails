# Override default application date format e.g. Date.today.to_s => "20/08/2013"
Date::DATE_FORMATS[:default] = '%-d/%m/%Y'
Date::DATE_FORMATS[:short] = '%d %b %Y'
Date::DATE_FORMATS[:simple] = '%-d %B %Y'
Date::DATE_FORMATS[:month_and_year] = '%B %Y'
Date::DATE_FORMATS[:date_and_time] = '%-d/%m/%Y - %r'
Date::DATE_FORMATS[:datetimepicker] = '%d/%m/%Y %R %p' # this format is needed for datetime picker
Date::DATE_FORMATS[:input] = '%Y-%m-%d'

Time::DATE_FORMATS[:default] = '%-d/%m/%Y'
Time::DATE_FORMATS[:simple] = '%-d %B %Y'
Time::DATE_FORMATS[:month_and_year] = '%B %Y'
Time::DATE_FORMATS[:date_and_time] = '%-d/%m/%Y - %r'
Time::DATE_FORMATS[:datetimepicker] = '%d/%m/%Y %R %p' # this format is needed for datetime picker
