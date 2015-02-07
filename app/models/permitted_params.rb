class PermittedParams < Struct.new(:params, :user)

  def boat
    params.require(:boat).permit(*boat_attributes)
  end

  def ride
    params.require(:ride).permit(*ride_attributes)
  end


  def boat_attributes
    [
      :name,
      :avatar,
      :boat_type,
      :make,
      :model,
      :year,
      :lenght
    ]
  end

  def ride_attributes
    [
      :boat_id,
      :availability,
      :ride_type,
      :description,
      :starting_at,
      :finishing_at
    ]
  end


end