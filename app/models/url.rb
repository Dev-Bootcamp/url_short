class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, message: "Only valid websites allowed" }
  validates :website, presence: true

  def newurl
    @rand= rand(1..8999).to_s
    self.update_attributes(alter: @rand)
    self.save
  end
  
 end
