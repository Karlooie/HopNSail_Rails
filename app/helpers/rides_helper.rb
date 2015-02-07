module RidesHelper


  def ride_state_to_class(state)
    return 'label-success'  if state == 'open'
    return 'label-default'  if state == 'completed'
    return 'label-danger'   if state == 'cancelled'
  end

end


