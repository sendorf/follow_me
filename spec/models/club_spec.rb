# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Club, type: :model do
  let(:id) { 'd4256ca3-2006-4c4d-a25b-f3114762beb4' }
  let(:name) { 'Club 1' }

  it_behaves_like 'followable'

  subject { described_class.new(id: id, name: name) }

  describe 'implicit_order_column' do
    it 'returns created_at' do
      expect(described_class.implicit_order_column).to eq 'created_at'
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe '#attributes' do
    it 'returns the attributes to be serialized' do
      expect(subject.attributes).to eq({
                                         id: id,
                                         name: name,
                                         type: described_class.name
                                       })
    end
  end
end
