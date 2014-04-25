class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :profile
  has_many :workouts
  has_many :taking_food_plans

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friend ,:through => :friendships
  has_many :inbox_message , :class_name => 'Message' , :foreign_key => 'to_id'
  has_many :sent_message , :class_name => 'Message' , :foreign_key => 'from_id'
end
