# frozen_string_literal: true

# Logic behind quotes (CRUD)
class QuotesController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new
  end

  def edit; end

  def index; end
end
