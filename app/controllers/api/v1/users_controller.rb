class Api::V1::UsersController < BaseApiController

  before_filter :find_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
   	@user = User.find(params[:id])
    render json: @user
  end

  def update
  	 if stale?(last_modified: @user.updated_at, public: true)
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end
 
  private

  def find_user
  	 @user = User.find_by_id(params[:id])
  end

end  
