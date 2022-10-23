# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  before do
    visit new_user_session_path
  end

  describe 'with correct page' do
    it { expect(page).to have_content('Sign In') }
  end
end
