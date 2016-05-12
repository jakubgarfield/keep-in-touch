class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :catchups, dependent: :destroy

  validates :name, presence: true
  validates :contact, presence: true
  validates :catchup_period, numericality: { only_integer: true, greater_than: 0 }

  def next_catchup
    catchups.order(:scheduled).last
  end
end
