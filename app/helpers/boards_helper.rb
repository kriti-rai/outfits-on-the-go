module BoardsHelper
  def board_user
    user = User.find_by(id: params[:user_id])
    current_user == user ? true : false
  end
end
