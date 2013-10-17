module SessionsHelper

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def require_moderator
    @sub = Sub.find(params[:id])
    redirect_to sub_url(@sub) unless @sub.moderator == current_user
  end

  def must_be_submitter
    @link = Link.find(params[:id])
    redirect_to @link unless @link.submitter == current_user
  end

end
