# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::Serializers::JSON
  include Followable

  self.implicit_order_column = 'created_at'

  validates_presence_of :firstname
  validates_presence_of :lastname

  def attributes
    {
      id: id,
      firstname: firstname,
      lastname: lastname,
      name: name,
      type: type
    }
  end

  def name
    firstname + ' ' + lastname
  end
end
