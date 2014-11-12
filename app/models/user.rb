class User < ActiveRecord::Base
  # Remember to create a migration!
 has_many :running_games


  validates :password, :username, presence: true
  validates :username, length: { minimum: 3 }

  def self.authenticate(username, password)
    # if username and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.where username: username #find_by can't use count
    if user.count != 0
      if user[0].password == password
        return user[0]
      end
    end
    return nil
  end
end
