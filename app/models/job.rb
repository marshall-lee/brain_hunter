class Job < ActiveRecord::Base
  validates_presence_of :title

  acts_as_taggable_on :skills

  scope :actual, -> { where(':now < expires_at', now: Time.now) }
end
