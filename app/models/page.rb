# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :user
  has_one_attached :cover

  validates :title, presence: true
end
