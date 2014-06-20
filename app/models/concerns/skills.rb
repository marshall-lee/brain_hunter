module Skills
  extend ActiveSupport::Concern

  included do |klass|
    acts_as_taggable_on :skills
    
    def self.all_skills
      tags_on(:skills).pluck(:name)
    end

    def self.all_skills_like(query)
      tags_on(:skills).where("name like :query", query: query).pluck(:name)
    end
  end
end