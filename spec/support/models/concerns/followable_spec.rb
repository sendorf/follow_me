# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'followable' do
  let(:user_follower_id) { '0667c143-2548-484f-a4ce-87ede1851627' }
  let(:user_follower_firstname) { 'Jack' }
  let(:user_follower_lastname) { 'Johnson' }
  let(:user_follower) do
    double(User, id: user_follower_id, firstname: user_follower_firstname, lastname: user_follower_lastname,
                 type: 'User', name: name)
  end
  let(:club_follower_id) { '830db970-bb05-463d-91fc-1e614a8146e5' }
  let(:club_follower_name) { 'Best Club' }
  let(:club_follower) { double(Club, id: club_follower_id, name: club_follower_name, type: 'Club') }
  let(:user_followers) { [user_follower] }
  let(:user_followeds) { [user_follower] }
  let(:club_followers) { [club_follower] }
  let(:club_followeds) { [club_follower] }
  let(:followers) { [club_follower, user_follower].compact }
  let(:followeds) { followers }

  before do
    allow(subject).to receive(:user_followers).and_return user_followers
    allow(subject).to receive(:user_followeds).and_return user_followeds
    allow(subject).to receive(:club_followers).and_return club_followers
    allow(subject).to receive(:club_followeds).and_return club_followeds
  end


  describe 'relations' do
    it { is_expected.to have_many :received_follows }
    it { is_expected.to have_many(:user_followers).through(:received_follows) }
    it { is_expected.to have_many(:club_followers).through(:received_follows) }

    it { is_expected.to have_many :sent_follows }
    it { is_expected.to have_many(:user_followeds).through(:sent_follows) }
    it { is_expected.to have_many(:club_followeds).through(:sent_follows) }
  end

  describe '#followers' do
    context 'when there are users and clubs' do
      it 'returns the sorted list of followers' do
        expect(subject.followers).to eq followers
      end
    end

    context 'when there are users but no clubs' do
      let(:club_followers) { [] }

      it 'returns the sorted list of user followers' do
        expect(subject.followers).to eq user_followers
      end
    end

    context 'when there are no users but clubs' do
      let(:user_followers) { [] }

      it 'returns the sorted list of club followers' do
        expect(subject.followers).to eq club_followers
      end
    end

    context 'when there are no users and no clubs' do
      let(:user_followers) { [] }
      let(:club_followers) { [] }

      it 'returns an empty list' do
        expect(subject.followers).to eq []
      end
    end
  end

  describe '#type' do
    described_class.name
  end

  describe '#followeds' do
    context 'when there are users and clubs' do
      it 'returns the sorted list of followeds' do
        expect(subject.followeds).to eq followeds
      end
    end

    context 'when there are users but no clubs' do
      let(:club_followeds) { [] }

      it 'returns the sorted list of user followeds' do
        expect(subject.followeds).to eq user_followeds
      end
    end

    context 'when there are no users but clubs' do
      let(:user_followeds) { [] }

      it 'returns the sorted list of club followeds' do
        expect(subject.followeds).to eq club_followeds
      end
    end

    context 'when there are no users and no clubs' do
      let(:user_followeds) { [] }
      let(:club_followeds) { [] }

      it 'returns an empty list' do
        expect(subject.followeds).to eq []
      end
    end
  end
end