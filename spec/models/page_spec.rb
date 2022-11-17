# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  subject(:page) { build :page }

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe 'associations' do
    specify(:aggregate_failures) do
      expect(page).to belong_to :user
      expect(page).to have_one_attached :cover
    end
  end
end
