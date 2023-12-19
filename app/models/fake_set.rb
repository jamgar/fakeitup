class FakeSet < ApplicationRecord
  belongs_to :user
  has_many :fake_set_types, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :fake_set_types,
    reject_if: :all_blank, allow_destroy: true
end
