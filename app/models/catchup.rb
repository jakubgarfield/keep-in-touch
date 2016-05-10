class Catchup < ActiveRecord::Base
  belongs_to :friend
  validates :scheduled, presence: true
end
