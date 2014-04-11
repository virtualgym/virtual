class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :user, index: true
      t.references :workout_plan, index: true
      t.date :date
      t.time :total_min
      t.integer :total_cal

      t.timestamps
    end
  end
end
