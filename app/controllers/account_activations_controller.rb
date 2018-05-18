class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      message  = "#{user.name}さん！ ようこそProgra:へ！"
      message += "新機能追加！！：①ユーザー及びコンテンツの検索機能②コンテンツへのリンクの投稿"
      flash[:success] = message
      redirect_to user
    else
      flash[:danger] = "アカウント有効化リンクが無効です。"
      redirect_to root_url
    end
  end
end