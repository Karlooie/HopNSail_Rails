class SubmissionPolicy < ApplicationPolicy
  
  def initialize(user, scope)
    @user = user
    @scope = scope
  end


  def manage?
    ride_manager? and @scope.pending?
  end

  def approve?
    ride_manager? and @scope.pending?
  end

  def reject?
    ride_manager? and @scope.pending?
  end

  def show?
  end

  def destroy?
  end

  private


    def ride_manager?
      return @scope.ride.user == @user
    end

end
