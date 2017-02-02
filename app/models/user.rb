class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable
  
  before_save :assign_role
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

end
