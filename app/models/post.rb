class Post < ActiveRecord::Base
  #게시글 삭제시 댓글을 같이 삭제함
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :img, ImgUploader

  # 검증(model validation)
  validates :title, presence: {message: "제목을 입력해주세요."},
                    length: {maximum: 30,
                            too_long: "제목은 %{count}자 이내로 입력해주세요." }
  validates :content, presence: {message: "내용을 입력해주세요."}
end
