class Catchup < ActiveRecord::Base
  POSTPONED = "postponed"
  SKIPPED = "skipped"
  DONE = "done"
  FINAL_STATES = [DONE, SKIPPED]

  belongs_to :friend
  validates :scheduled, presence: true
  validates :status, inclusion: { in: [POSTPONED, SKIPPED, DONE], allow_nil: true }

  scope :for_email, -> { where(status: [nil, POSTPONED])
                        .where("scheduled <= ?", Time.now)
                        .where("last_email_sent_at IS NULL OR last_email_sent_at < scheduled") }

  def in_final_state?
    FINAL_STATES.include?(status)
  end
end
