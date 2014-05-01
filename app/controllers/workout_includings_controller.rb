class WorkoutIncludingsController < ApplicationController

  def set_fields

    WorkoutIncluding.where(:workout_plan_id => params[:id]).each do |workout_plan|
      String repsId = "reps_#{workout_plan.exercise_id}"
      String durationId = "duration_#{workout_plan.exercise_id}"
      workout_plan.reps = params[repsId]
      workout_plan.duration = params[durationId]
      workout_plan.save
    end
    respond_to do |format|
        format.html{ redirect_to workout_plan_path(params[:id])}
      end
  end


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
