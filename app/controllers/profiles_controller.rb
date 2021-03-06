class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  layout "admin"
  # GET /profiles
  # GET /profiles.json
  def index
    @search_box = Profile.search_friend(params[:search]).paginate(:page => params[:page], :per_page => 5)
    @profiles = Profile.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @message = Message.new
    conditions = { user_id: current_user.id,
                   friend_id: @profile.user.id }
    @friendship = Friendship.find(:first , :conditions => conditions)
    @inbox = current_user.inbox_message.where('status = 0').count
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
      current_user.profile = @profile
      current_user.save

    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    @profile.user.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  def add_friend
    @profiles = Profile.search_friend(params[:search]).paginate(:page => params[:page], :per_page => 10)
    @friendships = current_user.friendships.paginate(:page => params[:friended_page], :per_page => 10)
  end

  def index_friend
    @friendships = current_user.friendships.paginate(:page => params[:page], :per_page => 5)
    @count = current_user.friendships.count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :birthdate, :height, :weight, :country, :city, :role,:avatar,:cover ,:language)
    end
end
