class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoustable and :omniauthable
  has_many :comments 
  has_many :blogposts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_email

  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_welcome_email
  end

end
