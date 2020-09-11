# frozen_string_literal: true

class Club < ApplicationRecord
  include ActiveModel::Serializers::JSON
  include Followable

  self.implicit_order_column = 'created_at'

  validates_presence_of :name

  def attributes
    {
      id: id,
      name: name,
      type: type
    }
  end
end
