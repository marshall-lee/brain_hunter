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

  def matching_and_related_jobs
    jobs = related_jobs.to_a
    self_skills = self.skill_list.sort
    matching_jobs = jobs.select do |job|
      self_skills == job.skill_list.sort
    end
    jobs = jobs - matching_jobs
    [matching_jobs, jobs]
  end
end
