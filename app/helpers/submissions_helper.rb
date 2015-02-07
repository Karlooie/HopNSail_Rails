module SubmissionsHelper


  def submission_state_to_class(state)
    return 'label-warning'  if state == 'pending'
    return 'label-success'  if state == 'approved'
    return 'label-danger'   if state == 'rejected'
  end

end


