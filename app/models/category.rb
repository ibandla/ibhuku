<<<<<<< HEAD
class Category < ActiveRecord::Base
  has_many :ebooks, :dependent => :restrict_with_error
end
=======
class Category < ActiveRecord::Base
  has_many :ebooks
end
>>>>>>> a65c98790070bd935e20ebb72a496469b07f943a
