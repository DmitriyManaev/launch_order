class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable
  
  before_save :assign_role, :set_access_token
  belongs_to :role

  def admin?
    has_role? "Admin"
  end

  def user?
    has_role? "User"
  end
  
  private

  def has_role? role
    self.role.name == role
  end  

  def assign_role
    if !self.role  
      new_role = User.count == 0 ? "Admin" : "User"
      self.role = Role.find_by_name(new_role)
    end
  end 

  def set_access_token
    self.access_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(access_token: token).exists?
    end
  end
end
