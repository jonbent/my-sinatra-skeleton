class User < ActiveRecord::Base








	def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    valid_user = User.find_by(email: email)
    valid_user.password == password ? valid_user : nil
  end

end