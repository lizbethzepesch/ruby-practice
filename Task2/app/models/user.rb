class User < ApplicationRecord
  belongs_to :coach, optional: true

  has_many :user_notifications

  has_and_belongs_to_many :problems

  has_many :ratings
  has_many :techniques, through: :ratings

  has_many :invitations
  has_many :coaches, through: :invitations

  has_many :recommendations
  has_many :coaches, through: :recommendations

  has_many :recommendations
  has_many :techniques, through: :recommendations

  has_one_attached :avatar_user

  has_secure_password

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x


  validates :password, presence: true, format: { with: PASSWORD_FORMAT }, allow_nil: true
  validates :age, presence: false
  validates :abouts, presence: false
  validates :gender, presence: false
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  enum gender: [ :male, :female ]

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
        user.name = auth['info']['first_name'] + ' '+auth['info']['last_name']
        user.email = auth['info']['email']
        user.password = SecureRandom.hex(8)+"!"+"A"
    end
  end
end
