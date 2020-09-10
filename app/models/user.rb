# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  self.implicit_order_column = 'created_at'

  validates_presence_of :firstname
  validates_presence_of :lastname

  has_many :received_follows, foreign_key: :followed_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, -> { order firstname: :asc, lastname: :asc }, through: :received_follows, source: :follower

  has_many :sent_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followeds, -> { order firstname: :asc, lastname: :asc }, through: :sent_follows, source: :followed

  def attributes
    {
      id: id,
      firstname: firstname,
      lastname: lastname,
      name: name
    }
  end

  def name
    firstname + ' ' + lastname
  end
end
