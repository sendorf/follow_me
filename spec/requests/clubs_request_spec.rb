# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clubs', type: :request do
  let(:club_id) { 'd4256ca3-2006-4c4d-a25b-f3114762beb4' }
  let(:user_follower_id) { '0667c143-2548-484f-a4ce-87ede1851627' }
  let(:user_follower_firstname) { 'Jack' }
  let(:user_follower_lastname) { 'Johnson' }
  let(:club) { double(Club, id: club_id) }
  let(:user_follower) do
    { id: user_follower_id, firstname: user_follower_firstname, lastname: user_follower_lastname, type: 'User' }
  end
  let(:club_follower_id) { '830db970-bb05-463d-91fc-1e614a8146e5' }
  let(:club_follower_name) { 'Best Club' }
  let(:club_follower) { { id: club_follower_id, name: club_follower_name, type: 'Club' } }
  let(:followers) { [club_follower, user_follower] }
  let(:followeds) { followers }

  describe '#followers' do
    describe 'request list of all followers of a user' do
      before do
        allow(club).to receive(:followers).and_return followers
      end

      context 'when the user exists' do
        before do
          allow(Club).to receive(:find).with(club_id).and_return club
        end

        context 'when the list is empty' do
          let(:followers) { [] }

          it 'returns an empty collection' do
            get club_followers_path(club_id: club_id)
            expect(response).to be_successful
            expect(response.body).to eq followers.to_json
          end
        end

        context 'when there is a follower' do
          it 'returns the collection' do
            get club_followers_path(club_id: club_id)
            expect(response).to be_successful
            expect(response.body).to eq followers.to_json
          end
        end
      end

      context 'when the user doesn\'t exists' do
        let(:error_body) { { message: "Couldn't find Club with 'id'=#{club_id}" } }

        it 'returns an error' do
          get club_followers_path(club_id: club_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end

      context 'when there\'s an error' do
        let(:error_body) { { message: error_message } }
        let(:error_message) { 'Error message' }

        before do
          expect(Club).to receive(:find).with(club_id).and_raise StandardError.new(error_message)
        end

        it 'returns an error with the error message' do
          get club_followers_path(club_id: club_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end
    end
  end

  describe '#followeds' do
    describe 'request list of user followed people' do
      before do
        allow(club).to receive(:followeds).and_return followeds
      end

      context 'when the user exists' do
        before do
          allow(Club).to receive(:find).with(club_id).and_return club
        end

        context 'when the list is empty' do
          let(:followeds) { [] }

          it 'returns an empty collection' do
            get club_followeds_path(club_id: club_id)
            expect(response).to be_successful
            expect(response.body).to eq followeds.to_json
          end
        end

        context 'when there is a followed' do
          it 'returns the collection' do
            get club_followeds_path(club_id: club_id)
            expect(response).to be_successful
            expect(response.body).to eq followeds.to_json
          end
        end
      end

      context 'when the user doesn\'t exists' do
        let(:error_body) { { message: "Couldn't find Club with 'id'=#{club_id}" } }

        it 'returns an error' do
          get club_followeds_path(club_id: club_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end

      context 'when there\'s an error' do
        let(:error_body) { { message: error_message } }
        let(:error_message) { 'Error message' }

        before do
          expect(Club).to receive(:find).with(club_id).and_raise StandardError.new(error_message)
        end

        it 'returns an error with the error message' do
          get club_followeds_path(club_id: club_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end
    end
  end
end
