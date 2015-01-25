# A Manifestation is used to connect a point in time (or a time
# interval) to a Tag.
class Manifestation < ActiveRecord::Base
  belongs_to :tag

  # returns a hash with the data of this manifestation but without
  # the data that is not used by the client
  def strip
    {id: self.id, tag_id: self.tag_id, date: self.date, till_date: self.till_date}
  end
end
