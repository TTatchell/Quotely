# frozen_string_literal: true

# Controller for likes
class LikesController < ApplicationController
  before_action :find_quote
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @quote.likes.create(user_id: Current.user.id)
    end
    # redirect_to quote_path(@quote)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    # redirect_to quote_path(@quote)
    redirect_back(fallback_location: root_path)
  end

  def find_like
    @like = @quote.likes.find(params[:id])
  end

  private

  def find_quote
    @quote = Quote.find(params[:quote_id])
  end

  def already_liked?
    Like.where(user_id: Current.user.id, quote_id:
    params[:quote_id]).exists?
  end
end
