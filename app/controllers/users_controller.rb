class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :allowed?, only: %i[edit update]

  def show
    @posts = @user.posts
  end
  
  def new
    @user = User.new
  end

  def edit
    @path = update_user_path
    render :edit, action: update_user_path
  end

  def create
    # @path = create_user_path
    @user = User.new(user_params)
    if @user.save
      login(@user.id)
      redirect_to profile_path(@user.username), notice: 'Register successfull.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Updated information.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
