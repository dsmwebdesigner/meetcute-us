class Account < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name

  belongs_to :user
end
