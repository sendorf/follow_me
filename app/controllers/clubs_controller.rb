# frozen_string_literal: true

class ClubsController < ApplicationController
  def followers
    @club = Club.find(params[:club_id])

    render json: @club.followers
  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def followeds
    @club = Club.find(params[:club_id])

    render json: @club.followeds
  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end
end
