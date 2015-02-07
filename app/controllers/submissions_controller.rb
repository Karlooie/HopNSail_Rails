class SubmissionsController < ApplicationController

  before_filter :load_submission, only: [:approve, :reject]

  after_action :verify_authorized, only: [:approve, :reject]


  def create
    @ride = Ride.find params[:ride_id]

    @submission = current_user.submissions.new(ride: @ride)

    if @submission.save
      redirect_to ride_path(@ride), notice: 'Sumbission sent correctly.'
    else
      redirect_to ride_path(@ride), alert: 'couldnt register your request'
    end
  end


  def approve
    authorize @submission
    if @submission.approve
      redirect_to ride_path(@ride), notice: 'submission approved'
    else
      redirect_to ride_path(@ride), alert: 'cannot approve submission '
    end
  end

  def reject
    authorize @submission
    if @submission.reject
      redirect_to ride_path(@ride), notice: 'submission rejected'
    else
      redirect_to ride_path(@ride), alert: 'cannot reject submission '
    end
  end


  private

  def load_submission
    @submission = Submission.find params[:id]
  end
 
end