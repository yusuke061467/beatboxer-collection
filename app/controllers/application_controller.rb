class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_login
  before_action :check_mfa

  private

  def not_authenticated
    redirect_to login_path
  end

  def require_login
    unless logged_in?
      flash[:alert] = "ログインしてください！"
      redirect_to login_path
    end
  end

  def check_mfa
    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
     redirect_to user_mfa_sessions_new_path
    end
  end
end
