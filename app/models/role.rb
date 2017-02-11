class Role < ActiveRecord::Base
  has_many :users

  rails_admin do
    visible false
  end
end
