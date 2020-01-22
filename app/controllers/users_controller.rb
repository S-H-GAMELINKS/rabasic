class UsersController < ApplicationController
  def edit
  end

  def mypage
    @likes = current_user.likees(Product)
  end

  def update
    current_user.update(user_params)

    redirect_to users_mypage_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :postal_code, :address, :phone)
    end
end
