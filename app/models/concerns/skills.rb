module Skills
  extend ActiveSupport::Concern

  included do |klass|
    acts_as_taggable_on :skills

    def self.all_skill_tags
      tags_on(:skills)
    end

    def self.all_skill_tags_like(query)
      all_skill_tags.where("name like :query", query: query)
    end

    def self.all_skills
      all_skill_tags.pluck(:name)
    end

    def self.all_skills_like(query, options = {})
      all_skill_tags_like(query).pluck(:name)
    end
  end
end