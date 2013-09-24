class Tweet < ActiveRecord::Base
  belongs_to :player
  scope :in_last_week, :conditions => [ "post_date > ?", 1.week.ago ]
end
