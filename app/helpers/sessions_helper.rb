module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def create_score
    session[:score] = 0
  end
  
  def update_score
     session[:score] += 1
  end

  def delete_score
    session.delete(:score)
  end
end
