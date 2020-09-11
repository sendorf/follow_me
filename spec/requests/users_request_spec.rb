# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user_id) { 'd4256ca3-2006-4c4d-a25b-f3114762beb4' }
  let(:follower_id) { '0667c143-2548-484f-a4ce-87ede1851627' }
  let(:follower_firstname) { 'Jack' }
  let(:follower_lastname) { 'Jack' }
  let(:user) { double(User, id: user_id) }
  let(:follower) { { id: follower_id, firstname: follower_firstname, lastname: follower_lastname } }
  let(:followers) { [follower] }
  let(:followeds) { followers }

  describe '#followers' do
    describe 'request list of all followers of a user' do
      before do
        allow(user).to receive(:followers).and_return followers
      end

      context 'when the user exists' do
        before do
          allow(User).to receive(:find).with(user_id).and_return user
        end

        context 'when the list is empty' do
          let(:followers) { [] }

          it 'returns an empty collection' do
            get user_followers_path(user_id: user_id)
            expect(response).to be_successful
            expect(response.body).to eq followers.to_json
          end
        end

        context 'when there is a follower' do
          it 'returns the collection' do
            get user_followers_path(user_id: user_id)
            expect(response).to be_successful
            expect(response.body).to eq followers.to_json
          end
        end
      end

      context 'when the user doesn\'t exists' do
        let(:error_body) { { message: "Couldn't find User with 'id'=#{user_id}" } }

        it 'returns an error' do
          get user_followers_path(user_id: user_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end

      context 'when there\'s an error' do
        let(:error_body) { { message: error_message } }
        let(:error_message) { 'Error message' }

        before do
          expect(User).to receive(:find).with(user_id).and_raise StandardError.new(error_message)
        end

        it 'returns an error with the error message' do
          get user_followers_path(user_id: user_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end
    end
  end

  describe '#followeds' do
    describe 'request list of user followed people' do
      before do
        allow(user).to receive(:followeds).and_return followeds
      end

      context 'when the user exists' do
        before do
          allow(User).to receive(:find).with(user_id).and_return user
        end

        context 'when the list is empty' do
          let(:followers) { [] }

          it 'returns an empty collection' do
            get user_followeds_path(user_id: user_id)
            expect(response).to be_successful
            expect(response.body).to eq followeds.to_json
          end
        end

        context 'when there is a followed' do
          it 'returns the collection' do
            get user_followeds_path(user_id: user_id)
            expect(response).to be_successful
            expect(response.body).to eq followeds.to_json
          end
        end
      end

      context 'when the user doesn\'t exists' do
        let(:error_body) { { message: "Couldn't find User with 'id'=#{user_id}" } }

        it 'returns an error' do
          get user_followeds_path(user_id: user_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end

      context 'when there\'s an error' do
        let(:error_body) { { message: error_message } }
        let(:error_message) { 'Error message' }

        before do
          expect(User).to receive(:find).with(user_id).and_raise StandardError.new(error_message)
        end

        it 'returns an error with the error message' do
          get user_followeds_path(user_id: user_id)
          expect(response.status).to eq 422
          expect(response.body).to eq error_body.to_json
        end
      end
    end
  end
end
