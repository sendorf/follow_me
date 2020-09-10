# frozen_string_literal: true

class UsersController < ApplicationController
  def followers
    @user = User.find(params[:user_id])

    render json: @user.followers
  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end
end
