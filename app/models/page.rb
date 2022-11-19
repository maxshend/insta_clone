# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Page', optional: true

  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [250, 250]
  end

  has_many :sub_pages, class_name: 'Page', foreign_key: :parent_id, dependent: :destroy, inverse_of: :parent

  validates :title, presence: true
end
