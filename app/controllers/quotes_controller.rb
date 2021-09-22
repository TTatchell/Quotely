# frozen_string_literal: true

# Logic behind quotes (CRUD)
class QuotesController < ApplicationController
  before_action :require_user_logged_in!
  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.user_id = session[:user_id]
    if @quote.save
      redirect_to root_path, notice: 'Posted Quote!'
    else
      render :new
    end
  end

  def edit; end

  def index
    @quotes = Quotes.all.select { |quote| quote.published == true }
  end

  private

  def quote_params
    params.require(:quote).permit(:content, :author, :user)
  end
end
