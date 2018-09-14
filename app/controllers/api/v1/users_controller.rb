class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end
  # POST /users
  def create
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.valid?
      render json: { token: issue_token({ id: user.id }), user: {username: user.username, id: user.id, email: user.email} }
    else
      render json: { error: 'Cannot create user!' }
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: { token: issue_token({ id: user.id }), user: {username: user.username, id: user.id, email: user.email}}
    else
      render json: { error: 'Cannot find or authenticate user.' }
    end
  end

  def get_current_user
    if current_user
      render json: { username: current_user.username, id: current_user.id }
    else
      render json: { error: 'no user' }
    end
  end

  def get_managed_festivals
      user = User.find(params["id"])
      render json: user.managed_festivals
  end

  def get_user_festivals
      user = User.find(params["id"])
      render json: user.festivals
  end


  def set_festival
    festival = params[:festival]
    f = Festival.find(festival["id"])
    Assignment.create(user_id: params["user_id"], role_id: 2, festival_id: params["festival_id"])
    render json: current_user.festivals
  end
  #Events

  #Gets users saved events(through booking)
  def get_user_events
      user = User.find(params["id"])
      render json: user.saved_events
  end

  def set_event
    festival = params[:festival]
    f = Festival.find(festival["id"])
    Assignment.create(user_id: params["user_id"], role_id: 2, festival_id: params["festival_id"])
    render json: current_user.festivals
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end
end
