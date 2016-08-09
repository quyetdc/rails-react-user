class UsersController < ApplicationController
  def index

    if params[:search]
      @users = User.where('name LIKE ?', "%#{params[:search]}%").all
    else
      @users = User.all
    end

    respond_to do |format|
      format.json { render json: { users: @users }, status: :ok }
    end
  end
end