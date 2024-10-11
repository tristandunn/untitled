# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :email,           null: false, limit: 255
      t.string :password_digest, null: false, limit: 60

      t.timestamps null: false

      t.index :email, unique: true
    end
  end
end
