class UserSessionsController < ApplicationController
    skip_before_action :require_login, only: %i[new create]
    skip_before_action :check_mfa, only: %i[new create destroy]

    def new; end

    def create
      user = login(params[:email], params[:password])
      if user
        if user.activation_state == "active"
          flash[:notice] = "ログインが完了しました！"
          redirect_to root_path
        else
          logout
          flash.now[:alert] = "アカウントが有効化されていません。メールをご確認ください！"
          render :new, status: :unauthorized
        end
      else
        flash.now[:alert] = "入力情報が間違っているか、アカウントが作成されていません！"
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
        logout
        UserMfaSession.destroy
        flash[:notice] = "ログアウトしました！"
        redirect_to root_path, status: :see_other
    end
end
