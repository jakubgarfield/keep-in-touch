class Catchup < ActiveRecord::Base
  POSTPONED = "postponed"
  SKIPPED = "skipped"
  DONE = "done"

  belongs_to :friend
  validates :scheduled, presence: true
  validates :status, inclusion: { in: [POSTPONED, SKIPPED, DONE], allow_nil: true }

  def in_final_state?
    [Catchup::DONE, Catchup::SKIPPED].include?(status)
  end
end
