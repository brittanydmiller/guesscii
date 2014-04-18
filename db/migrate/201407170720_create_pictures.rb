require_relative '../config'

class CreatePictures  < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :answer
      t.string :location, :unique => true
      t.integer :lines
      t.timestamps
    end
  end
end