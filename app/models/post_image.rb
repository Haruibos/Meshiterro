class PostImage < ApplicationRecord
  # PostImageモデルにUserモデルを関連付ける
  belongs_to :user
  # 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定します。
 # refileを使用するうえでのルールです。
  attachment :image
end
