module BoardsHelper
  def pronoun
    user = User.find_by_id(params[:user_id])
    if current_user == user
      "you"
    else
      user.username
    end
  end
end
