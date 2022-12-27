# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :check_user_session

  def index
    @pages = policy_scope(Page)
  end
end
