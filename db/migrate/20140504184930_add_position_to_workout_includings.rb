class AddPositionToWorkoutIncludings < ActiveRecord::Migration
  def change
    add_column :workout_includings, :position, :integer
  end
end
