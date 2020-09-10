# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:id) { 'd4256ca3-2006-4c4d-a25b-f3114762beb4' }
  let(:firstname) { 'John' }
  let(:lastname) { 'Doe' }
  let(:name) { "#{firstname} #{lastname}" }

  subject { described_class.new(id: id, firstname: firstname, lastname: lastname) }

  describe 'implicit_order_column' do
    it 'returns created_at' do
      expect(described_class.implicit_order_column).to eq 'created_at'
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
  end

  describe 'relations' do
    it { is_expected.to have_many :received_follows }
    it { is_expected.to have_many(:followers).through(:received_follows) }

    it { is_expected.to have_many :sent_follows }
    it { is_expected.to have_many(:followeds).through(:sent_follows) }
  end

  describe '#name' do
    it 'returns the name and last name separated by space' do
      expect(subject.name).to eq name
    end
  end

  describe '#attributes' do
    it 'returns the attributes to be serialized' do
      expect(subject.attributes).to eq({
                                         id: id,
                                         firstname: firstname,
                                         lastname: lastname,
                                         name: name
                                       })
    end
  end
end
