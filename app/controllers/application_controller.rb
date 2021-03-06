class ApplicationController < ActionController::Base
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、
# その前にconfigure_permitted_parametersが実行されます。
  before_action :configure_permitted_parameters, if: :devise_controller?
# ログイン後は投稿一覧画面に遷移するように
  def after_sign_in_path_for(resource)
    post_images_path
  end

  protected
# configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
# 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
# これは、CARAVAN作成時のStrong Parametersと同様の機能です。
# privateは、自分のコントローラ内でしか参照できません。一方、protectedは呼び出された他のコントローラからも参照できます。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
