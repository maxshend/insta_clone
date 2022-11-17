# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :user
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [250, 250]
  end

  validates :title, presence: true
end
