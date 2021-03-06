class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post 

  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }
  before_save :format_name

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password

  enum role: [:member, :admin, :moderator]

  def format_name
    if name
      first_and_last_name = name.split
      
      first_and_last_name.each do |name_part|
        name_part.capitalize!
      end
      self.name = first_and_last_name.join(" ")
    end
  end
  
  def get_favorite_for(post)
    favorites.where(post_id: post.id).first
  end
   
  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "//gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
