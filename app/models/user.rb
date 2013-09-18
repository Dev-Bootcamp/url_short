class User < ActiveRecord::Base
  # Remember to create a migration!

  has_many :urls

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

  def websites
    self.urls.each do |url|
      url.website
    end
  end

end
