class Job < ActiveRecord::Base
  validates_presence_of :title

  acts_as_taggable_on :skills

  scope :actual, -> { where(':now < expires_at', now: Time.now) }

  def related_candidates
    find_related_skills_for(Candidate)
  end

  def matching_and_related_candidates
    candidates = related_candidates.to_a
    self_skills = self.skill_list.sort
    matching_candidates = candidates.select do |candidate|
      self_skills == candidate.skill_list.sort
    end
    candidates = candidates - matching_candidates
    [matching_candidates, candidates]
  end
end
