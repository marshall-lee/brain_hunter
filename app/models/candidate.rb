class Candidate < ActiveRecord::Base
  extend Enumerize

  STATUSES = { searching: 1, employed: 2 }
  enumerize :status, in: STATUSES, default: :searching,
    scope: true, predicates: true
end
