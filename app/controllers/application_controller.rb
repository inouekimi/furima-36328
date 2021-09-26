class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 最初に実行する :configure_permitted_parametersメソッド実行, もしdeviseに関するコントローラーの処理ならば

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :last_name, :family_name_kana, :last_name_kana, :nickname, :birthday])
  end
end
