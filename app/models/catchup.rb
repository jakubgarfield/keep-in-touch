class Catchup < ActiveRecord::Base
  POSTPONED = "postponed"
  SKIPPED = "skipped"
  DONE = "done"

  belongs_to :friend
  validates :scheduled, presence: true
  validates :status, inclusion: { in: [POSTPONED, SKIPPED, DONE], allow_nil: true }
end
