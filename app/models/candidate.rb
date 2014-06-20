class Candidate < ActiveRecord::Base
  extend Enumerize

  validates_presence_of :name

  STATUSES = { searching: 1, employed: 2 }
  enumerize :status, in: STATUSES, default: :searching,
    scope: true, predicates: true

  acts_as_taggable_on :skills

  def related_jobs
    find_related_skills_for(Job)
  end
end
