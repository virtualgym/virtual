class CreateWorkoutIncludings < ActiveRecord::Migration
  def change
    create_table :workout_includings do |t|
      t.integer :workout_plan_id , index: true
      t.integer :exercise_id , index: true
      t.time :duration
      t.integer :reps

      t.timestamps
    end
  end
end
