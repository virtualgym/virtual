class WorkoutIncludingsController < ApplicationController

  def create
    @workout_include = WorkoutIncluding.new
    @workout_include.exercise_id = params[:exercise_id]
    @workout_include.workout_plan_id = params[:workout_plan_id]

    respond_to do |format|
      if @workout_include.save
        format.html { redirect_to add_exercise_workout_plan_path(id: params[:workout_plan_id]), notice: 'Exercise Added' }
      else
        format.html { redirect_to add_exercise_workout_plan_path(id: params[:workout_plan_id]), error: 'Unable to add exercise.' }
      end
    end
  end

  def destroy
    @workout_include = WorkoutIncluding.find(params[:id])
    @workout_include.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end

  end

  private
  def workout_including_params
    params.require(:workout_including).permit(:workout_plan_id,:exercise_id)
  end
end
