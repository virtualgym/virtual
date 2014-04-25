class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save
        Friendship.create(user_id: params[:friend_id],friend_id: current_user.id)
        format.html { redirect_to :back, notice: 'Added Friend.' }
        @profile = Profile.find(params[:profile_id])
        flash[:notice]= "#{@profile.firstname} is your friend now";
        format.js
      else
        format.html { redirect_to profiles_add_friend_path, error: 'Unable to add friend.' }
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    conditions = { user_id: @friendship.friend_id,
                   friend_id: current_user }
    @inverse = Friendship.find(:first , :conditions => conditions)
    @inverse.destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to :back , notice: 'Deleted Friend.' }
      format.json { }
      @profile = User.find(@friendship.friend_id).profile
      flash[:notice]= "#{@profile.firstname} is not your friend any more";
      format.js
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
