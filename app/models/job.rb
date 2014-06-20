class Job < ActiveRecord::Base
  validates_presence_of :title

  scope :actual, -> { where(':now < expires_at', now: Time.now) }
end
