class User < ActiveRecord::Base
  rolify
  
  acts_as_authentic do |c|
    c.logged_in_timeout = 30.minutes
  end

  authenticates_many :user_sessions
  
  validates_presence_of :login, :password
end
