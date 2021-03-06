class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, message: "Only valid websites allowed" }
  validates :website, presence: true

  belongs_to :user

  def newurl
    @rand = rand(1..8999).to_s
    self.update_attributes(alter: @rand)
    self.save
  end

  def countup
    @count = self.count
    @count += 1
    self.update_attributes(count: @count) 
    self.save
  end
  
 end
