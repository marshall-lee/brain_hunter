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
    candidate_skill_set = Set[*skill_list]
    matching_jobs = jobs.select do |job|
      job_skills = job.skill_list
      candidate_skill_set.intersection(job_skills).length == job_skills.length
    end
    jobs = jobs - matching_jobs
    [matching_jobs, jobs]
  end

  def self.all_skills
    tags_on(:skills).pluck(:name)
  end

  def self.all_skills_like(query)
    tags_on(:skills).where("name like :query", query: query).pluck(:name)
  end
end
