class PostImagesController < ApplicationController
  def new
    # 画像投稿の画面を表示するアクションメソッドです。
    # インスタンス変数に空のインスタンスを渡して、画像の投稿ができるようにします。
    @post_image = PostImage.new
  end

  def create
    # createは、投稿データを保存するアクションメソッドです。
    # 投稿データを保存するには、Strong Parametersも必要です。 
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    # 投稿された画像が一覧で表示されるようにします。
    @post_images = PostImage.all
  end

  def show
    # 投稿画像の詳細ページ
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
   # 投稿データのストロングパラメータ
  private
  # post_image_paramsでは、フォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェックしています。
  # PostImageモデルに保存した後、リダイレクトで投稿一覧画面へ戻ります。
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
