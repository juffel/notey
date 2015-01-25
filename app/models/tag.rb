# A Tag is an Object which simply carries a name which references an
# Entity known by the user of the application.
class Tag < ActiveRecord::Base
  has_many :manifestations

  # removes all information from a tag that is not used by 
  # the client; e.g. the creation date
  def strip
    {id: self.id, name: self.name}
  end

  def to_s
    self.name
  end
end
