class UsersController < ApplicationController
  def index

    @users = if params[:search]
      User.where('name LIKE ?', "%#{params[:search]}%").all
    else
      User.all
    end.page(params[:page])

    data = {
        users: @users,
        #  This metadata is useful for paginator
        # It's supported by Kaminari
        meta: {
            current_page: @users.current_page,
            next_page: @users.next_page,
            prev_page: @users.prev_page,
            total_pages: @users.total_pages,
            total_count: @users.total_count
        }
    }

    render json: data, status: :ok
  end
end