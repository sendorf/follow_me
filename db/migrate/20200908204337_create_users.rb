# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
