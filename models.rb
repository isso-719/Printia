ActiveRecord::Base.establish_connection("sqlite3:db/development.db")

class User < ActiveRecord::Base
  has_secure_password

  validates :username,
      presence: true,
      uniqueness: true,
      length: {in: 5..15},
      format: { with: /\A[A-Za-z0-9]+\z/ }
  validates :mail,
      presence: true,
      uniqueness: true,
      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,
      length: {in: 7..15}

  has_many :contents
end

class Content < ActiveRecord::Base
  belongs_to :user

  validates :img_description,
    length: { maximum: 20 }

  include FriendlyId
  friendly_id :img_random

  before_create do
  self.img_random = SecureRandom.hex(10)
  end

end

class Group < ActiveRecord::Base
  belongs_to :user

  validates :img_description,
    length: { maximum: 20 }

  include FriendlyId
  friendly_id :img_random

  before_create do
  self.img_random = SecureRandom.hex(10)
  end

end