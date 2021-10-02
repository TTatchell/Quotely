# frozen_string_literal: true

# Logic behind quotes (CRUD)
class QuotesController < ApplicationController
  before_action :require_user_logged_in!

  def new
    @quote = Quote.new
    @maximum_length = Quote.validators_on(:content).first.options[:maximum]
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

  def edit
    @quote = Quote.find(params[:id])
    @maximum_length = Quote.validators_on(:content).first.options[:maximum]
  end

  def update
    @quote = Quote.find(params[:id])
    redirect_to root_path, notice: 'You Do Not Own This Quote!' and return unless does_user_own_this?(@quote)

    if @quote.update(quote_params)
      redirect_to root_path, notice: 'Quote updated!'
    else
      render :edit
    end
  end

  def index
    @quotes = Quote.published
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def user_feed
    @quotes = Quote.all.select { |quote| quote.user_id == session[:user_id] }
  end

  def destroy
    @quote = Quote.find(params[:id]).destroy
    redirect_to root_path, notice: 'Quote Deleted!'
  end

  private

  def quote_params
    params.require(:quote).permit(:id, :content, :author, :user, :published)
  end

  def does_user_own_this?(quote)
    quote.user_id == session[:user_id]
  end
end
