class User < ActiveRecord::Base
  # Remember to create a migration!

  def self.authenticate(email,password)
    @user = User.find_by_email(email)
    if @user == nil 
      return nil
    elsif @user.password == password
      return @user
    else
      return nil
    end
   
  end

end
