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
    self.role.name == "Admin"
  end

  def user?
    self.role.name == "User"
  end
  
  private

  def assign_role
    if !self.role     
      new_role = User.count == 0 ? "Admin" : "User"
      self.role = Role.find_by_name(new_role)
    end  
   
  end  

end
