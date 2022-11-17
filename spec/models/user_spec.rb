# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user }

  describe 'validations' do
    context 'with valid attributes' do
      it { is_expected.to be_valid }
    end

    describe 'email' do
      before { user.email = email }

      context 'with invalid value' do
        let(:email) { 'invalid.email' }

        it { is_expected.not_to be_valid }
      end

      context 'with duplicated value' do
        let!(:another_user) { create :user }
        let(:email) { another_user.email }

        it { is_expected.not_to be_valid }
      end

      context 'with too long value' do
        let(:email) { "#{'a' * EmailValidator::MAXIMUM_LENGTH}#{user.email}" }

        it { is_expected.not_to be_valid }
      end
    end

    describe 'password' do
      before do
        user.assign_attributes password:, password_confirmation: password
      end

      context 'with too short value' do
        let(:password) { 'a' }

        it { is_expected.not_to be_valid }
      end

      context 'without confirmation' do
        let(:password) { user.password }

        before { user.password_confirmation = nil }

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:pages).dependent :destroy }
  end
end
