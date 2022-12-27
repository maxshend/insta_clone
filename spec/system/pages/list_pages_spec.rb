# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List pages', type: :system do
  let(:sign_in_title) { 'Sign In' }

  context 'when authenticated' do
    before do
      visit pages_path
    end

    include_context 'when user authenticated'

    let_it_be(:user_page) { create :page, user: current_user }

    specify(:aggregate_failures) do
      expect(page).to have_content(user_page.title)
      expect(page).not_to have_content(sign_in_title)
    end
  end

  context 'when unauthenticated' do
    before do
      visit pages_path
    end

    it { expect(page).to have_content(sign_in_title) }
  end
end
