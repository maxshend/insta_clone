# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'when user authenticated' do
  let_it_be(:pswd) { 'password123' }
  let_it_be(:current_user) { create :user, password: pswd, password_confirmation: pswd }

  before do
    visit new_user_session_path

    fill_in 'Email', with: current_user.email
    fill_in 'Password', with: pswd

    click_button 'Sign In'
  end
end
