class Job < ActiveRecord::Base
  include Skills

  validates_presence_of :title

  scope :actual, -> { where(':now < expires_at', now: Time.now) }

  def related_candidates
    find_related_skills_for(Candidate)
  end

  def matching_and_related_candidates
    candidates = related_candidates.to_a
    job_skill_set = Set[*skill_list]
    matching_candidates = candidates.select do |candidate|
      candidate_skills = candidate.skill_list
      job_skill_set.intersection(candidate_skills).length == job_skill_set.length
    end
    candidates = candidates - matching_candidates
    [matching_candidates, candidates]
  end
end
