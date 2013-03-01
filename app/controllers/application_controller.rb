# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_logined 
  private 
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end 
  helper_method :current_user

  def check_logined 
    if session[:user_id] 
      begin 
        @user = User.find(session[:user_id]) 
      rescue ActiveRecord::RecordNotFound 
        logger.error "セッションの情報(" + session[:user_id] + ")は user_infos には存在しません。" 
        reset_session 
      end 
    end 
    unless @user 
      flash[:referer] = request.fullpath 
      redirect_to login_path, :notice => "ログインしてください" 
    end 
  end 

end
