# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(User.last, true)

    if @user_session.save
      redirect_to root_url, notice: t('user_sessions.create_success')
    else
      render :new
    end
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
