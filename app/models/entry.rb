class Entry < ApplicationRecord
  validates :source_uuid, :post_raw_data, presence: true

  validates_uniqueness_of :source_uuid
end
