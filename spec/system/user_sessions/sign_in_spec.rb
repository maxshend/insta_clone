# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign in' do
  let(:title) { 'Sign In' }

  before do
    visit new_user_session_path
  end

  it { expect(page).to have_content(title) }

  describe 'with correct credentials' do
    let(:password) { 'foobar123' }
    let!(:user) { create(:user, password:) }

    before do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: password

      click_button title
    end

    specify(:aggregate_failures) do
      expect(page).not_to have_content(title)
      expect(page).to have_content('Successfully signed in')
    end
  end
end
